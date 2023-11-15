<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="chacamList.ChacamListDAO" %>

<%
String infoid = request.getParameter("infoid");
int index = Integer.parseInt(request.getParameter("index"));

ChacamListDAO chacamDAO = new ChacamListDAO();

// 게시글 좋아요 동작 체크를 위한 세션 변수명
String sessionLikeKey = "liked_" + infoid;

// 이미 좋아요를 눌렀는지 확인
boolean alreadyLiked = false;
if (session.getAttribute(sessionLikeKey) != null) {
    alreadyLiked = true;
}

if (!alreadyLiked) {
    String userID = (String) session.getAttribute("userID");
    if (userID != null) {
        if (chacamDAO.checkAlreadyLiked(Integer.parseInt(infoid), userID)) {
            // 이미 좋아요를 눌렀을 경우 alert 메시지 출력
            out.print("alreadyLiked");
        } else {
            chacamDAO.incrementLikeCount(Integer.parseInt(infoid), userID); // 좋아요 카운트 증가

            // 좋아요 카운트를 새로운 값으로 업데이트하여 클라이언트에 전달
            int newLikeCount = chacamDAO.getLikeCount(Integer.parseInt(infoid));
            out.print(newLikeCount);

            // 클라이언트에서 업데이트된 카운트를 받아서 좋아요 수 업데이트
            session.setAttribute(sessionLikeKey, true); // 사용자가 해당 게시글에 좋아요를 눌렀음을 세션에 표시
        }
    } else {
        // 로그인되지 않은 사용자
        out.print("notLoggedIn");
    }
} else {
    // 이미 좋아요를 눌렀을 경우 alert 메시지 출력
    out.print("alreadyLiked");
}
%>
