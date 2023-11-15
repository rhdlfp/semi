<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.User" %>

<%
String itemName = request.getParameter("itemName");
String userID = request.getParameter("userID");

UserDAO dao = new UserDAO();

if (dao.deleteWishlistItem(userID, itemName)) {
    response.sendRedirect("myPage.jsp");
} else {
    out.println("삭제에 실패하였습니다.");
}
%>
