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
	int no=100;
	String name="홍길동";
%>
<a href="detail.jsp?no=<%=no%>">상세보기<%=name%></a>
</body>
</html>