<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>

<%
String bbsID = request.getParameter("bbsID");
int index = Integer.parseInt(request.getParameter("index"));

BbsDAO bbsDAO = new BbsDAO();

// 게시글 좋아요 동작 체크를 위한 세션 변수명
String sessionLikeKey = "liked_" + bbsID;

// 이미 좋아요를 눌렀는지 확인
boolean alreadyLiked = false;
if (session.getAttribute(sessionLikeKey) != null) {
    alreadyLiked = true;
}

if (!alreadyLiked) {
    bbsDAO.incrementLikeCount(Integer.parseInt(bbsID)); // 좋아요 카운트 증가

    // 좋아요 카운트를 새로운 값으로 업데이트하여 클라이언트에 전달
    int newLikeCount = bbsDAO.getLikeCount(Integer.parseInt(bbsID));
    out.print(newLikeCount);

    // 클라이언트에서 업데이트된 카운트를 받아서 좋아요 수 업데이트
    session.setAttribute(sessionLikeKey, true); // 사용자가 해당 게시글에 좋아요를 눌렀음을 세션에 표시

} else {
    // 이미 좋아요를 눌렀을 경우 alert 메시지 출력
    out.print("alreadyLiked");
}

bbsDAO.close();
%>
