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
<title>퇴원환자 검사결과조회</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int employeeIdx = (int) session.getAttribute("employeeIdx"); 
String employeeName = (String) session.getAttribute("employeeName"); 

//환자 tag에 필요한 코드
int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
request.setAttribute("patientIdx", patientIdx);

// int dDay = Integer.parseInt(request.getParameter("dDay"));
// request.setAttribute("dDay", dDay);

Patient_1VO patientVO = NursingService.getInstance().selectPatient(patientIdx);
request.setAttribute("patientVO", patientVO);


TestUrine_21List testUrineList = PatientService.getInstance().selectUrineTest(patientIdx);
request.setAttribute("testUrineList",testUrineList);


TestBlood_17List testBloodList = PatientService.getInstance().selectBloodTest(patientIdx);
request.setAttribute("testBloodList", testBloodList);

%>
<!-- header 페이지 삽입  -->
<jsp:include page="./header_goback_DisPatient.jsp"></jsp:include>

<div style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">

<fmt:formatDate var= "adDate" value="${patientVO.getAdDate()}" pattern="yyyy.MM.dd(E)"/>
<fmt:formatDate var= "DisDate" value="${patientVO.getDisDate()}" pattern="yyyy.MM.dd(E)"/>


<c:if test="${testBloodList.testBlood_17List.size() == 0}">
<div style="width: 900px; border: solid 1px; padding: 10px; margin: 20px; position: relative;">

					혈액검사 결과 데이터가 없습니다.
</div>
</c:if>
				
<c:if test="${testBloodList.testBlood_17List.size() != 0}">

<c:forEach var="testBloodVo" items="${testBloodList.testBlood_17List}">

	<div style="width: 900px; border: solid 1px; padding: 10px; margin: 20px; position: relative;">
	
	<!-- 환자정보 (환자Tag) -->
		<div style="width: 700px; border: solid 1px; margin-top: 30px; margin-left: 80px; position: relative;">
			${patientVO.getPatientIdx()}&nbsp;&nbsp;${patientVO.getName()}&nbsp;&nbsp;${patientVO.getAge()}/${patientVO.getGender()}&nbsp;&nbsp;${patientVO.getDiagnosis()}   
			&nbsp;&nbsp;입원일 : ${adDate} &nbsp;&nbsp;퇴원일 : ${DisDate}<br/>
		</div> <br/>
			검사보고일 : <fmt:formatDate value="${testBloodVo.writeDate}" pattern="yyyy.MM.dd(E)"/> 		
		
		
		<div style="width: 800px; border: solid 1px; margin-top: 30px; margin-left: 30px; position: relative;">
			혈액검사 결과
	
					<div>
						<div>
							WBC <input type="text" value="${testBloodVo.WBC}">mm<sup>3</sup>
						</div>
						<div>
							Hb <input type="text" value="${testBloodVo.hb}">g/dl
						</div>
						<div>
							Hct <input type="text" value="${testBloodVo.hct}">%
						</div>
						<div>
							RBC <input type="text" value="${testBloodVo.RBC}">mm3
						</div>
						<div>
							MCV <input type="text" value="${testBloodVo.MCV}">fl
						</div>
						<div>
							MCH <input type="text" value="${testBloodVo.MCH}">pg
						</div>
						<div>
							MCHC <input type="text" value="${testBloodVo.MCHC}">g/dl
						</div>
						<div>
							Platelet <input type="text" value="${testBloodVo.platelet}">mm<sup>3</sup>
						</div>
					</div>
					
		</div>
	</div>

</c:forEach>

</c:if>


<c:if test="${testUrineList.testUrine_21List.size() == 0}">

<div style="width: 900px; border: solid 1px; padding: 10px; margin: 20px; position: relative;">

					소변검사 결과 데이터가 없습니다.

</div>

</c:if>
				
<c:if test="${testUrineList.testUrine_21List.size() != 0}">

<c:forEach var="testUrinVo" items="${testUrineList.testUrine_21List}">

	<div style="width: 900px; border: solid 1px; padding: 10px; margin: 20px; position: relative;">
	
	<!-- 환자정보 (환자Tag) -->
		<div style="width: 700px; border: solid 1px; margin-top: 30px; margin-left: 80px; position: relative;">
			${patientVO.getPatientIdx()}&nbsp;&nbsp;${patientVO.getName()}&nbsp;&nbsp;${patientVO.getAge()}/${patientVO.getGender()}&nbsp;&nbsp;${patientVO.getDiagnosis()}   
			&nbsp;&nbsp;입원일 : ${adDate} &nbsp;&nbsp;퇴원일 : ${DisDate}<br/>
		</div> <br/>
			검사보고일 : <fmt:formatDate value="${testUrinVo.writeDate}" pattern="yyyy.MM.dd(E)"/> 		
		
		
		<div style="width: 800px; border: solid 1px; margin-top: 30px; margin-left: 30px; position: relative;">
			소변검사 결과
			<div style="border: solid 1px;">
				<div>
					<div>
						색깔 <input type="text" value="${testUrinVo.color}">
					</div>
					<div>
						혼탁도 <input type="text" value="${testUrinVo.turbidity}">
					</div>
					<div>
						비중 <input type="text" value="${testUrinVo.gravity}">
					</div>
					<div>
						산도 <input type="text" value="${testUrinVo.acidity}">
					</div>
					<div>
						알부민 <input type="text" value="${testUrinVo.albumin}">
					</div>
					<div>
						포도당 <input type="text" value="${testUrinVo.glucose}">
					</div>
					<div>
						케톤 <input type="text" value="${testUrinVo.ketones}">
					</div>
					<div>
						빌리루빈 <input type="text" value="${testUrinVo.bilirubin}">
					</div>
					<div>
						잠혈 <input type="text" value="${testUrinVo.blood}">
					</div>
					<div>
						유로빌리노겐 <input type="text" value="${testUrinVo.bilinogen}">
					</div>
					<div>
						나이트리트 <input type="text" value="${testUrinVo.nitrite}">
					</div>
					<div>
						백혈구 <input type="text" value="${testUrinVo.leukocyte}">
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

</c:if>




					
</div>





</body>
</html>