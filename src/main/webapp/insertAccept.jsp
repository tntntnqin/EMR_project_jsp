<%@page import="com.hospital.vo.PrescriptionTest_5List"%>
<%@page import="com.hospital.vo.MedicalComment_7VO"%>
<%@page import="com.hospital.vo.PrescriptionMed_4VO"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.PrescriptionTest_5VO"%>
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
<style type="text/css">
td {
	border: 1px solid black;
}
</style>
<title>퇴원수납</title>
<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link rel="stylesheet" href="./css/project.css" /> -->
<script type="text/javascript" src="./js/insertAccept.js" defer="defer"></script>

</head>
<body onload="Myfuncion()">

	<%
		request.setCharacterEncoding("UTF-8");
	
		//int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
		//int dDay = Integer.parseInt(request.getParameter("dDay"));
		//int patientIdx = 100001; // 1인실, 건강보험
		//int patientIdx = 100004; // 2인실, 식사O
		//int patientIdx = 100005; // 6인실, 의료급여, 식사O
		//int patientIdx = 100007; // 약12개, 혈액검사, 소변검사, 진찰 3번
		//int patientIdx = 100008; // 약6개, 혈액검사, 진찰 2번
		//int patientIdx = 100009; // 약4개, 혈액검사, 진찰 1번
		//int patientIdx = 10009; // 소변검사
	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 tag에 필요한 코드
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
				
	// 환자 정보
	Patient_1VO patientVO = PatientService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);
	
	// 혈액 소변검사 리스트
	//PrescriptionTest_5VO pretestvo = AcceptanceService.getinstance().selectPrescriptionTest(patientIdx);
	PrescriptionTest_5List pretestlist = AcceptanceService.getinstance().selectPrescriptionTest(patientIdx);
	request.setAttribute("pretestlist", pretestlist);
	//out.println(pretestlist);
	// 혈액 검사 개수
	int pretestBcount = AcceptanceService.getinstance().selectPreTestBCount(patientIdx);
	request.setAttribute("pretestBcount", pretestBcount);
	// 소변 검사 개수
	int pretestPcount = AcceptanceService.getinstance().selectPreTestPCount(patientIdx);
	request.setAttribute("pretestPcount", pretestPcount);
	
	// 약품비
	int premedcount = AcceptanceService.getinstance().selectPrescriptionMed(patientIdx);
	request.setAttribute("premedcount", premedcount);
	
	// 진찰료
	int medicomcount = AcceptanceService.getinstance().selectMedicalComment(patientIdx);
	request.setAttribute("medicomcount", medicomcount);
		
		
	%>

	<jsp:include page="./header.jsp"></jsp:include>
<%-- 	<jsp:include page="./quickmenu.jsp"></jsp:include> --%>
	
	<div>
		<table border="1" cellpadding="5" cellspacing="0" align="center" width="1000px">
			<tr>
				<td width="150px">환자등록번호</td>
				<td width="200px">${patientVO.patientIdx}</td>
				<td width="150px">성명</td>
				<td width="200px">${patientVO.name}</td>
				<td width="150px">성별</td>
				<td width="200px">${patientVO.gender}</td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td>${patientVO.registNum1}-${patientVO.registNum2}</td>
				<td>나이</td>
				<td>${patientVO.age}</td>
				<td>보험종류</td>
				<td>${patientVO.insurance}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${patientVO.address}</td>
				<td>담당의사</td>
				<td>${patientVO.doctorT}</td>
				<td>담당간호사</td>
				<td>${patientVO.nurseT}</td>
			</tr>
		</table>
	</div>


	
	
	
	

	<div style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px; align: center;">
		
		<table border="1" align="center" width="900px">
		<br/>
			
			<%-- <c:if test="${patientVO.insurance.equals('건강보험')}"> --%>
				<tr>
					<th>항목</th>
					<th>횟수</th>
					<th>금액</th>
					<th>합계</th>
				</tr>
				<tr>
					<td>진찰료</td>
					<td><input type="text" value="${medicomcount}" readonly="readonly"></td>
					<td><input type="text" value="2000" readonly="readonly"></td>
					<td><input type="text" value="${medicomcount * 2000}" readonly="readonly" class="medicomcount"></td>
				</tr>
				<tr>
					<td>병실료</td>
					<c:if test="${patientVO.room.equals('1인실')}">
					<td><input type="text" value="${patientVO.room}/ ${dDay-1}일" readonly="readonly"></td>
					<td><input type="text" value="15000" readonly="readonly"></td>
					<td><input type="text" value="${(dDay-1) * 15000}" readonly="readonly" class="room"></td>
					</c:if>
					<c:if test="${patientVO.room.equals('2인실')}">
					<td><input type="text" value="${patientVO.room}/ ${dDay-1}일" readonly="readonly"></td>
					<td><input type="text" value="10000" readonly="readonly"></td>
					<td><input type="text" value="${(dDay-1) * 10000}" readonly="readonly" class="room"></td>
					</c:if>
					<c:if test="${patientVO.room.equals('6인실')}">
					<td><input type="text" value="${patientVO.room}/ ${dDay-1}일" readonly="readonly"></td>
					<td><input type="text" value="6000" readonly="readonly"></td>
					<td><input type="text" value="${(dDay-1) * 6000}" readonly="readonly" class="room"></td>
					</c:if>
				</tr>
				<tr>
					<td>식대</td>
					<c:if test="${patientVO.meal.equals('Y')}">
						<td><input type="text" value="${dDay}일 x 3" readonly="readonly"></td>
						<td><input type="text" value="10000" readonly="readonly"></td>
						<td><input type="text" value="${(dDay-1) * 10000}" readonly="readonly" class="meal"></td>
					</c:if>
					<c:if test="${!patientVO.meal.equals('Y')}">
						<td><input type="text" value="0" readonly="readonly"></td>
						<td><input type="text" value="10000" readonly="readonly"></td>
						<td><input type="text" value="0" readonly="readonly" class="meal"></td>
					</c:if>
				</tr>
				<tr>
					<td>행위료</td>
					<td><input type="text" value="${premedcount}" readonly="readonly"></td>
					<td><input type="text" value="1500" readonly="readonly"></td>
					<td><input type="text" value="${premedcount * 1500}" readonly="readonly" class="injection"></td>
				</tr>
				<tr>
					<td>약품비</td>
					<td><input type="text" value="${premedcount}" readonly="readonly"></td>
					<td><input type="text" value="1000" readonly="readonly"></td>
					<td><input type="text" value="${premedcount * 1000}" readonly="readonly" class="medicine"></td>
				</tr>
				<tr>
					<td>혈액검사료</td>
					<%-- <c:if test="${pretestvo.test.equals('혈액검사')}"> --%>
					<td><input type="text" value="${pretestBcount}" readonly="readonly"></td>
					<td><input type="text" value="2000" readonly="readonly"></td>
					<td><input type="text" value="${pretestBcount * 2000}" readonly="readonly" class="btest"></td>
					<%-- </c:if> --%>
				</tr>
				<tr>
					<td>소변검사료</td>
					<%-- <c:if test="${pretestvo.test.equals('소변검사')}"> --%>
					<td><input type="text" value="${pretestPcount}" readonly="readonly"></td>
					<td><input type="text" value="2000" readonly="readonly"></td>
					<td><input type="text" value="${pretestPcount * 2000}" readonly="readonly" class="utest"></td>
					<%-- </c:if> --%>
				</tr>
				<tr>
					<th>총액</th>
					<td></td>
					<td></td>
					<td><input type="text" name="total" id="total" readonly="readonly"></td>
				</tr>
			<%-- </c:if> --%>
			
		</table>
		
		
		
		<br/><br/>
		
		<div align="left" width="900px">
			<c:if test="${patientVO.insurance.equals('건강보험')}">
				<input type="checkbox" name="insurance" checked="checked" disabled="disabled"> 건강보험
				<input type="checkbox" name="insurance" disabled="disabled"> 의료급여				
			</c:if>				
			<c:if test="${patientVO.insurance.equals('의료급여')}">
				<input type="checkbox" name="insurance" disabled="disabled"> 건강보험
				<input type="checkbox" name="insurance" checked="checked" disabled="disabled"> 의료급여				
			</c:if>				
		</div>				
						
						
		<table border="1" align="center" width="900px">
			<c:if test="${patientVO.insurance.equals('건강보험')}">
				<tr>
					<th width="115">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th width="260">본인부담금(20%)</th>
					<th>공단부담금(80%)</th>
				</tr>
			
				<tr>
					<th>금액</th>
					<td><input type="text" class="healthS" readonly="readonly"></td>
					<td><input type="text" id="healthC" readonly="readonly"></td>
				</tr>
			</c:if>
			
			
			<c:if test="${patientVO.insurance.equals('의료급여')}">
				<tr>
					<th width="115">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th width="260">본인부담금(10%)</th>
					<th>공단부담금(90%)</th>
				</tr>
				<tr>
					<th>금액</th>
					<td><input type="text" class="medicalS" readonly="readonly"></td>
					<td><input type="text" id="medicalC" readonly="readonly"></td>
				</tr>
			</c:if>
			
		</table>
		<br/>
		<div align="right">
			<c:if test="${patientVO.insurance.equals('건강보험')}">
				결제 금액 <input type="text" class="healthS" readonly="readonly">
			</c:if>
			<c:if test="${patientVO.insurance.equals('의료급여')}">
				결제 금액 <input type="text" class="medicalS" readonly="readonly">
			</c:if>
				<input class="btn" type="button" value="수납완료" onclick="location.href='insertAcceptOK.jsp?patientIdx=${patientVO.patientIdx}'">
				<input class="btn" type="button" value="검사지발급" onclick="location.href='fileDownload.jsp'" />
		</div>

	</div>
	
	
	<!-- <script type="text/javascript">
			function total() {
				let a = document.queryselector('.medicomcount')
				let b = document.queryselector('.room')
				let c = document.queryselector('.meal')
				let d = document.queryselector('.injection')
				let e = document.queryselector('.medicine')
				let f = document.queryselector('.btest')
				let g = document.queryselector('.utest')
			
				//let total = document.queryselector('.total')
				//total.value = a.value + b.value + c.value + d.value + e.value + f.value + g.value
				var total = a.val() + b.value + c.value + d.value + e.value + f.value + g.value
				//document.getElementById("total").value = total;
				$('input[name=total]').attr('value',total);
			}
	
	</script> -->

</body>
</html>