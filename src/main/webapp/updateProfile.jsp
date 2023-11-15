<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@ page import="user.UserDAO" %>

<%
String userID = (String) session.getAttribute("userID");

if (userID != null) {
    String userPassword = request.getParameter("userPassword");
    String userEmail = request.getParameter("userEmail");
    String nickName = request.getParameter("nickName");
    
    UserDAO userDAO = new UserDAO();
    String existingUserEmail = (String) session.getAttribute("userEmail");
    String existingNickName = (String) session.getAttribute("nickName");
    
    // Update only if the fields are not empty and not equal to existing values
    if (userPassword != null && !userPassword.isEmpty()) {
        userDAO.updateUserPassword(userID, userPassword);
    }
    if (userEmail != null && !userEmail.isEmpty() && !userEmail.equals(existingUserEmail)) {
        userDAO.updateUserEmail(userID, userEmail);
        session.setAttribute("userEmail", userEmail); // Update session attribute
    }
    if (nickName != null && !nickName.isEmpty() && !nickName.equals(existingNickName)) {
        userDAO.updateUserNickname(userID, nickName);
        session.setAttribute("nickName", nickName); // Update session attribute
    }

    // Redirect back to the myPage.jsp after updating
    response.sendRedirect("myPage.jsp");
} else {
    // Handle the case where userID is null
    response.sendRedirect("login.jsp"); // Redirect to login page
}
%>