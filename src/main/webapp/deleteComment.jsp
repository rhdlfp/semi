<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Comment"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 로그인 여부 확인
    String userID = (String) session.getAttribute("userID");
    
    if (userID == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int commentID = Integer.parseInt(request.getParameter("commentID"));
    BbsDAO bbsDAO = new BbsDAO();
    
    // 해당 댓글의 userID 가져오기
    String commentUserID = bbsDAO.getCommentUserID(commentID);
    
    // 댓글을 작성한 사용자만 댓글을 삭제할 수 있도록 처리
    if (commentUserID != null && commentUserID.equals(userID)) {
%>
        <script>
            if (confirm("댓글을 삭제하시겠습니까?")) {
                // 댓글 삭제 처리
                var result = <%= bbsDAO.deleteComment(commentID, userID) %>;
                if (result > 0) {
                    // 삭제 성공 시 목록 페이지로 이동
                    /* location.href = "bbs.jsp"; // 수정: 목록 페이지 URL로 변경 */
                    location.href = "view.jsp?bbsID=<%= request.getParameter("bbsID") %>";
                } else {
                    // 삭제 실패
                    alert('댓글 삭제 실패.');
                }
            } else {
                // 확인을 누르지 않을 경우
                location.href = "login.jsp"; // 수정: 목록 페이지 URL로 변경
            }
        </script>
<%
    } else {
%>
        <script>
            alert('댓글 작성자만 삭제할 수 있습니다.');
            location.href = "bbs.jsp"; // 수정: 목록 페이지 URL로 변경
        </script>
<%
    }
%>
