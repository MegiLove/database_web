<%@page import="java.util.Vector"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchBookPublisher.jsp" method="post">
	출판사==> <input type="text" name="publisher">
	<input type="submit" value="검색">
	</form>
	
	<%	
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("publisher")!=null){
		String publisher= request.getParameter("publisher");
		
		BookDAO dao= new BookDAO();
		ArrayList<BookVO> list= dao.searchBook(publisher);
		%>
		<table>
			<tr>
			<td>도서번호</td>
			<td>도서명</td>
			<td>출판사명</td>
			<td>가격</td>			
			</tr>
			<%
			for(BookVO b:list){
				%>
				<tr>
			<td><%=b.getBookid() %></td>
			<td><%=b.getBookname()%></td>
			<td><%=b.getPublisher()%></td>
			<td><%=b.getPrice() %></td>			
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