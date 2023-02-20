<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.NursingComment_13VO"%>
<%@page import="com.hospital.service.NursingService"%>
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
%>

	<jsp:useBean id="vo" class="com.hospital.vo.MedicalComment_7VO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>

<%
	DoctorService service = DoctorService.getInstance();

	service.deleteMediComment(vo.getIdx());


	out.println("<script>");
	out.println("alert('진료기록 삭제 완료')");
	out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
	out.println("</script>");
	
%>

</body>
</html>