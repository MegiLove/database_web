<%@page import="com.sist.vo.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.EmpDAO"%>
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
		������ �Է��ϼ���==> <input type="text" name="dloc"> <input
			type="submit" value="�˻�">
	</form>

	<%
	request.setCharacterEncoding("euc-kr");	
	if (request.getParameter("dloc") != null) {
		String dloc = request.getParameter("dloc");
		EmpDAO dao = new EmpDAO();
		ArrayList<EmpVO> list = dao.listEmp(dloc);
		
	%>
	<table border="1" width="80%">
		<tr>
			<td>�����ȣ</td>
			<td>����̸�</td>
			<td>�޿�</td>
			<td>����</td>
			<td>�Ǽ��ɾ�</td>
			<td>�μ���ȣ</td>
			<td>�μ���</td>
		</tr>
		<%
		for (EmpVO o : list) {
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