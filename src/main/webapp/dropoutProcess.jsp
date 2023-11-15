<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
    <%
    String userPassword = request.getParameter("userPassword");
    UserDAO dao = new UserDAO();
    dao.dropout(userPassword);
    session.invalidate();
    %>
    
    <script>
        alert('정상 탈퇴 처리 되었습니다.');
        location.href = 'mainPage.jsp';    
    </script>
</body>
</html>
