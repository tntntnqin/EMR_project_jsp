<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@page import="com.hospital.vo.NoticeToD_2VO"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPatientOK</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age").trim();
	String registNum1 = request.getParameter("registNum1").trim();
	String registNum2 = request.getParameter("registNum2").trim();
	String gender = request.getParameter("gender").trim();
	String address = request.getParameter("address").trim();
	String insurance = request.getParameter("insurance").trim();
	String room = request.getParameter("room").trim();
	String meal = request.getParameter("meal").trim();
	String doctorT = request.getParameter("doctorT").trim();
	String nurseT = request.getParameter("nurseT").trim();
	
 /* 	out.println(name);
	out.println(age);
	out.println(registNum1);
	out.println(nurseT);
	out.println(registNum2);
	out.println(gender);
	out.println(address);
	out.println(insurance);
	out.println(room);
	out.println(meal);
	out.println(doctorT); */ 

	if(name == null|| name.equals("")||
		age == null || age.equals("")||
		registNum1 == null || registNum1.equals("")||
		registNum2 == null || registNum2.equals("")||
		gender == null || gender.equals("")||
		address == null || address.equals("")||
		insurance == null || insurance.equals("")||
		room == null || room.equals("")||
		meal == null || meal.equals("")||
		doctorT == null || doctorT.equals("")||
		nurseT == null || nurseT.equals("")){
		out.println("<script>");
		out.println("alert('입력사항을 모두 입력해주세요')");
		out.println("history.back(-1)");
		out.println("</script>");
		
	} else {
		try {
			int registNum1_int = Integer.parseInt(registNum1);
			int registNum2_int = Integer.parseInt(registNum2);
			int age_int = Integer.parseInt(age);

			Patient_1VO patientVO = new Patient_1VO();
			
			if(meal.equals("true")) {
				patientVO.setMeal("Y");
			} else {
				patientVO.setMeal("N");
			}
			
			/* if(doctorT.equals("의사A")) {
				patientVO.setDoctorT("A");
			} else if(doctorT.equals("의사B")) {
				patientVO.setDoctorT("B");
			} else {
				patientVO.setDoctorT("C");
			}
			
			if(nurseT.equals("간호A")) {
				patientVO.setNurseT("A");
			} else if(nurseT.equals("간호B")) {
				patientVO.setNurseT("B");
			} else {
				patientVO.setNurseT("C");
			} */
			patientVO.setNurseT(nurseT);
			patientVO.setDoctorT(doctorT);
			patientVO.setName(name);
			patientVO.setAge(age_int);
			patientVO.setRegistNum1(registNum1_int);
			patientVO.setRegistNum2(registNum2_int);
			patientVO.setGender(gender);
			patientVO.setAddress(address);
			patientVO.setInsurance(insurance);
			patientVO.setRoom(room);
			//신환등록하면 초진전에 진단명 null로 떠서 "진료전"쑤셔넣기
			patientVO.setDiagnosis("진료 전");
	 		PatientService.getInstance().InsertPatient(patientVO);
	 		
	 		Patient_1List_All patient_1List_All  = PatientService.getInstance().selectPatientList_All();
			//	데이터 베이스에 환자가 없으면 강제로 붙이는 번호
	 		int newPatientIdx = 100001;
		 		
		 		//out.println(newPatientIdx);
		 		//	업무 알람 보낼떄 들어갈 발신자 정보 
		 		int employeeIdx = (Integer)session.getAttribute("employeeIdx");
		 		String employeeName = (String)session.getAttribute("employeeName");
		 		String dpart = (String)session.getAttribute("dpart");
		 		//out.println(employeeIdx);
		 		//out.println(employeeName);
		 		//out.println(dpart);
		 		
		 		
		 		//	의사에게 업무 알람 가는 명령 만들기
		 		NoticeToD_2VO noticeToD_2VO = new NoticeToD_2VO();
		 		noticeToD_2VO.setName(name);
		 		noticeToD_2VO.setAlarmD("신환등록");
		 		noticeToD_2VO.setFromDP(dpart);
		 		noticeToD_2VO.setEmployeeIdx(employeeIdx);
		 		noticeToD_2VO.setFromName(employeeName);
	 		if(patient_1List_All != null) {
		 		//	환자 번호 제일 끝 번호를 가져와서  +1 해서 patientIdx 삽입해주기(서비스 클래스에서  +1 해옴)
	 			newPatientIdx = PatientService.getInstance().selectnewPatientIdx();
		 		noticeToD_2VO.setPatientIdx(newPatientIdx);
	 		} else {
		 		noticeToD_2VO.setPatientIdx(newPatientIdx);
	 		}
	 			
	 		AcceptanceService.getinstance().insertNoticeToDFromA(noticeToD_2VO);
	 		
	 		
			out.println("<script>");
			response.sendRedirect("viewMainA.jsp");
			out.println("</script>");
	 	//	out.println(vo);
		
	 		
			
		} catch (NumberFormatException e) {
			out.println("<script>");
			out.println("alert('잘못된 입력값입니다.')");
			out.println("history.back(-1)");
			out.println("</script>");
		}
	}
		
%>

</body>
</html>