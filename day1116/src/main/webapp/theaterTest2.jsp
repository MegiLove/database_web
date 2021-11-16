<%@page import="com.sist.vo.TicketVO"%>
<%@page import="com.sist.vo.TheaterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.TheaterDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>상영관 정보 확인</h2>
	<form action="theaterTest2.jsp" method="post">
	고객이름을 입력하세요==><input type="text" name="name">
	<input type="submit" value="확인">
	</form>
	
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("name")!=null){
		String name= request.getParameter("name");
		TheaterDAO dao= new TheaterDAO();
		ArrayList<TicketVO> list= dao.getTicket(name);
		
		%>
		<table border="1">
		<tr>
		<td>극장이름</td>
		<td>상영관번호</td>
		<td>영화제목</td>
		<td>날짜</td>
		<td>좌석번호</td>
		<td>가격</td>
		</tr>
		
		<%
		for(TicketVO t:list){
			%>
			<tr>
			<td><%=t.getTheater_name() %></td>
			<td><%=t.getCinema_number() %></td>
			<td><%=t.getTitle() %></td>
			<td><%=t.getReserve() %></td>
			<td><%=t.getSeat_number() %></td>
			<td><%=t.getPrice() %></td>
			
			</tr>
			
			<%
		}
		%>
		
		</table>
		
		<% 
	}
	%>
</body>
</html>