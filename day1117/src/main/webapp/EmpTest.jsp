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
<h2>��� ���� Ȯ��</h2>
<form action="EmpTest.jsp" method="post">
�������̸��� �Է��ϼ���==><input type="text" name="mgrname">
�ٹ��������� �Է��ϼ���==><input type="text" name="months">
	<input type="submit" value="Ȯ��">
</form>

<%
p

request.setCharacterEncoding("euc-kr");
if(request.getParameter("mgrname")!=null && request.getParameter("months")!=null){
	String mgrname= request.getParameter("mgrname");
	int months= Integer.parseInt(request.getParameter("months"));
	BookDAO dao= new BookDAO();
	ArrayList<BookVO> list= dao.listEmp(mgrname,months);
%>
	<table border="1">
	<tr>
		<td>�����ȣ</td>
		<td>�����</td>
		<td>�Ի���</td>
		<td>����</td>
		<td>�ֹι�ȣ</td>
		<td>���̵�</td>
	</tr>
	<%
	p

		 	for(BookVO e:list){
	%>
	 	<tr>
			<td><%=e.getEno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getHirdate() %></td>
			<td><%=e.getTotal() %></td>
			<td><%=e.getJumin() %></td>
			<td><%=e.getId() %></td>
		
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