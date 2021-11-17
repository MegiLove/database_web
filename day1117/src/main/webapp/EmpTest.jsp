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
<h2>사원 정보 확인</h2>
<form action="EmpTest.jsp" method="post">
관리자이름을 입력하세요==><input type="text" name="mgrname">
근무개월수를 입력하세요==><input type="text" name="months">
	<input type="submit" value="확인">
</form>

<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("mgrname")!=null && request.getParameter("months")!=null){
	String mgrname= request.getParameter("mgrname");
	int months= Integer.parseInt(request.getParameter("months"));
	EmpDAO dao= new EmpDAO();
	ArrayList<EmpVO> list= dao.listEmp(mgrname,months);
	%>
	<table border="1">
	<tr>
		<td>사원번호</td>
		<td>사원명</td>
		<td>입사일</td>
		<td>연봉</td>
		<td>주민번호</td>
		<td>아이디</td>
	</tr>
	<%
	 	for(EmpVO e:list){
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