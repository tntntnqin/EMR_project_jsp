<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.WorkMemoA_19List"%>
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
		WorkMemoA_19List workmemoList = AcceptanceService.getinstance().selectmemoList();
		request.setAttribute("workmemolist", workmemoList);
		pageContext.forward("viewMainA.jsp");
	%>

</body>
</html>