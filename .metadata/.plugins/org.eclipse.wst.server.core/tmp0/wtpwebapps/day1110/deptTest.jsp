<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="deptTest.jsp" method="post">
		지역을 입력하세요==> <input type="text" name="dloc"> <input
			type="submit" value="검색">
	</form>

	<%
	p

			request.setCharacterEncoding("euc-kr");	
			if (request.getParameter("dloc") != null) {
		String dloc = request.getParameter("dloc");
		BookDAO dao = new BookDAO();
		ArrayList<BookVO> list = dao.listEmp(dloc);
	%>
	<table border="1" width="80%">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>급여</td>
			<td>수당</td>
			<td>실수령액</td>
			<td>부서번호</td>
			<td>부서명</td>
		</tr>
		<%
		p

				for (BookVO o : list) {
		%>
		<tr>
			<td><%=o.getEno()%></td>
			<td><%=o.getEname()%></td>
			<td><%=o.getSalary()%></td>
			<td><%=o.getComm()%></td>
			<td><%=o.getTotal()%></td>
			<td><%=o.getDno()%></td>
			<td><%=o.getDname()%></td>
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