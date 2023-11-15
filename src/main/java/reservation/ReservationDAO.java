package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ReservationDAO() {
        try {
            String JDBC_DRIVER = "org.h2.Driver";
            String JDBC_URL = "jdbc:h2:tcp://localhost/C:/STUDY/jwbookdb";
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public CarInformation getCarInfo(int carID) {
        CarInformation carInfo = null;

        try {
            String query = "SELECT carname, carprice, img FROM CarInformation WHERE carid = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, carID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                carInfo = new CarInformation();
                carInfo.setCarID(carID);
                carInfo.setCarName(rs.getString("carname"));
                carInfo.setCarPrice(rs.getInt("carprice"));
                carInfo.setCarImage(rs.getString("img")); // 이미지 정보 설정
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carInfo;
    }

    public boolean reserve(String startDateStr, String endDateStr, String userID, int carID, int totalprice) {
        boolean success = false;

        try {
            CarInformation carInfo = getCarInfo(carID);
            int carPrice = carInfo.getCarPrice();

            String insertQuery = "INSERT INTO carReservation (userID, startdate, enddate, carID, Rentalprice) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, userID);
            pstmt.setDate(2, java.sql.Date.valueOf(startDateStr));
            pstmt.setDate(3, java.sql.Date.valueOf(endDateStr));
            pstmt.setInt(4, carID);
            pstmt.setInt(5, totalprice);

            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();

            success = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // ... 이전 코드 ...
        }

        return success;
    }
    
    
    public ArrayList<Reservation> getReservations(String userID) {
        ArrayList<Reservation> reservations = new ArrayList<>();

        try {
            String query = "SELECT * FROM carReservation WHERE userID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationID(rs.getInt("id"));
                reservation.setCarID(rs.getInt("carID"));
                reservation.setUserID(rs.getString("userID"));
                reservation.setStartDate(rs.getString("startdate"));
                reservation.setEndDate(rs.getString("enddate"));
                reservation.setRentalPrice(rs.getInt("Rentalprice"));

                reservations.add(reservation);
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }
    
    
    public boolean cancelReservation(int reservationID) {
        boolean success = false;

        try {
            String deleteQuery = "DELETE FROM carReservation WHERE id = ?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, reservationID);

            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();

            success = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // ... 이전 코드 ...
        }

        return success;
    }
    
    
    public ArrayList<String> getReservedDatesByUserAndCar(String userID, int carID) {
        ArrayList<String> reservedDates = new ArrayList<>();

        try {
            String query = "SELECT startdate, enddate FROM carReservation WHERE userID = ? AND carID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userID);
            pstmt.setInt(2, carID);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String startDate = rs.getString("startdate");
                String endDate = rs.getString("enddate");
                // 예약된 날짜들을 리스트에 추가
                reservedDates.add(startDate);
                reservedDates.add(endDate);
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservedDates;
    }
    
    
    public List<String> getReservedDatesBetween(int carID) {
        List<String> reservedDates = new ArrayList<>(); // 예약된 날짜를 저장할 리스트를 생성합니다.

        try {
            String query = "SELECT startdate, enddate FROM carReservation WHERE carID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, carID);
            rs = pstmt.executeQuery(); // carID에 해당하는 예약된 날짜 정보를 데이터베이스에서 조회합니다.

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 날짜를 원하는 형식으로 변환하기 위한 포맷터를 생성합니다.

            while (rs.next()) { // 결과셋을 반복하면서 예약된 날짜 정보를 가져옵니다.
                String startDateStr = rs.getString("startdate"); // 데이터베이스에서 시작 날짜를 가져옵니다.
                String endDateStr = rs.getString("enddate"); // 데이터베이스에서 종료 날짜를 가져옵니다.

                try {
                    LocalDate startDate = LocalDate.parse(startDateStr, formatter); // 문자열 형태의 시작 날짜를 LocalDate 객체로 변환합니다.
                    LocalDate endDate = LocalDate.parse(endDateStr, formatter); // 문자열 형태의 종료 날짜를 LocalDate 객체로 변환합니다.

                    LocalDate currentDate = startDate; // 시작 날짜부터 시작하여 반복할 변수를 설정합니다.
                    while (!currentDate.isAfter(endDate)) { // 시작 날짜부터 종료 날짜까지 반복합니다.
                        reservedDates.add(currentDate.format(formatter)); // 현재 날짜를 원하는 형식으로 변환하여 리스트에 추가합니다.
                        currentDate = currentDate.plusDays(1); // 다음 날짜로 이동합니다.
                    }
                } catch (Exception e) {
                    e.printStackTrace(); // 예외 처리: 날짜 파싱 등의 오류가 발생하면 오류 메시지를 출력합니다.
                }
            }

            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리: SQL 실행 등의 오류가 발생하면 오류 메시지를 출력합니다.
        }

        return reservedDates; // 예약된 날짜 목록을 반환합니다.
    }




}
