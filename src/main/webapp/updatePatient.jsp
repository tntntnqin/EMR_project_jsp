<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 환자 초진</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.ico" />
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	//out.println(patientIdx);
	
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	
	Patient_1VO patient_1vo = PatientService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patient_1vo", patient_1vo);
	
	
%>
<jsp:include page="./header.jsp"></jsp:include>

	<div div style="width: 1100px; height:730px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
		<form action="updatePatientOK.jsp" method="post" name="updatePatient">
			<div div style="width: 500px; height:730px; margin-left: auto; margin-right: auto; border: solid 1px;">
				<table class="table ">
					<thead>
					<tr class="table-info">
						<th colspan="2">
							<h2>신규 환자 초진</h2>
						</th>
					</tr>
					</thead>
					<tbody>
						 <tr>
							<th>환자 등록 번호</th>
							<td><input id="patientIdx" class="form-control" type="text"
								name="patientIdx" value="${patient_1vo.getPatientIdx()}" readonly="readonly"/></td>
						</tr> 
						<tr>
							<th>이름</th>
							<td colspan="2"><input id="name" class="form-control"
								type="text" name="name" value="${patient_1vo.getName()}" readonly="readonly"/></td>
						</tr>
						<tr>
							<th>증상</th>
							<td colspan="2"><input id="cc" class="form-control" type="text"
								name="cc" placeholder="증상" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>현병력</th>
							<td colspan="2"><input id="pi" class="form-control" type="text"
								name="pi" placeholder="현병력" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>과거력</th>
							<td colspan="2"><input id="histroy" class="form-control" type="text"
								name="histroy" placeholder="과거력" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>알레르기</th>
							<td colspan="2"><input id="allergy" class="form-control" type="text"
								name="allergy" placeholder="알레르기" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>흡연여부</th>
							<td colspan="2"><input id="smoking" class="form-control" type="text"
								name="smoking" placeholder="흡연여부" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>음주여부</th>
							<td colspan="2"><input id="alcohol" class="form-control" type="text"
								name="alcohol" placeholder="음주여부" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>진단명</th>
							<td colspan="2"><input id="diagnosis" class="form-control" type="text"
								name="diagnosis" placeholder="진단명" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>치료계획</th>
							<td colspan="2"><input id="carePlan" class="form-control" type="text"
								name="carePlan" placeholder="치료계획" autocomplete="off" /></td>
						</tr>
						<tr>
							<th>퇴원예정일</th>
							<td colspan="2"><input id="exDisDate" class="form-control" type="text"
								name="exDisDate" placeholder="퇴원예정일" autocomplete="off" /></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right;">
							<input class="btn btn-info"	type="submit" value="등록하기"/> 
							<input class="btn btn-danger"	type="reset" value="다시쓰기"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="dDay" value="${dDay}"/>
			</div>
		</form>
	</div>
</body>
</html>