<%@page import="com.sist.vo.NewBookVO"%>
<%@page import="com.sist.dao.NewBookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="newbookTest.jsp" method="post">
	도서번호를 입력하세요==> <input type="text" name="bookid">
	도서명을 입력하세요==> <input type="text" name="bookname">
	출판사명을 입력하세요==> <input type="text" name="publisher">
	가격을 입력하세요==> <input type="text" name="price">
	<input type="submit" value="확인">
	</form>
	
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("bookid")!=null && request.getParameter("bookname")!=null&&request.getParameter("publisher")!=null&&request.getParameter("price")!=null){
			String bookid= request.getParameter("bookid");
			String bookname= request.getParameter("bookname");
			String publisher= request.getParameter("publisher");
			String price= request.getParameter("price");
			NewBookDAO dao= new NewBookDAO();
			dao.addBook(bookid, bookname, publisher, price);
			ArrayList<NewBookVO> list= dao.listBook();
			%>
			<table border="1">
			<tr>
				<td>도서번호</td>
				<td>도서명</td>
				<td>출판사명</td>
				<td>가격</td>
			</tr>
			<%
				for(NewBookVO v: list){
					%>
					<tr>
						<td><%=bookid %></td>
						<td><%=bookname %></td>
						<td><%=publisher %></td>
						<td><%=price %></td>
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