<%@page import="com.hospital.service.DoctorService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	DoctorService.getInstance().deleteMediPreTest(idx);


	out.println("<script>");
	out.println("alert('검사 처방내역 1개를 삭제하였습니다.')");
	out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
	out.println("</script>");
	
%>

</body>
</html>