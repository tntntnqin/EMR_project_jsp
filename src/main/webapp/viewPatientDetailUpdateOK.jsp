<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPatientDetailUpdate.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

// 환자번호가 안넘어와서 sql이 반영이 안됐었넹 
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	int dDay = Integer.parseInt(request.getParameter("dDay"));
//	out.println(patientIdx);
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
	
/*  	out.println(name);
	out.println(age);
	out.println(registNum1);
	out.println(nurseT);
	out.println(registNum2);
	out.println(gender);
	out.println(address);
	out.println(insurance);
	out.println(room);
	out.println(meal);
	out.println(doctorT);  */

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
		out.println("location.href='insertPatient.jsp'");
	out.println("</script>");
		
	} else {
		//	boolean meal = Boolean.parseBoolean(mealT);
	
		int registNum1_int = Integer.parseInt(registNum1);
		int registNum2_int = Integer.parseInt(registNum2);
		int age_int = Integer.parseInt(age);
		
		Patient_1VO patientVO = new Patient_1VO();
		
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
		
		patientVO.setPatientIdx(patientIdx);
		patientVO.setName(name);
		patientVO.setAge(age_int);
		patientVO.setRegistNum1(registNum1_int);
		patientVO.setRegistNum2(registNum2_int);
		patientVO.setGender(gender);
		patientVO.setAddress(address);
		patientVO.setInsurance(insurance);
		patientVO.setRoom(room);
 		patientVO.setDoctorT(doctorT);
		patientVO.setNurseT(nurseT); 

		if(meal.equals("true")) {
			patientVO.setMeal("Y");
		} else {
			patientVO.setMeal("N");
		}
		
		out.println(patientVO);
		

		PatientService.getInstance().updatePatientDetail(patientVO);
	 	out.println(patientVO);
	}
	response.sendRedirect("viewPatientDetail.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay);

 	
%>
</body>
</html>