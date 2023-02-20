<%@page import="com.hospital.vo.Medicine_22VO"%>
<%@page import="com.hospital.vo.Medicine_22List"%>
<%@page import="com.hospital.vo.PrescriptionTest_5List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4List"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.vo.MedicalComment_7List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료수행</title>

<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<style type="text/css">

.clicked_btn {
	background-color: #CEECF5;	/* 초진, 퇴원버튼을 클릭하면 색깔 바뀜. */

}

</style>
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />


</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 tag에 필요한 코드
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
	
	Patient_1VO patientVO = DoctorService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);
	

 //	약 처방내역 
	PrescriptionMed_4List prescriptionMedList = DoctorService.getInstance().selectPrescriptionMedList(patientIdx);
	request.setAttribute("prescriptionMedList", prescriptionMedList);

//	검사 처방내역 
	PrescriptionTest_5List prescriptionTestList = DoctorService.getInstance().selectPrescriptionTestList(patientIdx);
	request.setAttribute("prescriptionTestList", prescriptionTestList);

	
// 진료기록 
	MedicalComment_7List medicalCommentList = DoctorService.getInstance().selectMediCommentList(patientIdx);
	
	request.setAttribute("medicalCommentList", medicalCommentList);  
//	out.println(medicalCommentList);


//	약검색
	
	if (request.getParameter("mediName") != null) {
		
		String mediName = request.getParameter("mediName");
		Medicine_22List medicineList = DoctorService.getInstance().selectMedicineListByName(mediName.trim());
		request.setAttribute("medicineList", medicineList);
		request.setAttribute("mediSearch", "t");
		
	} else {
		
		request.setAttribute("mediSearch", "f");
		
	}

//	약검색 후 약 선택

	if (request.getParameter("code") != null) {
		
		String code = request.getParameter("code");
		Medicine_22VO medicineVO = DoctorService.getInstance().selectMedicineByCode(code);
		request.setAttribute("medicineVO", medicineVO);
		
		request.setAttribute("mediCode", "t");
		
	} else {
		
		request.setAttribute("mediCode", "f");
		
	}



	%> 

<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>


<div style="width: 1000px; border: solid 1px; position: absolute; top: 60px; left: 300px; padding: 20px;">

<!-- 환자정보 (환자Tag) -->
	<div style="width: 700px; border: solid 1px; margin-top: 30px; margin-left: 100px; position: relative;">
		${patientVO.getPatientIdx()} ${patientVO.getName()} ${patientVO.getAge()}/${patientVO.getGender()} ${patientVO.getDiagnosis()} D+${dDay}
		
	</div>
	
	<div style="width: 700px; text-align:right; margin-top: 15px; margin-left: 100px; position: relative;">
	<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
		<c:if test="${dpart == '의사'}">
			<input type="button" value="초진" 
						onclick="location.href='updatePatient.jsp?employeeIdx=<%=employeeIdx%>&employeeName=<%=employeeName%>&patientIdx=<%=patientIdx%>&name=<%=patientVO.getName()%>&dDay=<%=dDay%>'"/>
			<input type="button" value="퇴원" onclick="checkDis()" id="checkDis"/>	
		</c:if>
	
		<c:if test="${dpart == '간호사'}">
			<input type="button" value="초진" disabled="disabled"
						onclick="location.href='updatePatient.jsp?employeeIdx=<%=employeeIdx%>&employeeName=<%=employeeName%>&patientIdx=<%=patientIdx%>&name=<%=patientVO.getName()%>&dDay=<%=dDay%>'"/>
			<input type="button" value="퇴원" onclick="checkDis()" id="checkDis" disabled="disabled"/>			
		</c:if>
		
		<c:if test="${dpart == '병리사'}">
			<input type="button" value="초진" disabled="disabled"
						onclick="location.href='updatePatient.jsp?employeeIdx=<%=employeeIdx%>&employeeName=<%=employeeName%>&patientIdx=<%=patientIdx%>&name=<%=patientVO.getName()%>&dDay=<%=dDay%>'"/>
			<input type="button" value="퇴원" onclick="checkDis()" id="checkDis" disabled="disabled"/>
		</c:if>
	<!-- 여기까지  ======================================================   -->		
	</div>

<br/>
<!-- 의사페이지에서 약 처방할때 간호 투약테이블에 insert가 바로 되어야함!! -->

<div>
	<c:if test="${mediSearch == 'f'}">
	
		<c:if test="${mediCode == 'f'}">
			<form action="insertMedical.jsp" method="post" >
				<div>
					<label for="mediName">
						약물처방
					</label>
				</div>
				<div style="border: solid 1px; width: 400px; ">
					<div style=" margin-left: 20px; ">
						<br/>
						<div>
						약명 <input id="mediName" name="mediName" type="text" style="width: 240px;"/> 
							
						<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
								<button type="submit"  onclick="mediNameSearch()">검색</button>
						</c:if>
	
						<c:if test="${dpart == '간호사'}">
								<button type="submit"  onclick="mediNameSearch()" disabled="disabled">검색</button>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
								<button type="submit"  onclick="mediNameSearch()" disabled="disabled">검색</button>
						</c:if>
					<!-- 여기까지  ======================================================   -->		 	
						</div><br/>
					</div><br/>
				<div>
					약용량 <input id="dosage" name="dosage" type="text">
				</div>
				<div>
					투약경로 <input value="PO" name="route" type="radio">PO 
							<input value="IV" name="route" type="radio">IV 
							<input value="IM" name="route" type="radio">IM 
							<input value="SC" name="route" type="radio">SC
				</div>
				<div>
					투약시간 <input value="qp" name="injectTime" type="radio">qid
							<input value="bid" name="injectTime" type="radio">bid 
							<input value="tid" name="injectTime" type="radio">tid 
							<input value="hs" name="injectTime" type="radio">hs
							<input value="24h" name="injectTime" type="radio">24h
				</div><br/>
			</div>
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
			
			
			<div>
				<input name="mediInsert" type="submit" value="처방등록" /> 
				<input name="mediReset" type="reset" value="다시쓰기">
			</div>
						
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
			
			<input type="hidden" value="N" name="dischargeM" id="dischargeM">
			
		</form>
			
	</c:if>
		
	<c:if test="${mediCode == 't'}">
		<form action="insertMedical.jsp" method="post" >
			<div>
				<label for="mediName">
					약물처방
				</label>
			</div>
			<div style="border: solid 1px; width: 400px; ">
				<div style=" margin-left: 20px; "><br/>
					<div>
						약명 <input id="medicine" name="medicine" type="text" value="${medicineVO.getMedicine()}" style="width: 240px;"> 
								<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
				<%-- <c:if test="${dpart == '의사'}">
					<input value="검색" type="submit" name="mediInsert" onclick="mediNameSearch()">
				</c:if>
	
				<c:if test="${dpart == '간호사'}">
					<input value="검색" type="submit" name="mediInsert" onclick="mediNameSearch()" disabled="disabled">
				</c:if>
				
				<c:if test="${dpart == '병리사'}">
					<input value="검색" type="submit" name="mediInsert" onclick="mediNameSearch()" disabled="disabled">
				</c:if> --%>
			<!-- 여기까지  ======================================================   -->	
							
							
							<input value="검색" type="submit" onclick="mediNameSearch()">
					</div><br/>
				</div><br/>
				<div>
					약용량 <input id="dosage" name="dosage" type="text" value="${medicineVO.getDosage()}">
				</div>

				<div>
					투약경로 
					<c:if test="${medicineVO.getRoute() == 'PO'}">
						<input value="PO" name="route" type="radio" checked="checked">PO 
						<input value="IV" name="route" type="radio">IV 
						<input value="IM" name="route" type="radio">IM 
						<input value="SC" name="route" type="radio">SC
					</c:if>
					<c:if test="${medicineVO.getRoute() == 'IV'}">
						<input value="PO" name="route" type="radio">PO 
						<input value="IV" name="route" type="radio" checked="checked">IV 
						<input value="IM" name="route" type="radio">IM 
						<input value="SC" name="route" type="radio">SC
					</c:if>
						<c:if test="${medicineVO.getRoute() == 'IM'}">
							<input value="PO" name="route" type="radio">PO 
							<input value="IV" name="route" type="radio">IV 
							<input value="IM" name="route" type="radio" checked="checked">IM 
							<input value="SC" name="route" type="radio">SC								
						</c:if>
						<c:if test="${medicineVO.getRoute() == 'SC'}">
							<input value="PO" name="route" type="radio">PO 
							<input value="IV" name="route" type="radio">IV 
							<input value="IM" name="route" type="radio">IM 
							<input value="SC" name="route" type="radio" checked="checked">SC
						</c:if>
					</div>
					<div>
						투약시간 
						<c:if test="${medicineVO.getInjectTime() == 'qid'}">
							<input value="qp" name="injectTime" type="radio" checked="checked">qid
							<input value="bid" name="injectTime" type="radio">bid 
							<input value="tid" name="injectTime" type="radio">tid 
							<input value="hs" name="injectTime" type="radio">hs
							<input value="24h" name="injectTime" type="radio">24h						
						</c:if>
						<c:if test="${medicineVO.getInjectTime() == 'bid'}">
							<input value="qp" name="injectTime" type="radio">qid
							<input value="bid" name="injectTime" type="radio" checked="checked">bid 
							<input value="tid" name="injectTime" type="radio">tid 
							<input value="hs" name="injectTime" type="radio">hs
							<input value="24h" name="injectTime" type="radio">24h						
						</c:if>
						<c:if test="${medicineVO.getInjectTime() == 'tid'}">
							<input value="qp" name="injectTime" type="radio">qid
							<input value="bid" name="injectTime" type="radio">bid 
							<input value="tid" name="injectTime" type="radio" checked="checked">tid 
							<input value="hs" name="injectTime" type="radio">hs
							<input value="24h" name="injectTime" type="radio">24h						
						</c:if>
						<c:if test="${medicineVO.getInjectTime() == 'hs'}">
							<input value="qp" name="injectTime" type="radio">qid
							<input value="bid" name="injectTime" type="radio">bid 
							<input value="tid" name="injectTime" type="radio">tid 
							<input value="hs" name="injectTime" type="radio" checked="checked">hs
							<input value="24h" name="injectTime" type="radio">24h						
						</c:if>
						<c:if test="${medicineVO.getInjectTime() == '24h'}">
							<input value="qp" name="injectTime" type="radio">qid
							<input value="bid" name="injectTime" type="radio">bid 
							<input value="tid" name="injectTime" type="radio">tid 
							<input value="hs" name="injectTime" type="radio">hs
							<input value="24h" name="injectTime" type="radio" checked="checked">24h						
						</c:if>

					</div><br/>
				</div>
			<div>
		<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
				<c:if test="${dpart == '의사'}">
					<input type="submit"  name="mediInsert" onclick="mediNameSearch()" value="처방등록">
					<input type="button"  name="mediReset" id="mediReset" onclick="mediReset()" value="다시쓰기">
				</c:if>
	
				<c:if test="${dpart == '간호사'}">
					<input type="submit"  name="mediInsert" onclick="mediNameSearch()" value="처방등록" disabled="disabled">
					<input type="button"  name="mediReset" id="mediReset" onclick="mediReset()" value="다시쓰기"  disabled="disabled">
				</c:if>
				
				<c:if test="${dpart == '병리사'}">
					<button type="submit" name="mediInsert" onclick="mediNameSearch()" disabled="disabled">처방등록</button>
					<button type="button" name="mediReset" id="mediReset"  onclick="mediReset()"  disabled="disabled">다시쓰기</button>
				</c:if>
			<!-- 여기까지  ======================================================   -->		 	
			</div>
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
			
			<input type="hidden" value="N" name="dischargeM" id="dischargeM">

			</form>
		</c:if>
	</c:if>

	<c:if test="${mediSearch == 't'}">
		<form action="insertMedical.jsp" method="post" >
			<div>
				<label for="mediName">
					약물처방
				</label>
			</div>
			<div style="border: solid 1px; width: 400px; "><br/>
				<div style=" margin-left: 20px; ">
					<div>
						약명 <input id="mediName" name="mediName" type="text" style="width: 240px;"> 
						<input value="검색" type="submit" onclick="mediNameSearch()">
					</div><br/>
					<div>		
						<table style="  margin-top: 0px; margin-left: 20px; position: relative;">
							<tr>
								<th width="50px">코드</th>
								<th width="140px">약명</th>
							</tr>
						</table>
					<c:if test="${medicineList.medicineList.size() != 0}">
						<c:forEach var="medicineVO" items="${medicineList.medicineList}">
							<table style=" border: solid 1px; margin-top: 0px; margin-left: 20px; position: relative;">
								<tr>
<%-- 								<td width="50px">${medicineVO.code}</td> --%>
<%-- 								<td width="160px">${medicineVO.medicine}</td> --%>
<!-- 								<td width="80px">용량</td> -->
<!-- 								<td width="60px">경로</td> -->
<!-- 								<td width="100px">횟수</td> -->
									<td>
										<button type="button" style="width: 260px; text-align: left; " id="mediset" onclick="location.href='viewMedicalBack.jsp?code=${medicineVO.code}&patientIdx=${patientIdx}&dDay=${dDay}'">
										${medicineVO.code}&nbsp;&nbsp;&nbsp;&nbsp;${medicineVO.medicine}
										</button>
									</td>
								</tr>
							</table>
			
						</c:forEach>
					</c:if>			
					<c:if test="${medicineList.medicineList.size() == 0}">
						<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
							<tr>
								<td>검색한 약물이 존재하지 않습니다.</td>
							</tr>
						</table>
					</c:if>		
				</div>
			</div><br/>
			<div>
				약용량 <input id="dosage" name="dosage" type="text">
			</div>

			<div>
				투약경로 <input value="PO" name="route" type="radio">PO 
						<input value="IV" name="route" type="radio">IV 
						<input value="IM" name="route" type="radio">IM 
						<input value="SC" name="route" type="radio">SC
			</div>
			<div>
				투약시간 <input value="qp" name="injectTime" type="radio">qid
						<input value="bid" name="injectTime" type="radio">bid 
						<input value="tid" name="injectTime" type="radio">tid 
						<input value="hs" name="injectTime" type="radio">hs
						<input value="24h" name="injectTime" type="radio">24h
			</div><br/>	
		</div>
		<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
		<input type="hidden" value="${patientVO.getName()}" name="name">
		<input type="hidden" value="${employeeIdx}" name="employeeIdx">
		<input type="hidden" value="${employeeName}" name="employeeName">
		<input type="hidden" value="${dDay}" name="dDay">
						
		<div>
			<input name="mediInsert" type="submit" value="처방등록" /> 
			<input name="mediReset" type="reset" value="다시쓰기">
		</div>
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
			
			<input type="hidden" value="N" name="dischargeM" id="dischargeM">

		</form>
	</c:if>
</div><br/>
<div>
	<div>검사처방</div>
		<form action="insertMedical.jsp" method="post">
			<div style="border: solid 1px; width: 250px; height: 50px;">
				<label for="blood"><input type="radio" name="test" value="blood" id="blood">혈액검사</label>
				<label for="urine"><input type="radio" name="test" value="urine" id="urine">소변검사</label>
			</div>
			<div>
			<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
				<c:if test="${dpart == '의사'}">
					<input name="mediasd" type="submit" value="처방등록" /> 
					<input name="mediasd" type="reset" value="다시쓰기">
				</c:if>
	
				<c:if test="${dpart == '간호사'}">
					<input name="mediasd" type="submit" value="처방등록" disabled="disabled"/> 
					<input name="mediasd" type="reset" value="다시쓰기"  disabled="disabled"/>
				</c:if>
				
				<c:if test="${dpart == '병리사'}">
					<input name="mediasd" type="submit" value="처방등록" disabled="disabled"/> 
					<input name="mediasd" type="reset" value="다시쓰기"  disabled="disabled"/>
				</c:if>
			<!-- 여기까지  ======================================================   -->		 
			</div>
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
		</form>
	</div><br/>		
	<div>
	<div>처방내역</div>
	<div style="border: solid 1px; width: 600px;">
	
<!-- 				<table style="border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;"> -->
<!-- 					<tr> -->
<!-- 						<th>처방시각</th> -->
<!-- 						<th>약명</th> -->
<!-- 						<th>용량</th> -->
<!-- 						<th>경로</th> -->
<!-- 						<th>횟수</th> -->
						
<!-- 					</tr> -->
<!-- 				</table> -->

		<c:if test="${prescriptionMedList.prescriptionMedList.size() != 0}">
			<c:forEach var="prescriptionMedVO" items="${prescriptionMedList.prescriptionMedList}">
				<table style="margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
						<td><img alt="화살표" src="./images/arrow2.png" width="20"/> &nbsp;&nbsp;</td> 
						<td><fmt:formatDate value="${prescriptionMedVO.writedate}" pattern="a h:mm:ss" /></td>

						<td><input type="text" value="${prescriptionMedVO.medicine}" readonly="readonly"/></td>
						<td><input type="text" size="5" value="${prescriptionMedVO.route}" readonly="readonly"/></td>
						<td><input type="text" size="3" value="${prescriptionMedVO.dosage}" readonly="readonly"/></td>
						<td><input type="text" size="3" value="${prescriptionMedVO.injectTime}" readonly="readonly"/></td>
						<td>
			 				<button type="button" onclick="location.href='deleteMediPreMed.jsp?idx=${prescriptionMedVO.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"> 
						 			<img alt="삭제" src="./images/x_circle.webp" width="20px">
						 	</button>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		
		<c:if test="${prescriptionTestList.prescriptionTestList.size() != 0}">
			<c:forEach var="prescriptionTestVO" items="${prescriptionTestList.prescriptionTestList}">
				<table style="margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
						<td><img alt="화살표" src="./images/arrow2.png" width="20"/> &nbsp;&nbsp;</td> 
						<td><fmt:formatDate value="${prescriptionTestVO.writedate}" pattern="a h:mm:ss" /></td>

						<td><input type="text" style="width: 370px;" value="${prescriptionTestVO.test}" readonly="readonly"/></td>
					<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
			 				<button type="button" onclick="location.href='deleteMediPreTest.jsp?idx=${prescriptionTestVO.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"> 
						 			<img alt="삭제" src="./images/x_circle.webp" width="20px">
						 	</button>
						</td>
						</c:if>
			
						<c:if test="${dpart == '간호사'}">
							<td>
			 					<a type="button" onclick="location.href='deleteMediPreTest.jsp?idx=${prescriptionTestVO.idx}&patientIdx=${patientIdx}&dDay=${dDay}'" disabled="disabled"> 
						 			<img alt="삭제" src="./images/x_circle.webp" width="20px">
						 		</a>
							</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
				 				<button type="button" onclick="location.href='deleteMediPreTest.jsp?idx=${prescriptionTestVO.idx}&patientIdx=${patientIdx}&dDay=${dDay}'" disabled="disabled"> 
							 			<img alt="삭제" src="./images/x_circle.webp" width="20px">
							 	</button>
							</td>
						</c:if>
					<!-- 여기까지  ======================================================   -->	
						<td>
			 				<button type="button" onclick="location.href='deleteMediPreTest.jsp?idx=${prescriptionTestVO.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"> 
						 			<img alt="삭제" src="./images/x_circle.webp" width="20px">
						 	</button>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${prescriptionMedList.prescriptionMedList.size() == 0}">
			<c:if test="${prescriptionTestList.prescriptionTestList.size() == 0}">
				<table>
					<tr>
						<td>금일 처방내역이 없습니다.</td>
					</tr>					
				</table>
			</c:if>
		</c:if> 
	</div><br/>
</div>
	진료기록
<div style="width: 800px; border: solid 1px; ">
	<c:if test="${medicalCommentList.medicalCommentList.size() != 0}">
		<c:forEach var="vo" items="${medicalCommentList.medicalCommentList}">
			<c:set var="commentName" value="comment${vo.idx}"></c:set>
				<table style=" border: solid 1px; ">
					<tr>
			 			<td>
				 			<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
				 		</td>
					 	<td width="400px">
					 		<input style="width: 500px" type="text" value="${vo.recordD}" readonly="readonly" id="${commentName}">
					 	</td>
					<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
					 			<input type="checkbox" onchange="commentMediCheck(${commentName})">
					 			<input class="btn btn-outline-info btn-sm" type="button" value="수정" 
									onclick="commentMediUpdate(${commentName}, ${vo.idx}, ${patientIdx}, ${dDay})"/>
								
								<input class="btn btn-outline-danger btn-sm" type="button" value="삭제" 
									onclick="location.href='deleteMediComment.jsp?idx=${vo.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"/>
					 		</td>
						</c:if>
			
						<c:if test="${dpart == '간호사'}">
							<td>
					 			<input type="checkbox" onchange="commentMediCheck(${commentName})" disabled="disabled">
					 			<input class="btn btn-outline-info btn-sm" type="button" value="수정" disabled="disabled" 
									onclick="commentMediUpdate(${commentName}, ${vo.idx}, ${patientIdx}, ${dDay})"/>
								
								<input class="btn btn-outline-danger btn-sm" type="button" value="삭제"  disabled="disabled"
									onclick="location.href='deleteMediComment.jsp?idx=${vo.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"/>
					 		</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
					 			<input type="checkbox" onchange="commentMediCheck(${commentName})" disabled="disabled">
					 			<input class="btn btn-outline-info btn-sm" type="button" value="수정" disabled="disabled" 
									onclick="commentMediUpdate(${commentName}, ${vo.idx}, ${patientIdx}, ${dDay})"/>
								
								<input class="btn btn-outline-danger btn-sm" type="button" value="삭제"  disabled="disabled"
									onclick="location.href='deleteMediComment.jsp?idx=${vo.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"/>
					 		</td>
						</c:if>
			<!-- 여기까지  ======================================================   -->	
				 	</tr>
				 </table>
			</c:forEach>
		</c:if><br/>
		<c:if test="${medicalCommentList.medicalCommentList.size() == 0}">
			<tr>
				<td>
					진료기록을 입력해주세요.
				</td>
			</tr>
		</c:if>
		
			<form action="insertMedical.jsp" method="post">
				<table>		
					<tr>
						<td width="495px">
							&nbsp;&nbsp;<input type="text" style="width: 450px;" name="recordD"/>
						</td>
			<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
								<button type="submit">등록하기</button>
							</td>
						</c:if>
			
						<c:if test="${dpart == '간호사'}">
							<td>
								<button type="submit" disabled="disabled">등록하기</button>
							</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
								<button type="submit" disabled="disabled">등록하기</button>
							</td>
						</c:if>
			<!-- 여기까지  ======================================================   -->	
					</tr>		
				</table>
				<input type="hidden" value="N" name="dischargeC" id="dischargeC">
				<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
				<input type="hidden" value="${patientVO.getName()}" name="name">
				<input type="hidden" value="${employeeIdx}" name="employeeIdx">
				<input type="hidden" value="${employeeName}" name="employeeName">
				<input type="hidden" value="${dDay}" name="dDay">
			</form>
		</div>			
	</div>
		
<script type="text/javascript">

onload = () => {
	let mediName = document.querySelector('#mediName');
	mediName.focus();
	
}

function mediReset() {
// 	let injectTime = document.getElementsByName('injectTime');
// 	let route = document.getElementsByName('route');
// 	let dosage = document.getElementsByName('dosage');
// 	let medicine = document.getElementsByName('medicine');

// 	dosage.value = '';
// 	medicine.value = '';
// 	injectTime.removeAttribute("checked");
// 	route.removeAttribute("checked");
}

function mediNameSearch() {
	
// 	let medi = document.querySelector('#mediName');
// 	let mediName = medi.value;
// 	location.href='viewMedicalBack.jsp?mediName=' + mediName;
}

function commentMediCheck(name) {
	
	name.removeAttribute("readonly");
	name.focus();
}

function commentMediUpdate(comment, nidx, pidx, day) {
//	console.log(comment);
//	console.log(comment.value);
//	console.log(nidx);
//	console.log(pidx);
	let recordD = comment.value;
 	location.href='updateMediComment.jsp?idx=' + nidx + '&patientIdx=' + pidx + '&recordD=' + recordD + '&dDay=' + day;
}


function checkDis() {
	let checkDis = document.querySelector('#checkDis');
	let disM = document.querySelector('#dischargeM');
	let disC = document.querySelector('#dischargeC');

	checkDis.classList.add("clicked_btn");
	disM.value = 'Y';
	disC.value = 'Y';
		
}


// 추후 구현 예정임 작업중.
function checkFirst() {
// 	let disM = document.querySelector('#dischargeM');
// 	let disC = document.querySelector('#dischargeC');

// 	disM.value = 'Y';
// 	disC.value = 'Y';
	
// 	disM.classList.add("clicked_btn");
// 	disC.classList.add("clicked_btn");

		
}



</script>		
		



</body>
</html>