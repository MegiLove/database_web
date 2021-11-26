<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
 	try{
 		int reservation_no=Interger.parseInt(request.getParameter("reservation_no"));
 		String checkin= request.getParameter("checkin");
 		String checkout= request.getParameter("checkout");
 		String phone= request.getParameter("phone");
 		int count_guest= Integer.parseInt(request.getParameter("count_guest"));
 		int customer_no= Integer.parseInt(request.getParameter("customer_no"));
 		int room_no= Integer.parseInt(request.getParameter("room_no"));
 		
 	}
%>
</body>
</html>