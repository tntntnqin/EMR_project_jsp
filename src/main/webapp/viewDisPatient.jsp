<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴원 환자 조회</title>

<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />
<!-- 검색 때 일치하는 단어 표시 -->
<style type="text/css">
	span {
		color: tomato;
		font-weight: bold;
		background: yellow;
	}
</style>

</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

int employeeIdx = (int) session.getAttribute("employeeIdx"); 
String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 리스트

// 	Patient_1List_All patient_1List_Item = null;
// 	String category = null;
	
// 	try {
// 		currentPage = Integer.parseInt(request.getParameter("currentPage"));
// 	} catch (NumberFormatException e) { }


	Patient_1List_All patient_1List_Item = (Patient_1List_All) request.getAttribute("patient_1LIst_Item");
	String category =  (String) request.getAttribute("category");
// 	request.setAttribute("patient_1List_DisAll", patient_1List_DisAll);
//	request.setAttribute("patient_1List_Item", patient_1List_Item);
	
%>
	<jsp:include page="./header.jsp"></jsp:include>


	<div style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">

		<form action="viewDisPatientMiddle.jsp" method="post">
			<div style=" margin-top: 20px; margin-left: 50px;">
				
				<input type="radio" name="set" value="pIdx" id="pIdx" onclick="checkOnly(1)"/> 환자등록번호
				<input type="radio" name="set" value="pName" id="pName" onclick="checkOnly(2)"/> 환자명
				<input type="radio" name="set" value="pDisDate" id="pDisDate" onclick="checkOnly(3)"/> 퇴원일
				&nbsp;
				&nbsp;
				<input type="text" name="item" id="item">
				<input type="submit" value="검색">
				&nbsp;
				&nbsp;
				<select name="category" style="width: 120px;">
					<option value="vMed">진료기록조회</option>
					<option value="vNur">간호기록조회</option>
					<option value="vTest">검사결과조회</option>
					<option value="vPt">환자정보조회</option>
				</select>
			</div>
		</form>	
		
		<br>
		
	
		<div style="width: 600px; margin-left: 50px; margin-bottom : 30px; border: solid 1px;">
	
				


		<c:if test="${patient_1List_Item.patient_1List_All.size() != 0}">
	
	
			<c:if test="${category == 'vMed'}"> 
				<c:forEach var="patientVO" items="${patient_1List_Item.patient_1List_All}">
				<fmt:formatDate var="disDay" value="${patientVO.disDate}" pattern="yyyyMMdd" />
				
				
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td>
								<button style="width:593px; text-align: left;"
									onclick="location.href='viewDisPatientMedical.jsp?patientIdx=${patientVO.patientIdx}'">
			${patientVO.patientIdx}&nbsp;&nbsp;&nbsp;${patientVO.name}&nbsp;&nbsp;&nbsp;${patientVO.age}/${patientVO.gender}
			&nbsp;&nbsp;&nbsp;${patientVO.diagnosis}&nbsp;&nbsp;&nbsp;퇴원일 : ${disDay}
								</button>
							</td>						 	
						</tr>
					</table>		
				
				</c:forEach>
			
			</c:if>
			
			<c:if test="${category == 'vNur'}"> 
				<c:forEach var="patientVO" items="${patient_1List_Item.patient_1List_All}">
				<fmt:formatDate var="disDay" value="${patientVO.disDate}" pattern="yyyyMMdd" />
				
				
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td>
								<button style="width:593px; text-align: left;"
									onclick="location.href='viewDisPatientNursing.jsp?patientIdx=${patientVO.patientIdx}'">
			${patientVO.patientIdx}&nbsp;&nbsp;&nbsp;${patientVO.name}&nbsp;&nbsp;&nbsp;${patientVO.age}/${patientVO.gender}
			&nbsp;&nbsp;&nbsp;${patientVO.diagnosis}&nbsp;&nbsp;&nbsp;퇴원일 : ${disDay}
								</button>
							</td>						 	
						</tr>
					</table>		
				
				</c:forEach>			
			</c:if>
			
			<c:if test="${category == 'vTest'}">
				<c:forEach var="patientVO" items="${patient_1List_Item.patient_1List_All}">
				<fmt:formatDate var="disDay" value="${patientVO.disDate}" pattern="yyyyMMdd" />
				
				
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td>
								<button style="width:593px; text-align: left;"
									onclick="location.href='viewDisPatientTest.jsp?patientIdx=${patientVO.patientIdx}'">
			${patientVO.patientIdx}&nbsp;&nbsp;&nbsp;${patientVO.name}&nbsp;&nbsp;&nbsp;${patientVO.age}/${patientVO.gender}
			&nbsp;&nbsp;&nbsp;${patientVO.diagnosis}&nbsp;&nbsp;&nbsp;퇴원일 : ${disDay}
								</button>
							</td>						 	
						</tr>
					</table>		
				
				</c:forEach>			
			</c:if>
			
			<c:if test="${category == 'vPt'}"> 
				<c:forEach var="patientVO" items="${patient_1List_Item.patient_1List_All}">
				<fmt:formatDate var="disDay" value="${patientVO.disDate}" pattern="yyyyMMdd" />
				
				
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td>
								<button style="width:593px; text-align: left;"
									onclick="location.href='viewDisPatientData.jsp?patientIdx=${patientVO.patientIdx}'">
			${patientVO.patientIdx}&nbsp;&nbsp;&nbsp;${patientVO.name}&nbsp;&nbsp;&nbsp;${patientVO.age}/${patientVO.gender}
			&nbsp;&nbsp;&nbsp;${patientVO.diagnosis}&nbsp;&nbsp;&nbsp;퇴원일 : ${disDay}
								</button>
							</td>						 	
						</tr>
					</table>		
				
				</c:forEach>			
			</c:if>

		</c:if>
		
		<c:if test="${patient_1List_Item.patient_1List_All.size() == 0}">
		
			<c:if test="${category == null}">
			
				
				<tr>
<!-- 					<td>
						퇴원환자가 없습니다.
					</td> -->
				</tr>
			
			
			</c:if>
				
			<c:if test="${category != null}"> 
				<tr>
					<td>
						검색 조건에 해당하는 퇴원환자가 없습니다.
					</td>
				</tr>
			</c:if>
			
		</c:if>
				
	</div>		
</div>


<script type="text/javascript">

onload = () => {
	let item = document.querySelector('#item');
	item.focus();
	
}

function checkOnly(obj) {
	if (obj == 1) {
		
// 		let pName = document.querySelector('#pName');
// 		let pDisDate = document.querySelector('#pDisDate');
		
// 		pName.toggleAttribute("disabled");
// 		pDisDate.toggleAttribute("disabled");
		item.value = '';
		item.focus();
				
// 		let newAtt = document.createAttribute("disabled");
// 		newAtt.value = "disabled";
// 		let newAtt2 = document.createAttribute("disabled");
// 		newAtt2.value = "disabled";
		
// 		pName.setAttributeNode(newAtt);
// 		pDisDate.setAttributeNode(newAtt2);
			
	} else if (obj == 2) {
		
// 		let pIdx = document.querySelector('#pIdx');
// 		let pDisDate = document.querySelector('#pDisDate');
		
// 		pIdx.toggleAttribute("disabled");
// 		pDisDate.toggleAttribute("disabled");
		item.value = '';
		item.focus();
		
		
	} else if (obj == 3) {
// 		let pIdx = document.querySelector('#pIdx');
// 		let pName = document.querySelector('#pName');
		let item = document.querySelector('#item');
		
//		pIdx.toggleAttribute("disabled");
//		pName.toggleAttribute("disabled");
		
		if (item.type == 'text') {
			item.type = 'date';
		} else {
			item.type = 'text';
			item.value = '';
			item.focus();
		}
		
	}
}

// function submitCheck() {
// 	let item2 = document.querySelector('#item');
// 	let set1 = document.querySelector('#pIdx');
// 	let set2 = document.querySelector('#pName');
// 	let set3 = document.querySelector('#pDisDate');
// 	if (item2.value = null || item2.value.trim() == '') {
// 		alert('검색어를 입력해주세요.');
// 		location.href='viewDisPatient.jsp'
		
// 	}
		
// 	if (set1.checked == false) {
// 		if (set2.checked == false) {
// 			if (set3.checked == false) {
// 				alert('검색조건을 선택해주세요.');
// 				location.href='viewDisPatient.jsp'
			
// 			}
// 		}
// 	}
	

//}

</script>
				
</body>
</html>