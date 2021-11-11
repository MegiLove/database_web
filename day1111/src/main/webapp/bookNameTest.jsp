<%@page import="com.sist.vo.BookNameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookNameDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="bookNameTest.jsp" method="post">
		고객이름을 입력하세요==> <input type="text" name="name"> <input
			type="submit" value="검색">
	</form>

	<%
	

		request.setCharacterEncoding("euc-kr");
		if (request.getParameter("name") != null) {
		String name = request.getParameter("name");
		BookNameDAO dao = new BookNameDAO();
		ArrayList<BookNameVO> list = dao.listOrders(name);
		
	%>
	<table border="1" width="80%">
		<tr>			
			<td>도서명</td>
			
		</tr>
		<%
		

				for (BookNameVO o : list) {
		%>
		<tr>
			
			<td><%=o.getBookname()%></td>
			
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