<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO" %>

<%
int reservationID = Integer.parseInt(request.getParameter("reservationID"));
ReservationDAO reservationDAO = new ReservationDAO();

if (reservationDAO.cancelReservation(reservationID)) {
%>
<script>
    alert("예약이 취소되었습니다.");
    location.href = "myPage.jsp";
</script>
<%
} else {
%>
<script>
    alert("예약 취소에 실패했습니다.");
    history.back();
</script>
<%
}
%>
