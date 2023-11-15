<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Comment" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    
    // 로그인 여부 확인
    String userID = (String) session.getAttribute("userID");
    
    // 로그인이 되어 있지 않은 경우 로그인 페이지로 이동
    if (userID == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int bbsID = 0;
    try {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    } catch (NumberFormatException e) {
        // 유효하지 않은 bbsID일 경우 처리
        response.sendRedirect("bbs.jsp");
        return;
    }
    
    String commentContent = request.getParameter("commentContent");
    
    if (commentContent != null && !commentContent.trim().isEmpty()) {
        BbsDAO bbsDAO = new BbsDAO();
        Comment comment = new Comment();
        comment.setBbsID(bbsID);
        comment.setUserID(userID);
        comment.setCommentContent(commentContent);
        
        // UserDAO를 사용하여 닉네임 가져오기
        UserDAO userDAO = new UserDAO();
        String userNickname = userDAO.getNickname(userID);
        if (userNickname != null) {
            comment.setNickname(userNickname);
        }
        
        // 현재 날짜를 댓글 작성일자로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        comment.setCommentDate(dateFormat.format(new Date()));
        
        // addComment 메서드 호출하여 댓글 추가
        bbsDAO.addComment(bbsID, comment);
    }
    
    response.sendRedirect("view.jsp?bbsID=" + bbsID);
%>