<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.vo.TestBlood_17List"%>
<%@page import="com.hospital.vo.TestUrine_21List"%>
<%@page import="com.hospital.vo.TestBlood_17VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.vo.TestUrine_21VO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int employeeIdx = (int) session.getAttribute("employeeIdx"); 
String employeeName = (String) session.getAttribute("employeeName"); 

//환자 tag에 필요한 코드
int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
request.setAttribute("patientIdx", patientIdx);

int dDay = Integer.parseInt(request.getParameter("dDay"));
request.setAttribute("dDay", dDay);

Patient_1VO patientVO = NursingService.getInstance().selectPatient(patientIdx);
request.setAttribute("patientVO", patientVO);


TestUrine_21List testUrineList = PatientService.getInstance().selectUrineTest(patientIdx);
request.setAttribute("testUrineList",testUrineList);


TestBlood_17List testBloodList = PatientService.getInstance().selectBloodTest(patientIdx);
request.setAttribute("testBloodList", testBloodList);

%>
<!-- header 페이지 삽입  -->
<jsp:include page="./header_goback_PDetail.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>

<div style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">

<fmt:formatDate var= "adDate" value="${patientVO.getAdDate()}" pattern="yyyy.MM.dd(E)"/>



<c:if test="${testBloodList.testBlood_17List.size() == 0}">
<div style="width: 800px; border: solid 1px; padding: 10px; margin-left:auto; margin-right:auto; position: relative;">
		혈액검사 결과 데이터가 없습니다.
</div>
</c:if>
				
<c:if test="${testBloodList.testBlood_17List.size() != 0}">

<c:forEach var="testBloodVo" items="${testBloodList.testBlood_17List}">

<div style="width: 800px; border: solid 1px; padding: 10px; margin-left:auto; margin-right:auto; position: relative;">
	
	<!-- 환자정보 (환자Tag) -->
		<div style="width: 700px; border: solid 1px; margin-top: 30px; margin-left:auto; margin-right:auto; position: relative;">
			${patientVO.getPatientIdx()}&nbsp;&nbsp;${patientVO.getName()}&nbsp;&nbsp;${patientVO.getAge()}/${patientVO.getGender()}&nbsp;&nbsp;${patientVO.getDiagnosis()}   
			&nbsp;&nbsp;입원일 : ${adDate} <br/>
		</div> <br/>
			검사보고일 : <fmt:formatDate value="${testBloodVo.writeDate}" pattern="yyyy.MM.dd(E)"/> 		
		
		
		<div style="width: 800px; margin-top: 30px; margin-left: 30px; position: relative;">
			<div style="width: 400px; border: 1px solid;">
			혈액검사 결과
			<table class="table">
				<tr>
					<th>WBC</th>
					<td><input type="text" value="${testBloodVo.WBC}">mm<sup>3</sup></td>
				</tr>
				<tr>
					<th>Hb</th>
					<td><input type="text" value="${testBloodVo.hb}">g/dl</td>
				</tr>
				<tr>
					<th>Hct</th>
					<td><input type="text" value="${testBloodVo.hct}">%</td>
				</tr>
				<tr>
					<th>RBC</th>
					<td><input type="text" value="${testBloodVo.RBC}">mm3</td>
				</tr>
				<tr>
					<th>MCV</th>
					<td><input type="text" value="${testBloodVo.MCV}">fl</td>
				</tr>
				<tr>
					<th>MCH</th>
					<td><input type="text" value="${testBloodVo.MCH}">pg</td>
				</tr>
				<tr>
					<th>MCHC</th>
					<td><input type="text" value="${testBloodVo.MCHC}">g/dl</td>
				</tr>
				<tr>
					<th>Platelet</th>
					<td><input type="text" value="${testBloodVo.platelet}">mm<sup>3</sup></td>
				</tr>
			</table>
			</div>		
		</div>
	</div>

</c:forEach>

</c:if>


<c:if test="${testUrineList.testUrine_21List.size() == 0}">

<div style="width: 800px; border: solid 1px; padding: 10px; margin-left:auto; margin-right:auto; position: relative;">
	소변검사 결과 데이터가 없습니다.
</div>

</c:if>
				
<c:if test="${testUrineList.testUrine_21List.size() != 0}">

<c:forEach var="testUrinVo" items="${testUrineList.testUrine_21List}">

<div style="width: 800px; border: solid 1px; padding: 10px; margin-left:auto; margin-right:auto; position: relative;">
	
	<!-- 환자정보 (환자Tag) -->
		<div style="width: 700px; border: solid 1px; margin-top: 30px;margin-left:auto; margin-right:auto; position: relative;">
			${patientVO.getPatientIdx()}&nbsp;&nbsp;${patientVO.getName()}&nbsp;&nbsp;${patientVO.getAge()}/${patientVO.getGender()}&nbsp;&nbsp;${patientVO.getDiagnosis()}   
			&nbsp;&nbsp;입원일 : ${adDate} <br/>
		</div> <br/>
			검사보고일 : <fmt:formatDate value="${testUrinVo.writeDate}" pattern="yyyy.MM.dd(E)"/> 		
		
		
		<div style="width: 800px; margin-top: 30px; margin-left: 30px; position: relative;">
			<div style="width: 400px; border: 1px solid;">
			소변검사 결과
			<table class="table">
				<tr>
					<th>색깔</th>
					<td><input type="text" value="${testUrinVo.color}"></td>
				</tr>
				<tr>
					<th>혼탁도</th>
					<td><input type="text" value="${testUrinVo.turbidity}"></td>
				</tr>
				<tr>
					<th>비중</th>
					<td><input type="text" value="${testUrinVo.gravity}"></td>
				</tr>
				<tr>
					<th>산도</th>
					<td><input type="text" value="${testUrinVo.acidity}"></td>
				</tr>
				<tr>
					<th>알부민</th>
					<td><input type="text" value="${testUrinVo.albumin}"></td>
				</tr>
				<tr>
					<th>포도당</th>
					<td><input type="text" value="${testUrinVo.glucose}"></td>
				</tr>
				<tr>
					<th>케톤</th>
					<td><input type="text" value="${testUrinVo.ketones}"></td>
				</tr>
				<tr>
					<th>빌리루빈</th>
					<td><input type="text" value="${testUrinVo.bilirubin}"></td>
				</tr>
				<tr>
					<th>잠혈</th>
					<td><input type="text" value="${testUrinVo.blood}"></td>
				</tr>
				<tr>
					<th>유로빌리노겐</th>
					<td><input type="text" value="${testUrinVo.bilinogen}"></td>
				</tr>
				<tr>
					<th>나이트리트</th>
					<td><input type="text" value="${testUrinVo.nitrite}"></td>
				</tr>
				<tr>
					<th>백혈구</th>
					<td><input type="text" value="${testUrinVo.leukocyte}"></td>
				</tr>
			</table>
			</div>
		</div>
	</div>
</c:forEach>

</c:if>




					
</div>





</body>
</html>