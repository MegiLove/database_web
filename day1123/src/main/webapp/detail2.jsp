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
	int bookid= Integer.parseInt(request.getParameter("bookid"));
	String sql = "select * from book where bookid=?";

%>
å��ȣ=<%=bookid%>
å�̸�=<%=bookname%>
���ǻ�=<%=publisher%>
����=<%=price%>
</body>
</html>