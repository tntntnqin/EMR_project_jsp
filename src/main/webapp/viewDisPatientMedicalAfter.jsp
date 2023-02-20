<%@page import="com.hospital.service.PatientService"%>
<%@page import="java.text.Format"%>
<%@page import="com.hospital.vo.ViewMedicalVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hospital.vo.NoticeToP_14VO"%>
<%@page import="com.hospital.vo.VitalSign_10VO"%>
<%@page import="com.hospital.vo.VitalSign_10List"%>
<%@page import="com.hospital.vo.Injection_11VO"%>
<%@page import="com.hospital.vo.Injection_11List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4VO"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴원환자 의무기록 조회</title>

<style type="text/css">



</style>
</head>
<body>

<%

// (주의!!!!) 하루치 기록이 나올때 해당 날짜가 나오는데, 그 날짜는 처방약 데이터에서 가져오게 해두었다.
//				그래서 하루에 약처방이 1개도 없으면 에러가 뜬다!!! 하루에 약처방 한개는 무조건 넣어야함.. 
//				실제로는 하루에 진료기록이 하나도 없는경우는 없기떄문에, 진료기록에 날짜는 걸고,
//				더미데이터에 모든날 최소 1개의 진료기록을 넣는게 낫겠다. 



	request.setCharacterEncoding("UTF-8");

	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 tag에 필요한 코드
	int patientIdx = (int) request.getAttribute("patientIdx");
	request.setAttribute("patientIdx", patientIdx);

	int dDay = (int) request.getAttribute("dDay");
	request.setAttribute("dDay", dDay);
	
	Patient_1VO patientVO = PatientService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);

//	날짜 계산에 필요한 코드 
// 	int diffDay = Integer.parseInt(request.getParameter("diffDay"));
// 	request.setAttribute("diffDay", diffDay);
	

%>
<!-- prescriptionMedList -->
<!-- prescriptionTestList -->
<!-- medicalCommentList -->

<!-- header 페이지 삽입  -->
<jsp:include page="./header_goback_DisPatient.jsp"></jsp:include>

<div style="width: 1000px; border: solid 1px; position: absolute; top: 60px; left: 300px; padding: 5px;">

<fmt:formatDate var= "adDate" value="${patientVO.getAdDate()}" pattern="yyyy.MM.dd(E)"/>
<fmt:formatDate var= "DisDate" value="${patientVO.getDisDate()}" pattern="yyyy.MM.dd(E)"/>


<c:set var="view" value="${viewMedicalList.viewMedicalVOList}"/>
<c:if test="${view.size() == 0}">
					<marquee> 기록된 글이 없습니다.</marquee>
</c:if>
				
<c:if test="${view.size() != 0}">


<c:forEach var="i" begin="0" end="${view.size()-1}" step="1">
					
<c:set var="medicalCommentList" value="${view.get(i).getMedicalCommentList()}"/>

<div style="width: 900px; border: solid 1px; padding: 10px; margin: 20px; position: relative;">

<!-- 환자정보 (환자Tag) -->
	<div style="width: 700px; border: solid 1px; margin-top: 30px; margin-left: 80px; position: relative;">
		${patientVO.getPatientIdx()}&nbsp;&nbsp;${patientVO.getName()}&nbsp;&nbsp;${patientVO.getAge()}/${patientVO.getGender()}&nbsp;&nbsp;${patientVO.getDiagnosis()}   
		&nbsp;&nbsp;입원일 : ${adDate} &nbsp;&nbsp;퇴원일 : ${DisDate}<br/><br/> 
	</div> <br/>
		기록일 : <fmt:formatDate value="${medicalCommentList.medicalCommentList.get(0).writeDate}" pattern="yyyy.MM.dd(E)"/> 		
	
	
	<div style="width: 800px; border: solid 1px; margin-top: 30px; margin-left: 30px; position: relative;">
		
			<div>처방내역</div>
			<div style="border: solid 1px; width: 500px;">
	
				<table style="border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
						<th></th>
						<th style="border: solid 1px;">처방시각</th>
						<th style="border: solid 1px;">약명</th>
						<th style="border: solid 1px;">용량</th>
						<th style="border: solid 1px;">경로</th>
						<th style="border: solid 1px;">횟수</th>
						
					</tr>
				</table>

		<c:set var="prescriptionMedList" value="${view.get(i).getPrescriptionMedList()}"/>
		<c:if test="${prescriptionMedList.prescriptionMedList.size() != 0}">
			<c:forEach var="prescriptionMedVO" items="${prescriptionMedList.prescriptionMedList}">
				<table style="margin-top: 0px; margin-left: 0px; position: relative;">
					<tr>
					<td><img alt="화살표" src="./images/arrow2.png" width="20"/> &nbsp;&nbsp;</td> 
						<td style="border: solid 1px;"><fmt:formatDate value="${prescriptionMedVO.writedate}" pattern="a h:mm:ss" /></td>

						<td style="border: solid 1px;"><input type="text" value="${prescriptionMedVO.medicine}" readonly="readonly"/></td>
						<td style="border: solid 1px;"><input type="text" size="3" value="${prescriptionMedVO.dosage}" readonly="readonly"/></td>
						<td style="border: solid 1px;"><input type="text" size="5" value="${prescriptionMedVO.route}" readonly="readonly"/></td>
						<td style="border: solid 1px;"><input type="text" size="3" value="${prescriptionMedVO.injectTime}" readonly="readonly"/></td>
						
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:set var="prescriptionTestList" value="${view.get(i).getPrescriptionTestList()}"/>
		<c:if test="${prescriptionTestList.prescriptionTestList.size() != 0}">
			<c:forEach var="prescriptionTestVO" items="${prescriptionTestList.prescriptionTestList}">
				<table style="margin-top: 0px; margin-left: 0px; position: relative;">

					<tr>
						<td><img alt="화살표" src="./images/arrow2.png" width="20"/> &nbsp;&nbsp;</td> 
						<td style="border: solid 1px;"><fmt:formatDate value="${prescriptionTestVO.writedate}" pattern="a h:mm:ss" /></td>

						<td style="border: solid 1px;"><input type="text" style="width: 370px;" value="${prescriptionTestVO.test}" readonly="readonly"/></td>
					
					</tr>
				</table>
			</c:forEach>
		</c:if>

					<c:if test="${prescriptionMedList.prescriptionMedList.size() == 0}">
						<c:if test="${prescriptionTestList.prescriptionTestList.size() == 0}">
						
							<table>
								<tr>
									<td> 처방내역이 없습니다.</td>
								</tr>					
							</table>
						
						</c:if>
					</c:if> 

				</div>
			
			<br/>
			
			</div>
				
			
		<div style="width: 800px; border: solid 1px; margin-top: 30px; margin-left: 30px; position: relative;">
		진료기록
		<c:if test="${medicalCommentList.medicalCommentList.size() != 0}">
			<c:forEach var="vo" items="${medicalCommentList.medicalCommentList}">
				<c:set var="commentName" value="comment${vo.idx}"></c:set>
					<table style=" border: solid 1px; ">
						
						<tr>
					 		<td style="border: solid 1px;">
					 			<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
					 		</td>
						 	<td width="400px" style="border: solid 1px;">
						 		${vo.recordD}
						 		
						 	</td>
						 	
					 	</tr>
					 </table>
			</c:forEach>
		</c:if>
			<br/>
		<c:if test="${medicalCommentList.medicalCommentList.size() == 0}">
			<tr>
				<td>
					진료기록이 없습니다.
				</td>
			</tr>
		</c:if>
		
		
	</div>		
	
				
</div>
			
</c:forEach>
</c:if>	
	

<div style="position: relative; left: 330px; margin-top: 50px; margin-bottom: 20px">
	<table>
		<!-- 페이지 이동 버튼 -->
		<tr>
			<td align="center">
			
				<!-- 처음으로 -->
				<c:if test="${viewMedicalList.currentPage > 1}">
					<button class="button button1" type="button" title="첫 페이지로 이동합니다." 
							onclick="location.href='?currentPage=1&patientIdx=${patientIdx}&dDay=${dDay}'">처음</button>
				</c:if>
				
				<c:if test="${viewMedicalList.currentPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 페이지 입니다." 
							disabled="disabled">처음</button>
				</c:if>
				
				<!-- 10페이지 앞으로 -->
				<c:if test="${viewMedicalList.startPage > 1}">
					<button class="button button1" type="button" title="이전 5 페이지로 이동합니다." 
							onclick="location.href='?currentPage=${viewMedicalList.startPage - 1}&patientIdx=${patientIdx}&dDay=${dDay}'">
						이전
					</button>
				</c:if>
				
				<c:if test="${viewMedicalList.startPage <= 1}">
					<button class="button button2" type="button" title="이미 첫 5 페이지 입니다." 
							disabled="disabled">이전</button>
				</c:if>

				<!-- 페이지 이동 -->
				<c:forEach var="i" begin="${viewMedicalList.startPage}" end="${viewMedicalList.endPage}" step="1">
				
					<c:if test="${viewMedicalList.currentPage == i}">
						<button class="button button2" type="button" disabled="disabled">${i}</button>
					</c:if>
					
					<c:if test="${viewMedicalList.currentPage != i}">
						<button class="button button1" type="button" onclick="location.href='?currentPage=${i}&patientIdx=${patientIdx}&dDay=${dDay}'">
							${i}
						</button>
					</c:if>
				
				</c:forEach>

				<!-- 10페이지 뒤로 -->
				<c:if test="${viewMedicalList.endPage < viewMedicalList.totalPage}">
					<button class="button button1" type="button" title="다음 5 페이지로 이동합니다." 
							onclick="location.href='?currentPage=${viewMedicalList.endPage + 1}&patientIdx=${patientIdx}&dDay=${dDay}'">다음</button>
				</c:if>
				
				<c:if test="${viewMedicalList.endPage >= viewMedicalList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 5 페이지 입니다." 
							disabled="disabled">다음</button>
				</c:if>
				
				<!-- 마지막으로 -->
				<c:if test="${viewMedicalList.currentPage < viewMedicalList.totalPage}">
					<button class="button button1" type="button" title="첫 페이지로 이동합니다." 
							onclick="location.href='?currentPage=${viewMedicalList.totalPage}&patientIdx=${patientIdx}&dDay=${dDay}'">마지막</button>
				</c:if>
				
				<c:if test="${viewMedicalList.currentPage >= viewMedicalList.totalPage}">
					<button class="button button2" type="button" title="이미 마지막 페이지 입니다." disabled="disabled">
						마지막
					</button>
				</c:if>
			
			</td>
		</tr>
		
	</table>


</div>
	
	
</div>



<script type="text/javascript">




</script>

</body>
</html>
