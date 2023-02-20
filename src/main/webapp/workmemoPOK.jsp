<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.vo.WorkMemoP_15VO"%>
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

	<jsp:useBean id="workmemopvo" class="com.hospital.vo.WorkMemoP_15VO">
		<jsp:setProperty property="*" name="workmemopvo"/>
	</jsp:useBean>
	<%-- ${workmemopvo} --%>
	
	<%
		PathologistService.getInstance().workmemoPinsert(workmemopvo);
		//out.println(workmemopvo);
		response.sendRedirect("workmemoPlist.jsp");
		
	%>
	
</body>
</html>