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
	<form action="searchOrders.jsp" method="post">
		고객이름을 입력하세요==> <input type="text" name="name"> <input
			type="submit" value="검색">
	</form>

	<%
	p

			request.setCharacterEncoding("euc-kr");
			if (request.getParameter("name") != null) {
		String name = request.getParameter("name");
		BookNameDAO dao = new BookNameDAO();
		ArrayList<BookNameVO> list = dao.listOrders(name);
		int total= dao.getTotalSalePrice(name);
	%>
	<table border="1" width="80%">
		<tr>
			<td>고객번호</td>
			<td>고객이름</td>
			<td>도서명</td>
			<td>출판사명</td>
			<td>도서가격</td>
			<td>판매가격</td>
			<td>판매일</td>
		</tr>
		<%
		p

				for (BookNameVO o : list) {
		%>
		<tr>
			<td><%=o.getCustid()%></td>
			<td><%=o.getName()%></td>
			<td><%=o.getBookname()%></td>
			<td><%=o.getPublisher()%></td>
			<td><%=o.getPrice()%></td>
			<td><%=o.getSaleprice()%></td>
			<td><%=o.getOrderdate()%></td>
		</tr>
		<%
		}
		%>

	</table>
	<br>
	<hr>
	총주문금액: <%=total %>
	<%
	}
	%>
</body>
</html>