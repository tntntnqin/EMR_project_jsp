<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.HandoverD_3List"%>
<%@page import="com.hospital.vo.HandoverN_9List"%>
<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.vo.WorkMemoP_15List"%>
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
		String nurseT = (String) session.getAttribute("nurseT");
	
		HandoverN_9List handoverNList = NursingService.getInstance().selectHandoverNList(nurseT);
		request.setAttribute("handoverNList", handoverNList);
		pageContext.forward("viewMainN.jsp");
	%>

</body>
</html>