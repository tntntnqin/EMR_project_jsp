<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
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
	
		
		int employeeIdx = (int) session.getAttribute("employeeIdx"); 
		String employeeName = (String) session.getAttribute("employeeName"); 
		
	// 환자 tag에 필요한 코드
		int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
		request.setAttribute("patientIdx", patientIdx);

		Patient_1VO patientVO = NursingService.getInstance().selectPatient(patientIdx);
		request.setAttribute("patientVO", patientVO);	
		// 환자 discharge를 n -> y로 바꿔야 하는데 테이블에 있는 데이터가 n이면 페이지 로딩만 되고
		// y면 환자수납완료 alert 창이 뜬당,,,
		
		
		AcceptanceService acceptanceService = AcceptanceService.getinstance();
		
		acceptanceService.updatePatientDischarge(patientIdx);
		
		out.println("<script>");
		out.println("location.href='viewMainA.jsp'");
		out.println("alert('환자 수납 완료')");
		out.println("</script>");
	%>
	
	
	
	

</body>
</html>