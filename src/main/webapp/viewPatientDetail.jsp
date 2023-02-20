<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 상세</title>

<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/viewMain.css" />
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	session.setAttribute("patientIdx", patientIdx);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	session.setAttribute("dDay", dDay);
	
	Patient_1VO patientVO = PatientService.getInstance().selectPatient(patientIdx);
	session.setAttribute("patientVO", patientVO);
	
// 	out.println(dDay);
%>
<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>

<div style="width: 1100px; height:730px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
<!-- 메뉴바  -->
	<div style="padding: 10px;">
		<input type="button" value="환자정보조회" onclick="location.href='viewPatientDetailUpdate.jsp?patientIdx=${patientVO.getPatientIdx()}&dDay=${dDay}'"/>
		<input type="button" value="의무기록조회" onclick="location.href='viewListMedicalBefore.jsp?patientIdx=${patientVO.patientIdx}&dDay=${dDay}'" /> 
		<input type="button" value="간호기록조회" onclick="location.href='viewListNursingBefore.jsp?patientIdx=${patientVO.patientIdx}&dDay=${dDay}'" /> 
		<input type="button" value="검사결과조회" onclick="location.href='viewListTest.jsp?patientIdx=${patientVO.getPatientIdx()}&dDay=${now - adDate + 1}'"/> 
	</div>
		
	<div>
		<header style="align-items: center;">
<!-- 환자Tag -->
		<div style="width: 500px; border: solid 1px; margin-top: 30px; margin-left: auto; margin-right: auto; position: relative; font-size: 20px; font-weight:bold;;">
		${patientVO.getPatientIdx()} ${patientVO.getName()} ${patientVO.getAge()}/${patientVO.getGender()} ${patientVO.getDiagnosis()} D+${dDay}
		</div>
		</header>
		
		<section>
<!--  -->
		<article>
			<div style="margin-left: 30px;">
				<div>치료 정보</div>
				<div style="border: solid 1px; width: 460px; height: 500px; padding: 20px;">
					<table class="table">
						<tr>
							<th width="120px;">증상</th>
							<td>
								<textarea rows="3" style="resize: none; width: 300px;" readonly="readonly">${patientVO.cc}</textarea>
							</td>
						</tr>
						<tr>
							<th>현병력</th>
							<td>
								<textarea rows="3" style="resize: none; width: 300px;" readonly="readonly">${patientVO.pi}</textarea>
							</td>
						</tr>
						<tr>
							<th>과거력</th>
							<td>
								<textarea rows="3" style="resize: none; width: 300px;" readonly="readonly">${patientVO.histroy}</textarea>
							</td>
						</tr>
						<tr>
							<th>알레르기</th>
							<td>
								<textarea rows="3" style="resize: none; width: 300px;" readonly="readonly">${patientVO.allergy}</textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</article>
		<article>
			<div style="margin-right: 50px;">
				<div>치료 계획</div>
				
				<div style="border: solid 1px; width: 460px; height: 460px;">
					<table class="table">
						<tr>
							<th>치료 계획</th>
							<td>
								<textarea rows="6" style="resize: none; width: 300px;" readonly="readonly">${patientVO.carePlan}</textarea>
							</td>
						</tr>
						<tr>
							<th>퇴원예정일</th>
							<td>
								<textarea rows="1" style="resize: none; width: 300px;" readonly="readonly">${patientVO.exDisDate}</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<input type="button" value="진료수행" onclick="location.href='viewMedical.jsp?patientIdx=${patientVO.patientIdx}&dDay=${dDay}'" /> 
					<input type="button" value="간호수행" onclick="location.href='viewNursing.jsp?patientIdx=${patientVO.patientIdx}&dDay=${dDay}'" /> 
					<input type="button" value="검사수행" onclick="location.href='viewTest.jsp?patientIdx=${patientVO.patientIdx}&dDay=${dDay}'" />
	
				</div>
			</div>
		</article>
		</section>
	</div>
</div>
</body>
</html>