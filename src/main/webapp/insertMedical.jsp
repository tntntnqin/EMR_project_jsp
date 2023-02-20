<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.vo.NoticeToN_8VO"%>
<%@page import="com.hospital.service.DoctorService"%>
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
	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 

	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);

	Patient_1VO patientVO = DoctorService.getInstance().selectPatient(patientIdx);

	
	
	if (request.getParameter("mediName") != null) {
		
		String mediName = request.getParameter("mediName");
		
		if (mediName.trim().equals("")) {
			out.println("<script>");
			out.println("alert('검색어를 입력해주세요.')");
			out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&mediName=" + mediName + "&dDay=" + dDay + "'");
			out.println("</script>"); 
		}
		
	
	out.println("<script>");
	out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&mediName=" + mediName + "&dDay=" + dDay + "'");
	out.println("</script>"); 

	
	} else if (request.getParameter("mediInsert") != null) { 

%>
	<jsp:useBean id="preMedVO" class="com.hospital.vo.PrescriptionMed_4VO">
		<jsp:setProperty property="*" name="preMedVO"/>
	</jsp:useBean>
	


<%
	DoctorService.getInstance().insertMediPreMed(preMedVO);
	NursingService.getInstance().insertInjection(preMedVO);
	
	NoticeToN_8VO noticeToNVO = new NoticeToN_8VO();
	noticeToNVO.setPatientIdx(patientIdx);
	noticeToNVO.setName(patientVO.getName());
	noticeToNVO.setEmployeeIdx(employeeIdx);
	noticeToNVO.setFromName(employeeName);
	noticeToNVO.setAlarmN("약물처방");
	
	DoctorService.getInstance().insertNoticeToNFromD(noticeToNVO);
	
	
	out.println("<script>");
	out.println("alert('" + preMedVO.getMedicine() + " 약물 처방이 등록되었습니다.')");
	out.println("alert('To.간호사 " + patientVO.getName() + "환자의 " + preMedVO.getMedicine() + " 약물 처방 알림이 전송되었습니다.')");
	out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
	out.println("</script>");
	
	
	} else if (request.getParameter("test") != null) { 

%>
	<jsp:useBean id="preTestVO" class="com.hospital.vo.PrescriptionTest_5VO">
		<jsp:setProperty property="*" name="preTestVO"/>
	</jsp:useBean>

<%
		if (request.getParameter("test").equals("blood")) {
			preTestVO.setTest("혈액검사");
		} else {
			preTestVO.setTest("소변검사");
		}
		DoctorService.getInstance().insertMediPreTest(preTestVO);
		out.println("<script>");
		out.println("alert('" + preTestVO.getTest() + " 처방이 등록되었습니다.')");
		out.println("location.href='viewMedical.jsp?patientIdx=" + preTestVO.getPatientIdx() + "&dDay=" + dDay + "'");
		out.println("</script>");
		
		//	간호사에게 검사하라고 알람을 보낸다.
		//NoticeToN_8VO noticeToNVO = new NoticeToN_8VO();
		
		//noticeToNVO.setPatientIdx(patientIdx);
		//noticeToNVO.setName(patientVO.getName());
		//noticeToNVO.setEmployeeIdx(employeeIdx);
		//noticeToNVO.setFromName(employeeName);
		//noticeToNVO.setAlarmN(preTestVO.getTest());
		
		//DoctorService.getInstance().insertNoticeToNFromD(noticeToNVO);
		
	} else if (request.getParameter("recordD") != null) {
		
%>
	<jsp:useBean id="commentVO" class="com.hospital.vo.MedicalComment_7VO">
		<jsp:setProperty property="*" name="commentVO"/>
	</jsp:useBean>

<%-- 	${commentVO} --%>


<% 		
	DoctorService.getInstance().insertMediComment(commentVO);

		if (commentVO.getDischargeC().equals("Y")) {
			
			NoticeToN_8VO noticeToNVO = new NoticeToN_8VO();
			noticeToNVO.setPatientIdx(patientIdx);
			noticeToNVO.setName(patientVO.getName());
			noticeToNVO.setEmployeeIdx(employeeIdx);
			noticeToNVO.setFromName(employeeName);
			noticeToNVO.setAlarmN("퇴원수속");
			
			DoctorService.getInstance().insertNoticeToNFromD(noticeToNVO);
			
			
			out.println("<script>");
			out.println("alert('퇴원 진료기록이 등록되었습니다.')");
			out.println("alert('To.간호사 " + commentVO.getName() + " 님의 퇴원수속 알림이 전송되었습니다.')");
			out.println("location.href='viewMedical.jsp?patientIdx=" + commentVO.getPatientIdx() + "&dDay=" + dDay + "'" );
			out.println("</script>");	
			
		} else {
			
		out.println("<script>");
		out.println("alert('진료기록이 등록되었습니다.')");
		out.println("location.href='viewMedical.jsp?patientIdx=" + commentVO.getPatientIdx() + "&dDay=" + dDay + "'" );
		out.println("</script>");
			
		}



 	} else {
 		out.println("<script>");
 		out.println("alert('내용을 입력해주세요.')");
 		out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'" );
 		out.println("</script>");
 	}
%> 

</body>
</html>