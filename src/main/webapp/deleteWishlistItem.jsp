<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>  
<% request.setCharacterEncoding("UTF-8"); %>

<%
String wishid = request.getParameter("wishid");
out.println("wishid: " + wishid);
UserDAO userDAO = new UserDAO();
int result = userDAO.deleteWishlist(wishid);

if (result > 0) {
    response.sendRedirect("myPage.jsp");
} else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('삭제에 실패했습니다.');");
    script.println("history.back();");
    script.println("</script>");
}
%>
