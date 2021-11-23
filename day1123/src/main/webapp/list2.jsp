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
<%
request.setCharacterEncoding("euc-kr");	
	BookDAO dao= new BookDAO();
	ArrayList<BookVO> list= dao.listBook();
%>
	<table border="1">
	<tr>
		<td>도서번호</td>
		<td>도서명</td>			
	</tr>
	<%
	for(BookVO b:list){
	%>
	 	<tr>
			<td><%=b.getBookid() %></td>
			<td> <a href="detail2.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname() %></a></td>
		
		</tr>
	 		<% 
	 	}
	%>
		
	
	</table>
	<%
	

%>

</body>
</html>