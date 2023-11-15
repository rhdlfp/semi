<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO"%>


<%
String action = request.getParameter("action");
if (action != null && action.equals("reserve")) {
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String userID = request.getParameter("userID");
    int carID = Integer.parseInt(request.getParameter("carID"));
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice")); // total-price 값을 가져옴

    ReservationDAO dao = new ReservationDAO();
    boolean success = dao.reserve(startDate, endDate, userID, carID, totalPrice); // total-price 값을 메소드에 전달

    if (success) {
        response.getWriter().write("예약 성공");
    } else {
        response.getWriter().write("예약 실패");
    }
}
%>

    
<%--     if (success) {
%>
        <script>
            alert("예약이 성공적으로 완료되었습니다.");
            location.href = "myPage.jsp"; // 예약이 성공하면 myPage.jsp로 이동
        </script>
<%
    } else {
%>
        <script>
            alert("예약에 실패하였습니다.");
            history.back(); // 예약 실패 시 이전 페이지로 이동
        </script>
<%
    }
}
%> --%>