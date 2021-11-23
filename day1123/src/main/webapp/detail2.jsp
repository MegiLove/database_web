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
책번호=<%=bookid%>
책이름=<%=bookname%>
출판사=<%=publisher%>
가격=<%=price%>
</body>
</html>