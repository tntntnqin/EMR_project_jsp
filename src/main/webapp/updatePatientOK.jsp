<%@page import="com.hospital.vo.NoticeToN_8VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.Patient_1VO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초진</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	Patient_1VO patient_1vo = PatientService.getInstance().selectPatient(patientIdx);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("patient_1vo", patient_1vo);
	
	String cc = request.getParameter("cc");
	String pi = request.getParameter("pi");
	String histroy = request.getParameter("histroy");
	String allergy = request.getParameter("allergy");
	String alcohol = request.getParameter("alcohol");
	String smoking = request.getParameter("smoking");
	String diagnosis = request.getParameter("diagnosis");
	String carePlan = request.getParameter("carePlan");
	String exDisDate = request.getParameter("exDisDate");
	
	if(cc == null || cc.equals("")||
		pi == null || pi.equals("")||
		histroy == null || histroy.equals("")||
		allergy == null || allergy.equals("")||
		diagnosis == null || diagnosis.equals("")||
		carePlan == null || carePlan.equals("")||
		exDisDate == null || exDisDate.equals("")) {
		out.println("<script>");
		out.println("alert('모든 내용을 입력하세요')");
		out.println("history.back(-1)");
		out.println("</script>");
	} else {
		

	patient_1vo.setCc(cc);
	patient_1vo.setPi(pi);
	patient_1vo.setHistroy(histroy);
	patient_1vo.setAllergy(allergy);
	patient_1vo.setAlcohol(alcohol);
	patient_1vo.setSmoking(smoking);
	patient_1vo.setDiagnosis(diagnosis);
	patient_1vo.setCarePlan(carePlan);
	patient_1vo.setExDisDate(exDisDate);
	
	
	//	알람 보내는 발신자 정보 저장
	int employeeIdx = (Integer)session.getAttribute("employeeIdx");
 	String employeeName = (String)session.getAttribute("employeeName");
 	String dpart = (String)session.getAttribute("dpart");
 	//out.println(employeeIdx);
	//out.println(employeeName);
	//out.println(dpart);
 		
 		
	//	초진하면 간호사에게 알람
	NoticeToN_8VO noticeToN_8VO = new NoticeToN_8VO();
	
	noticeToN_8VO.setPatientIdx(patientIdx);
	noticeToN_8VO.setName(patient_1vo.getName());
	noticeToN_8VO.setAlarmN("초진완료");
	noticeToN_8VO.setFromDP(dpart);
	noticeToN_8VO.setEmployeeIdx(employeeIdx);
	noticeToN_8VO.setFromName(employeeName);
	
	DoctorService.getInstance().insertNoticeToNFromD(noticeToN_8VO);
	
	//	환자 초진 입력
	DoctorService.getInstance().updatePatient(patient_1vo);
	response.sendRedirect("viewMedical.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay);
	}
	
	
	
	
	
	%>
</body>
</html>