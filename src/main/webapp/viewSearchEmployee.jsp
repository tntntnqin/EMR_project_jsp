<%@page import="com.hospital.vo.Dpart_23List"%>
<%@page import="com.hospital.vo.Employee_20List"%>
<%@page import="com.hospital.service.PatientService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내검색</title>

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

	
// 환자 리스트

// 	Patient_1List_All patient_1List_Item = null;
// 	String category = null;
	
// 	try {
// 		currentPage = Integer.parseInt(request.getParameter("currentPage"));
// 	} catch (NumberFormatException e) { }


	Employee_20List employeeList = (Employee_20List) request.getAttribute("employeeList");
	Dpart_23List dpartList = (Dpart_23List) request.getAttribute("dpartList");
	
// 	String category =  (String) request.getAttribute("category");
// 	request.setAttribute("patient_1List_DisAll", patient_1List_DisAll);
//	request.setAttribute("patient_1List_Item", patient_1List_Item);
	
%>
	<jsp:include page="./header.jsp"></jsp:include>


	<div style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">

		<form action="viewSearchEmployeeAfter.jsp" method="post">
			<div style=" margin-top: 20px; margin-left: 50px;">
				
				<input type="radio" name="set" value="eName"  onclick="checkOnly(1)"/> 사원명
				<input type="radio" name="set" value="pName" onclick="checkOnly(2)"/> 부서명
				&nbsp;
				&nbsp;
				<input type="text" name="item" id="item">
				<input type="submit" value="검색">
				&nbsp;
				&nbsp;
				
			</div>
		</form>	
		
		<br>
		
	
		<div style="width: 800px; margin-left: 50px; margin-bottom : 30px; border: solid 1px;">
	
				


		<c:if test="${employeeList != null}">
		
			<c:if test="${employeeList.employeeList.size() != 0}">
		
		
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
						
					<tr>
						<th style="width: 125px; text-align: center;">사번</th>
						<th style="width: 125px; text-align: center;">이름</th>
						<th style="width: 125px; text-align: center;">부서</th>
						<th style="width: 125px; text-align: center;">팀</th>
						<th style="width: 150px; text-align: center;">내선번호</th>
						<th style="width: 150px; text-align: center;">개인연락처</th>
					</tr>						 	
				</table>		
				<c:forEach var="employeeVO" items="${employeeList.employeeList}">
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td style="width: 125px; text-align: center;">${employeeVO.employeeIdx}</td>
							<td style="width: 125px; text-align: center;">${employeeVO.name}</td>
							
							<c:if test="${employeeVO.dpart == '의사'}">
								<td style="width: 125px; text-align: center;">의무과</td>
								<td style="width: 125px; text-align: center;">의사${employeeVO.doctorT}팀</td>
							
							</c:if>
							<c:if test="${employeeVO.dpart == '간호사'}">
								<td style="width: 125px; text-align: center;">간호과</td>
								<td style="width: 125px; text-align: center;">간호${employeeVO.doctorT}팀</td>
							
							</c:if>
							<c:if test="${employeeVO.dpart == '병리사'}">
								<td style="width: 125px; text-align: center;">병리과</td>
								<td style="width: 125px; text-align: center;">병리팀</td>
							
							</c:if>
							<c:if test="${employeeVO.dpart == '원무과'}">
								<td style="width: 125px; text-align: center;">원무과</td>
								<td style="width: 125px; text-align: center;">원무팀</td>
							
							</c:if>
							
							
							<td style="width: 150px; text-align: center;">${employeeVO.dnumber}</td>
							<td style="width: 150px; text-align: center;">${employeeVO.enumber}</td>
						</tr>						 	
					</table>
				
				
				</c:forEach>
				
			</c:if>
			<c:if test="${employeeList.employeeList.size() == 0}">
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
						<td>
						검색조건에 맞는 데이터가 없습니다. 
						</td>
					</tr>
				
				</table>
			
			</c:if>
		
		</c:if>
			
			
		<c:if test="${dpartList != null}"> 
		
			<c:if test="${dpartList.dpartList.size() != 0}">
		
		
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
						
					<tr>
						<th style="width: 260px; text-align: center;">부서</th>
						<th style="width: 280px; text-align: center;">팀</th>
						<th style="width: 260px; text-align: center;">내선번호</th>
					</tr>						 	
				</table>		
				<c:forEach var="dpartVO" items="${dpartList.dpartList}">
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							
						<tr>
							<td style="width: 260px; text-align: center;">${dpartVO.dpartName}</td>
							<td style="width: 280px; text-align: center;">${dpartVO.dpartTeam}</td>
							<td style="width: 260px; text-align: center;">${dpartVO.dnumber}</td>
						</tr>						 	
					</table>
				
				
				</c:forEach>
				
			</c:if>
			
			<c:if test="${dpartList.dpartList.size() == 0}">
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
						<td>
						검색조건에 맞는 데이터가 없습니다. 
						</td>
					</tr>
				
				</table>
			
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

</script>
				
</body>
</html>