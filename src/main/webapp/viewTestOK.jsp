<%@page import="com.hospital.vo.NoticeToN_8VO"%>
<%@page import="com.hospital.vo.Employee_20VO"%>
<%@page import="com.hospital.vo.NoticeToD_2VO"%>
<%@page import="com.hospital.vo.TestUrine_21VO"%>
<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.vo.TestBlood_17VO"%>
<%@page import="com.hospital.vo.TestBlood_17List"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadTestResult</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	//	이거 null뜨는거 고쳐야됨 
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	//out.println(patientIdx);
	Patient_1VO patientVO = PatientService.getInstance().selectPatient(patientIdx);
	//out.println(patientVO);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	//out.println(dDay);
	
	int employeeIdx = (Integer)session.getAttribute("employeeIdx");
	//out.println(employeeIdx);
	Employee_20VO employee_20vo = PathologistService.getInstance().selectByEmployeeIdx(employeeIdx);
	String employeeName = (String)session.getAttribute("employeeName");
	//out.println(employeeName);
	

	
	if(request.getParameter("WBC") != null) {
//		혈액 검사일 경우 
	 	String WBC = request.getParameter("WBC").trim();
		String Hb = request.getParameter("Hb").trim();
		String Hct = request.getParameter("Hct").trim();
		String RBC = request.getParameter("RBC").trim();
		String MCV = request.getParameter("MCV").trim();
		String MCH = request.getParameter("MCH").trim();
		String MCHC = request.getParameter("MCHC").trim();
		String Platelet = request.getParameter("Platelet").trim();
		out.println(WBC);
		if(WBC == null || WBC.equals("")||
			Hb == null || Hb.equals("")||
			Hct == null || Hct.equals("")||
			RBC == null || RBC.equals("")||
			MCV == null || MCV.equals("")||
			MCH == null || MCH.equals("")||
			MCHC == null || MCHC.equals("")||
			Platelet == null || Platelet.equals("")) {
				out.println("<script>");
				out.println("alert('모든 내용을 입력하세요')");
				out.println("history.back(-1)");
				//out.println("location.href='viewTest.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
				out.println("</script>");
		} else {
			TestBlood_17VO testBlood_17VO = new TestBlood_17VO();
			
			testBlood_17VO.setPatientIdx(patientVO.getPatientIdx());
			testBlood_17VO.setGender(patientVO.getGender());
			try {
				testBlood_17VO.setWBC(Integer.parseInt(WBC));
				testBlood_17VO.setHb(Float.parseFloat(Hb));
				testBlood_17VO.setHct(Float.parseFloat(Hct));
				testBlood_17VO.setRBC(Integer.parseInt(RBC));
				testBlood_17VO.setMCV(Integer.parseInt(MCV));
				testBlood_17VO.setMCH(Integer.parseInt(MCH));
				testBlood_17VO.setMCHC(Integer.parseInt(MCHC));
				testBlood_17VO.setPlatelet(Integer.parseInt(Platelet));
			} catch (NumberFormatException e) {
				out.println("<script>");
				out.println("alert('잘못된 입력값입니다.')");
				out.println("history.back(-1)");
				//out.println("location.href='viewTest.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
				out.println("</script>");
			}
			testBlood_17VO.setEmployeeIdx(employeeIdx);
			testBlood_17VO.setEmployeeName(employeeName);
			
		
			PathologistService.getInstance().insertTestBlood(testBlood_17VO);
			
			//	검사 결과 알람 발송 - 의사
			NoticeToD_2VO noticeToD_2VO = new NoticeToD_2VO();
			
			noticeToD_2VO.setPatientIdx(patientIdx);
			noticeToD_2VO.setName(patientVO.getName());
			noticeToD_2VO.setAlarmD("혈액검사결과");
			noticeToD_2VO.setFromDP(employee_20vo.getDpart());
			noticeToD_2VO.setFromName(employeeName);
			noticeToD_2VO.setEmployeeIdx(employeeIdx);
			
			PathologistService.getInstance().insertNoticeToD(noticeToD_2VO);
			
			
//			검사 결과 알람 발송 - 간호사
			NoticeToN_8VO noticeToN_8VO = new NoticeToN_8VO();
			noticeToN_8VO.setPatientIdx(patientIdx);
			noticeToN_8VO.setName(patientVO.getName());
			noticeToN_8VO.setAlarmN("혈액검사결과");
			noticeToN_8VO.setFromDP(employee_20vo.getDpart());
			noticeToN_8VO.setFromName(employeeName);
			noticeToN_8VO.setEmployeeIdx(employeeIdx);
			
			PathologistService.getInstance().insertNoticeToN(noticeToN_8VO);
			
			out.println("<script>");
			out.println("alert('검사 결과를 등록했습니다.')");
			out.println("alert('검사 결과 등록 알림이 발송되었습니다.')");
			out.println("location.href='viewPatientDetail.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
			out.println("</script>");
			
		
		}

	} else if (request.getParameter("color") != null) {

		String color = request.getParameter("color").trim();
		String turbidity = request.getParameter("turbidity").trim();
		String gravity = request.getParameter("gravity").trim();
		String acidity = request.getParameter("acidity").trim();
		
		if(color == null || color.equals("")||
			turbidity == null || turbidity.equals("")||
			gravity == null || gravity.equals("")||
			acidity == null || acidity.equals("")) {
			
			out.println("<script>");
			out.println("alert('모든 내용을 입력하세요')");
			out.println("history.back(-1)");
			out.println("</script>");
		} else {
			TestUrine_21VO testUrine_21VO = new TestUrine_21VO();
			testUrine_21VO.setPatientIdx(patientVO.getPatientIdx());
			testUrine_21VO.setGender(patientVO.getGender());
			
			testUrine_21VO.setColor(color);
			testUrine_21VO.setTurbidity(turbidity);
			try {
				testUrine_21VO.setGravity(Float.parseFloat(gravity));
				testUrine_21VO.setAcidity(Float.parseFloat(acidity));
			} catch (NumberFormatException e){
				//	숫자 입력 값에 문자 입력하면 생기는 에러 방지
				out.println("<script>");
				out.println("alert('잘못된 입력값입니다.')");
				out.println("history.back(-1)");
				out.println("</script>");
			}
			testUrine_21VO.setAlbumin(request.getParameter("albumin"));
			testUrine_21VO.setGlucose(request.getParameter("glucose"));
			testUrine_21VO.setKetones(request.getParameter("ketones"));
			testUrine_21VO.setBilinogen(request.getParameter("bilinogen"));
			testUrine_21VO.setBilirubin(request.getParameter("bilirubin"));
			testUrine_21VO.setBlood(request.getParameter("blood"));
			testUrine_21VO.setNitrite(request.getParameter("nitrite"));
			testUrine_21VO.setLeukocyte(request.getParameter("leukocyte"));
			
			testUrine_21VO.setEmployeeIdx(employeeIdx);
			testUrine_21VO.setEmployeeName(employeeName);
			
			PathologistService.getInstance().insertTestUrine(testUrine_21VO);
			
//			검사 결과 알람 발송 - 의사 
			NoticeToD_2VO noticeToD_2VO = new NoticeToD_2VO();
			
			noticeToD_2VO.setPatientIdx(patientIdx);
			noticeToD_2VO.setName(patientVO.getName());
			noticeToD_2VO.setAlarmD("소변검사결과");
			noticeToD_2VO.setFromDP(employee_20vo.getDpart());
			noticeToD_2VO.setFromName(employeeName);
			noticeToD_2VO.setEmployeeIdx(employeeIdx);
			
			PathologistService.getInstance().insertNoticeToD(noticeToD_2VO);

//			검사 결과 알람 발송 - 간호사
			NoticeToN_8VO noticeToN_8VO = new NoticeToN_8VO();
			noticeToN_8VO.setPatientIdx(patientIdx);
			noticeToN_8VO.setName(patientVO.getName());
			noticeToN_8VO.setAlarmN("소변검사결과");
			noticeToN_8VO.setFromDP(employee_20vo.getDpart());
			noticeToN_8VO.setFromName(employeeName);
			noticeToN_8VO.setEmployeeIdx(employeeIdx);
			
			PathologistService.getInstance().insertNoticeToN(noticeToN_8VO);
			out.println("<script>");
			out.println("alert('검사 결과를 등록했습니다.')");
			out.println("alert('검사 결과 등록 알림이 발송되었습니다.')");
			out.println("location.href='viewPatientDetail.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'");
			out.println("</script>");
		}
			//	조건으로 걸었던 값이 null이면 걸리게				
	}else if(request.getParameter("WBC") == null || request.getParameter("WBC").equals("")||
			request.getParameter("color") == null || request.getParameter("color").equals("")){
			out.println("<script>");
			out.println("alert('모든 내용을 입력하세요')");
			out.println("history.back(-1)");
			out.println("</script>");
	}

%>

</body>
</html>