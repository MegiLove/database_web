<%@page import="com.sist.vo.CustomerVO"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.dao.CustomerDAO"%>
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
	BookDAO bookDAO= new BookDAO();
	CustomerDAO customerDAO= new CustomerDAO();
	ArrayList<BookVO> bookList= bookDAO.listBook();
	ArrayList<CustomerVO> customerList= customerDAO.listCustomer();
%>

<h2>�ֹ����</h2>
	<form action="insertOrdersOK_autoOrderid.jsp" method="post">		
		����ȣ:<select name="custid">
				<%
				for(CustomerVO c:customerList){
					%>
					<option value="<%= c.getCustid()%>"><%=c.getName()%></option>					
					<%
				}
				%>
				</select><br>
		������ȣ: <select name="bookid">
					<%
					for(BookVO b: bookList){
						%>
						<option value="<%=b.getBookid()%>"><%=b.getBookname() %>(<%=b.getPrice() %>)</option>
						
						<%
					}
					%>
				</select><br>

		���űݾ�:<input type="text" name="saleprice"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
</body>
</html>