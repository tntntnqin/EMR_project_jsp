<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.vo.WorkMemoP_15List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무메모 리스트</title>
</head>
<body>

	<%
		WorkMemoP_15List workmemoList = PathologistService.getInstance().selectmemoPList();
		request.setAttribute("workmemolist", workmemoList);
		pageContext.forward("viewMainP.jsp");
	%>

</body>
</html>