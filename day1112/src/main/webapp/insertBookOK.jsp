<%@page import="com.sist.vo.NewBookVO"%>
<%@page import="com.sist.dao.NewBookDAO"%>
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
int bookid= Integer.parseInt(request.getParameter("bookid"));
String bookname= request.getParameter("bookname");
String publisher= request.getParameter("publisher");
int price= Integer.parseInt(request.getParameter("price"));

NewBookVO b= new NewBookVO(bookid,bookname,publisher,price);
NewBookDAO dao= new NewBookDAO();
int re= dao.addBook(b);
if(re==1){
	%>
	도서등록에 성공하였습니다
	<%
}else{
	%>
	도서등록에 실패하였습니다
	<%
}
			
%>
</body>
</html>