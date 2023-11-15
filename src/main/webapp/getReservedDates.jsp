<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, reservation.ReservationDAO, java.util.Date, java.util.List" %>
<%@ page import="org.json.simple.JSONArray, org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
int carID = Integer.parseInt(request.getParameter("carID")); // 선택한 차량의 ID

ReservationDAO reservationDAO = new ReservationDAO();
List<String> reservedDates = reservationDAO.getReservedDatesBetween(carID);

JSONArray reservedDatesArray = new JSONArray();
for (String date : reservedDates) {
    reservedDatesArray.add(date);
}

out.print(reservedDatesArray.toJSONString());
%>
