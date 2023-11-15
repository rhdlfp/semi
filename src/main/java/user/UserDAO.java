package user;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import user.User.UserInfo;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String JDBC_DRIVER = "org.h2.Driver";
			String JDBC_URL = "jdbc:h2:tcp://localhost/C:/STUDY/jwbookdb";
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
    public void updateUserEmail(String userID, String newEmail) {
        String sql = "UPDATE userss SET userEmail = ? WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newEmail);
            pstmt.setString(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserNickname(String userID, String newNickname) {
        String sql = "UPDATE userss SET nickName = ? WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newNickname);
            pstmt.setString(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserPassword(String userID, String newPassword) {
        String sql = "UPDATE userss SET userPassword = ? WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public int login(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM USERSS WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호가 불일치
				}
			}
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; //데이터베이스 오류
	}
	
	
    public UserInfo getUserInfo(String userID) {
        String sql = "SELECT userName, userEmail, nickName FROM USERSS WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String userName = rs.getString("userName");
                String userEmail = rs.getString("userEmail");
                String nickName = rs.getString("nickName");
                return new UserInfo(userName, userEmail, nickName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	
    public int join(User user) {
        String sql = "INSERT INTO USERSS VALUES(?,?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getNickName());
            pstmt.setString(5, user.getUserGender());
            pstmt.setString(6, user.getUserEmail());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
	

    public String findByUserId(String userName, String userEmail) {
        String userID = null;

        try {
            String query = "SELECT userID FROM USERSS WHERE userName = ? AND userEmail = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userName);
            pstmt.setString(2, userEmail);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                userID = rs.getString("userID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return userID;
    }
	
	
    public String resetUserPassword(String userID, String userEmail) {
        String userPassword = null;

        try {
            String query = "SELECT userPassword FROM USERSS WHERE userID = ? AND userEmail = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userID);
            pstmt.setString(2, userEmail);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                userPassword = rs.getString("userPassword");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return userPassword;
    }
    
    
    
    
    
	 public void dropout(String userPassword) {
	        try {
	            String sql = "DELETE FROM USERSS WHERE userPassword = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userPassword);
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	 }
    
    
    public int addToWishlist(String userID, String itemName) {
        String sql = "INSERT INTO Wishlist (userID, itemName) VALUES (?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, itemName);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Database error
    }

//    public ArrayList<String> getWishlist(String userID) {
//        ArrayList<String> wishList = new ArrayList<>();
//        try {
//            String sql = "SELECT itemName FROM Wishlist WHERE userID = ?";
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, userID);
//            rs = pstmt.executeQuery();
//            while (rs.next()) {
//                wishList.add(rs.getString("itemName"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return wishList;
//    }
    public ArrayList<Integer> getWishlist(String userID) {
        ArrayList<Integer> wishList = new ArrayList<>();
        try {
            String sql = "SELECT itemName FROM Wishlist WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                wishList.add(rs.getInt("itemName")); // int 형식으로 가져오도록 수정
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wishList;
    }

       
    public int deleteWishlist(String wishid) {
        int result = 0;
        try {
            String sql = "DELETE FROM Wishlist WHERE wishid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, wishid);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean deleteWishlistItem(String userID, String itemName) {
        try {
            String sql = "DELETE FROM Wishlist WHERE userID = ? AND itemName = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, itemName);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // 삭제된 행이 하나 이상일 경우 true 반환
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 삭제 실패한 경우
    }

    
    public User getUser(String userID) {
        String sql = "SELECT * FROM USERSS WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getString("userID"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setUserName(rs.getString("userName"));
                user.setNickName(rs.getString("nickName"));
                user.setUserGender(rs.getString("userGender"));
                user.setUserEmail(rs.getString("userEmail"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 새로운 메서드 추가: userID에 해당하는 User의 닉네임 가져오기
    public String getNickname(String userID) {
        String sql = "SELECT nickName FROM USERSS WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString("nickName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}















