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
	������ȣ�� �Է��ϼ���==> <input type="text" name="bookid">
	�������� �Է��ϼ���==> <input type="text" name="bookname">
	���ǻ���� �Է��ϼ���==> <input type="text" name="publisher">
	������ �Է��ϼ���==> <input type="text" name="price">
	<input type="submit" value="Ȯ��">
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
				<td>������ȣ</td>
				<td>������</td>
				<td>���ǻ��</td>
				<td>����</td>
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