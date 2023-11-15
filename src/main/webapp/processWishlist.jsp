<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>

<%
    String infoid = request.getParameter("infoid");
    String userID = (String) session.getAttribute("userID"); // 이 부분은 세션에 저장된 userID를 얻어오는 방식으로 변경해야 합니다.
    
    if (infoid != null && userID != null) {
        UserDAO userDAO = new UserDAO();
        int result = userDAO.addToWishlist(userID, infoid);
        if (result > 0) {
            response.setStatus(200); // 성공적으로 처리되었음을 응답에 명시
        } else {
            response.setStatus(500); // 오류 발생했음을 응답에 명시
        }
    } else {
        response.setStatus(400); // 요청 파라미터가 부족함을 응답에 명시
    }
%>