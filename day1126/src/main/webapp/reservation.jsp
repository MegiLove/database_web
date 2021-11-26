<%@page import="com.sist.vo.PossibleReservationRoomVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Olympus 호텔 예약 시스템</h2>
	<hr>
	
	<table border="1" width="80%">
	<tr>
		<th>room_no</th>
		<th>fee</th>
		<th>room_type</th>
		<th>room_state</th>
	</tr>
	<%
	ReservationDAO dao= new ReservationDAO();
	ArrayList<PossibleReservationRoomVO> list= dao.listPossibleReservation();
	for(PossibleReservationRoomVO r: list){
		%>
		<tr>
			<th><%=r.getRoom_no() %></th>
			<th><%=r.getFee() %></th>
			<th><%=r.getRoom_type() %></th>
			<th><%=r.getRoom_state() %></th>			
		</tr>
		
		<%
	}
	
	%>
	</table>
	
	<form action="reservationOK.jsp" method="post">
		room_no:
		<select name="room_no">
		<%
			for(PossibleReservationRoomVO r: list){
				%>
				<option value="<%=r.getRoom_no() %>"><%=r.getRoom_no() %></option>
				
				<%
			}
		%>
		</select><br>
		reservation_no:<input type="number" name="reservation_no"><br>
		customer_no:<input type="number" name="customer_no"><br>
		check_in:<input type="date" name="checkin"><br>
		check_out:<input type="date" name="checkout"><br>
		phone: <input type="tel" name="phone"><br>
		count_guest: <input type="number" name="count_guest"><br>
		<input type="submit" value="예약">
		<input type="reset" value="취소">
		
	</form>
</body>
</html>