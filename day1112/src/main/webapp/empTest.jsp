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
	<form action="empTest.jsp" method="post">
	�����̸��� �Է��ϼ���==> <input type="text" name="name">
	�ٹ���ġ�� �Է��ϼ���==> <input type="text" name="dloc">
	<input type="submit" value="Ȯ��">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name")!=null && request.getParameter("dloc")!=null){
			String name= request.getParameter("name");
			String dloc= request.getParameter("dloc");
			EmpDAO dao= new EmpDAO();
			ArrayList<String> list= dao.getEmpName(name,dloc);
			%>
			<table border="1">
			<tr>
				<td>�����̸�</td>
			</tr>
			<%
				for(String ename: list){
					%>
					<tr>
						<td><%=ename %></td>
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