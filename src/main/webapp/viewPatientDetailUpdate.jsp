<%@page import="java.util.Map"%>
<%@page import="com.hospital.service.DoctorService"%>
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

<title>환자정보조회</title>

<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />
</head>
<body>
<div>
<jsp:include page="./header.jsp"></jsp:include>
</div>
<jsp:include page="./quickmenu.jsp"></jsp:include>
<%

	request.setCharacterEncoding("UTF-8");

// int patientIdx = 100001;
	int patientIdx =  Integer.parseInt(request.getParameter("patientIdx"));
	//	out.println(patientIdx);
	Patient_1VO patientVo = DoctorService.getInstance().selectPatient(patientIdx);
	//	out.println(patientVo);
	request.setAttribute("patientVo", patientVo);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);

	System.out.println(pageContext.findAttribute("com.hospital.vo.Patient_1VO"));

	Map<String, String[]> map = request.getParameterMap();
	for (Map.Entry<String, String[]> entry : map.entrySet()) {
    		System.out.printf("%s : %s%n", entry.getKey(), String.join(", ", entry.getValue()));
	}
%>

<!-- 여기 뷰 가로로 두개 다 볼수 있게 css작업 할때 수정할 예정 -->
<div style="width: 1100px; height:730px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
	<div style="width: 500px; margin-left: 30px; margin-top: 50px;  margin-bottom: 50px; border: solid 1px; float: left; position: relative;">
		<form action="viewPatientDetailUpdateOK.jsp" method="post" name="viewPatientDetailUpdate">
			<table border="1" style="width: 500px; height: 600px;" class="table-bordered">
				<thead>
					<tr class="table-success">
						<th colspan="2">
							기본 정보
						</th>
					</tr>
				</thead>
				<tbody>
			
					<tr>
						<th>환자 등록 번호</th>
						<td>
							<input id="patientIdx" class="form-control" type="text" name="patientIdx" value="${patientVo.patientIdx}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th>성명</th>
						<td colspan="2">
							<input id="name" class="form-control" type="text" name="name" width="250px" value="${patientVo.name}"/>
						</td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td colspan="2">
							<input id="registNum1" type="text" name="registNum1" autocomplete="off" onkeyup="moveNext(this, 6, document.insertPatient.registNum2)" value="${patientVo.registNum1}"/>
							-<input id="registNum2" type="text" name="registNum2" autocomplete="off" onkeyup="moveNext(this, 7, document.insertPatient.age)" value="${patientVo.registNum2}"/>						
						</td>
					</tr>
					<tr>
						<th class="warning" style="vertical-align: middle;">나이</th>
						<td colspan="2">
							<input id="age" class="form-control" type="text" name="age" placeholder="나이"	autocomplete="off" value="${patientVo.age}" />
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="2">
						<c:if test="${patientVo.gender == 'M'}">
							<label class="btn"> <input type="radio" name="gender" value="M" checked="checked">남</label>
							<label class="btn"> <input type="radio" name="gender" value="F">여</label>
						</c:if>
						<c:if test="${patientVo.gender == 'F'}">
							<label class="btn"> <input type="radio" name="gender" value="M">남</label>
							<label class="btn"> <input type="radio" name="gender" value="F" checked="checked">여</label>
						</c:if>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input id="address" class="form-control" type="text" name="address" value="${patientVo.address}" /></td>
					</tr>
					<tr>
						<th>보험 종류</th>
						<td colspan="2">
							<c:if test="${patientVo.insurance == '건강보험'}">
								<label class="btn"> <input type="radio" name="insurance" value="건강보험" checked="checked">건강보험</label> 
								<label class="btn"> <input type="radio"	name="insurance"  value="의료급여">의료급여 </label>
							</c:if>
							<c:if test="${patientVo.insurance == '의료급여'}">
								<label class="btn"> <input type="radio" name="insurance" value="건강보험">건강보험</label> 
								<label class="btn"> <input type="radio"	name="insurance"  value="의료급여" checked="checked">의료급여 </label>
							</c:if>
							
						</td>
					</tr>
									
					<tr>
						<th>입원실</th>
						<td colspan="2">
							<c:if test="${patientVo.room == '6인실'}">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn"><input type="radio" name="room" value="6인실" checked="checked">6인실</label> 
									<label class="btn"> <input type="radio" name="room" value="2인실">2인실</label> 
									<label class="btn"> <input type="radio" name="room" value="1인실">1인실</label>
								</div>
							</c:if>
							<c:if test="${patientVo.room == '2인실'}">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn"><input type="radio" name="room" value="6인실">6인실</label> 
									<label class="btn"> <input type="radio" name="room" value="2인실" checked="checked">2인실</label> 
									<label class="btn"> <input type="radio" name="room" value="2인실">1인실</label>
								</div>
							</c:if>
							<c:if test="${patientVo.room == '1인실'}">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn"><input type="radio" name="room" value="6인실">6인실</label> 
									<label class="btn"> <input type="radio" name="room" value="2인실">2인실</label> 
									<label class="btn"> <input type="radio" name="room" value="1인실" checked="checked">1인실</label>
								</div>
							</c:if>
							<%-- <input id="room" class="form-control" type="text" name="room" value="${patientVo.room}" /> --%>
						</td>
					</tr>
	
					<tr>
						<th>식사</th>
						<td colspan="2">
							<c:if test="${patientVo.meal == true}">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn"> <input type="radio" name="meal" value="true" checked="checked">식사</label> 
									<label class="btn"> <input type="radio" name="meal" value="false">신청안함</label>
								</div>
							</c:if>
							<c:if test="${patientVo.meal == false}">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn"> <input type="radio" name="meal" value="true">식사</label> 
									<label class="btn"> <input type="radio" name="meal" value="false" checked="checked">신청안함</label>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>담당교수</th>
						<td colspan="2">
							<c:if test="${patientVo.doctorT == 'A'}">
								<select name="doctorT" style="width: 200px;">
									<option value="A" selected>의사A</option>
									<option value="B">의사B</option>
									<option value="C">의사C</option>
								</select>
							</c:if>
							<c:if test="${patientVo.doctorT == 'B'}">
								<select name="doctorT" style="width: 200px;">
									<option value="A">의사A</option>
									<option value="B" selected>의사B</option>
									<option value="C">의사C</option>
								</select>
							</c:if>
							<c:if test="${patientVo.doctorT == 'C'}">
								<select name="doctorT" style="width: 200px;">
									<option value="A">의사A</option>
									<option value="B">의사B</option>
									<option value="C" selected>의사C</option>
								</select>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>간호팀</th>
						<td colspan="2">
							<c:if test="${patientVo.nurseT == 'A'}">
								<select name="nurseT" style="width: 200px;">
									<option value="A" selected>간호A</option>
									<option value="B">간호B</option>
									<option value="C">간호C</option>
								</select>
							</c:if>
							<c:if test="${patientVo.nurseT == 'B'}">
								<select name="nurseT" style="width: 200px;">
									<option value="A">간호A</option>
									<option value="B" selected>간호B</option>
									<option value="C" >간호C</option>
								</select>
							</c:if>
							<c:if test="${patientVo.nurseT == 'C'}">
								<select name="nurseT" style="width: 200px;">
									<option value="A">간호A</option>
									<option value="B">간호B</option>
									<option value="C" selected>간호C</option>
								</select>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: right;">
							<!-- 여기 수정하기 기능 추가해야됨 -->
							<input class="btn" type="submit" value="수정하기" /> 
							<input class="btn" type="button" value="돌아가기" onclick="location.href='viewPatientDetail.jsp?patientIdx=${patientVo.patientIdx}&dDay=${dDay}'">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="dDay" value="${dDay}">
		</form>
	</div>
	<div style="width: 500px; margin-right: 30px; margin-top: 50px;  margin-bottom: 50px; border: solid 1px; float: right; position: relative;">
	<table style="width: 500px; height: 500px;" class="table table-bordered">
		<tr>
			<th colspan="2">초진 정보</th>
		</tr>
		<tr>
			<th>증상</th>
			<td>
				<textarea rows="2" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.cc}</textarea>
			</td>
		</tr>
		<tr>
			<th>현병력</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.pi}</textarea>
			</td>
		</tr>
		<tr>
			<th>과거력</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.histroy}</textarea>
			</td>
		</tr>
		<tr>
			<th>알레르기</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.allergy}</textarea>
			</td>
		</tr>
		<tr>
			<th>흡연여부</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.alcohol}</textarea>
			</td>
		</tr>
		<tr>
			<th>음주여부</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.smoking}</textarea>
			</td>
		</tr>
		<tr>
			<th>진단명</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.diagnosis}</textarea>
			</td>
		</tr>
		<tr>
			<th>치료계획</th>
			<td>
				<textarea rows="4" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.carePlan}</textarea>
			</td>
		</tr>
		<tr>
			<th>퇴원 예정일</th>
			<td>
				<textarea rows="1" readonly="readonly" style="resize: none; width: 98%; height: 95%;">${patientVo.exDisDate}</textarea>
			</td>
		</tr>
	</table>
</div>
</div>


</body>
</html>