<%@page import="com.hospital.vo.PrescriptionMed_4List"%>
<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴원간호</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
// 로그인정보(사번, 이름)을 세션변수로 받던지, 아니면 간호수행페이지에서 넘겨줬으니 거기서 받던지,

// 	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
// 	String employeeName = (String) session.getAttribute("employeeName"); 

	int employeeIdx = Integer.parseInt(request.getParameter("employeeIdx"));
	String employeeName = request.getParameter("employeeName");
	
// 	out.println(employeeIdx);
// 	out.println(employeeName);

// 환자 tag에 필요한 코드
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));	
	request.setAttribute("patientIdx", patientIdx);

	Patient_1VO patientVO = NursingService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);
	
// 약처방 
	PrescriptionMed_4List prescriptionMedList = NursingService.getInstance().selectPrescriptionMedList(patientIdx);
	request.setAttribute("prescriptionMedList", prescriptionMedList);



%>
<!-- 헤더페이지 삽입 -->
<jsp:include page="./header.jsp"></jsp:include>
<div style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
	
	<div style="text-align: center; border: solid 1px; margin: 20px;">
		${patientVO.getPatientIdx()} ${patientVO.getName()} ${patientVO.getAge()}/${patientVO.getGender()} ${patientVO.getDiagnosis()} D+${dDay}
	</div>
	
	<br><br>
	
	<div style="margin-left : 40px;">
		<input type="text" value="${patientVO.getName()}" readonly="readonly" style="width: 70px;"> 환자에게<br>
		복용약의 효과, 용법, 용량, 주의사항에대해 충분히 설명함 <input type="checkbox"><br>
		응급상황 발생 시 대처법을 교육함 <input type="checkbox"><br>
		지속적인 질병 관리방법과 필요한 식이에 대해 설명함 <input type="checkbox"><br>
	</div>
	
	<br><br>
	
	<div style="margin-left : 40px;">
		퇴원약 <br>
	
		<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
			<tr>
				<th style="width: 190px">약명</th>
				<th style="width: 70px">용량</th>
				<th style="width: 90px">횟수</th>
			</tr>
		</table>
		
		
		<c:if test="${prescriptionMedList.prescriptionMedList.size() != 0}">
			<c:forEach var="prescriptionMedVO" items="${prescriptionMedList.prescriptionMedList}">
				<c:if test="${prescriptionMedVO.dischargeM eq 'Y'}">
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
					
						<tr>
							<td>
							<img alt="퇴원약" src="./images/arrow2.png" width="10px;">
							<input type="text" value="${prescriptionMedVO.medicine}"/>
							</td>
							<td><input type="text" size="3" value="${prescriptionMedVO.dosage}"/></td>
							
							<c:if test="${prescriptionMedVO.injectTime eq 'qid'}">
							<td><input style="width: 90px" type="text" value="하루 한 번"/></td>
							</c:if>
							<c:if test="${prescriptionMedVO.injectTime eq '24h'}">
							<td><input style="width: 90px" type="text" value="하루 한 번"/></td>
							</c:if>
							<c:if test="${prescriptionMedVO.injectTime eq 'bid'}">
							<td><input style="width: 90px" type="text" value="하루 두 번"/></td>
							</c:if>
							<c:if test="${prescriptionMedVO.injectTime eq 'tid'}">
							<td><input style="width: 90px" type="text" value="하루 세 번"/></td>
							</c:if>
							<c:if test="${prescriptionMedVO.injectTime eq 'hs'}">
							<td><input style="width: 90px" type="text" value="자기 전"/></td>
							</c:if>
							
					 	</tr>
					 </table>

				</c:if>
			</c:forEach>
		</c:if>
			
		<c:if test="${prescriptionMedList.prescriptionMedList.size() == 0}">
			<tr>
				<td>
					퇴원 약이 없습니다.
				</td>
			</tr>
		</c:if>
	</div>

	<div style="text-align: right; margin: 20px;">
		<input type="button" value="퇴원확인" 
		onclick="location.href='insertNoticeToA.jsp?employeeIdx=<%=employeeIdx%>&fromName=<%=employeeName%>&patientIdx=<%=patientIdx%>&name=<%=patientVO.getName()%>&dDay=<%=dDay%>'"/>	
	</div>
		
	
</div>

</body>
</html>