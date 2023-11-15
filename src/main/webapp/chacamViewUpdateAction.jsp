<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="chacamList.ChacamListDAO"%>
<%@ page import="chacamList.ChacamList"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">

<title>chacamViewUpdateAction</title>
</head>
<body>
    <%
    String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
    }
    if(userID == null){
      PrintWriter script = response.getWriter();
   	  script.println("<script>");
   	  script.println("alert('로그인을 하세요.')");
   	  script.println("location.href = '/semiProject/login.jsp'");
   	  script.println("</script>");
    }
    
	int infoid = 0;
	if (request.getParameter("infoid") != null) {
		infoid = Integer.parseInt(request.getParameter("infoid"));
	}

	if (infoid == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = '/semiProject/chacamList'");
		script.println("</script>");
	}
	ChacamList chacamList = new ChacamListDAO().getChacam(infoid);
	if (!userID.equals(chacamList.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'chacamList'");
		script.println("</script>");
	} else{
		ChacamListDAO chacamDAO = new ChacamListDAO();
    	         int result = chacamDAO.update(infoid, request.getParameter("infotitle"), request.getParameter("infoaddress"), request.getParameter("content"));
    	         
    	         PrintWriter script = response.getWriter();
    	         
    	         if(result == -1){
    	          	  script.println("<script>");
    	          	  script.println("alert('글 수정에 실패했습니다.')");
    	          	  script.println("history.back()");
    	          	  script.println("</script>");
    	          	  
    	         }else{
    	       	  script.println("<script>");
    	       	  script.println("location.href = '/semiProject/chacamList'");
    	       	  script.println("</script>");
    	         }
        }
    
   
     
   
    %>
    
 </body>
</html>














