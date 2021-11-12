<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="bookTest.jsp" method="post">
	고객이름을 입력하세요==> <input type="text" name="name">
	<input type="submit" value="확인">
	</form>
	
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name")!=null){
			String name= request.getParameter("name");
			BookDao dao= new BookDao();
			ArrayList<String> list= dao.getNotPurchased(name);
			%>
			<table border="1">
			<tr>
				<td>도서명</td>
			</tr>
			<%
				for(String bookname: list){
					%>
					<tr>
						<td><%=bookname %></td>
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