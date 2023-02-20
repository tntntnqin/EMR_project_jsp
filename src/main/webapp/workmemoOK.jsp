<%@page import="com.hospital.vo.WorkMemoA_19VO"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("UTF-8");
	%>

	<jsp:useBean id="workmemoavo" class="com.hospital.vo.WorkMemoA_19VO">
		<jsp:setProperty property="*" name="workmemoavo"/>
	</jsp:useBean>
	<%-- ${workmemoavo} --%>
	
	<%
		AcceptanceService.getinstance().workmemoinsert(workmemoavo);
		response.sendRedirect("workmemolist.jsp");
	%>
	
</body>
</html>