<%@page import="com.hospital.vo.NoticeToP_14VO"%>
<%@page import="com.hospital.vo.NursingComment_13VO"%>
<%@page import="com.hospital.vo.VitalSign_10VO"%>
<%@page import="com.hospital.vo.VitalSign_10List"%>
<%@page import="com.hospital.vo.Injection_11VO"%>
<%@page import="com.hospital.vo.Injection_11List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4VO"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.vo.NursingComment_13_List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간호수행</title>

<style type="text/css">

th {
	border: solid 1px;
}
td {
	border: solid 1px;
}
/* 추가  */
#red {
	color: red;
}

</style>

<!-- 자동 새로고침 에러-->
<!--  <meta http-equiv="refresh" content="3; url='?' ">  -->
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.ico" />
</head>
<body>

<%
//중간시작을 위해 임시로 설정한 아래 3줄 2101, '정호석'
//	session.setAttribute("employeeIdx", 2101);
//	session.setAttribute("employeeName", "정호석");
//	int patientIdx = 100001;

	request.setCharacterEncoding("UTF-8");

	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 tag에 필요한 코드
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
	Patient_1VO patientVO = NursingService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);
	
// 활력징후 
	VitalSign_10List vitalSignList = NursingService.getInstance().selectVitalSignList(patientIdx);
	request.setAttribute("vitalSignList", vitalSignList);
	
// 간호투약
	Injection_11List injectionList = NursingService.getInstance().selectInjectionList(patientIdx);
	request.setAttribute("injectionList", injectionList);

// 간호기록	
	NursingComment_13_List nursingCommentList = NursingService.getInstance().selectNursingCommentList(patientIdx);
	request.setAttribute("nursingCommentList", nursingCommentList);
%>
<!-- header 페이지 삽입  -->
<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>

<div style="width: 1100px; height:730px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">

	<header style="align-items: center;">
	<!-- 환자정보 (환자Tag) -->
		<div style="width: 500px; border: solid 1px; margin-top: 30px; margin-left: auto; margin-right: auto; position: relative; font-size: 20px; font-weight:bold;;">
			${patientVO.getPatientIdx()} ${patientVO.getName()} ${patientVO.getAge()}/${patientVO.getGender()} ${patientVO.getDiagnosis()} D+${dDay}
		</div>
	</header>
	
	<div style="width: 600px; text-align:right; margin-top: 15px; margin-left: 100px; position: relative;">
		<input type="button" value="환자 이상보고" 
			onclick="location.href='insertNoticeToDFromN.jsp?employeeIdx=<%=employeeIdx%>&fromName=<%=employeeName%>&patientIdx=<%=patientIdx%>&name=<%=patientVO.getName()%>&dDay=<%=dDay%>'"/>
		
		<input type="button" value="퇴원간호" 
			onclick="location.href='viewDisNursing.jsp?employeeIdx=<%=employeeIdx%>&employeeName=<%=employeeName%>&patientIdx=<%=patientIdx%>&dDay=<%=dDay%>'"/>	
	</div>
	
	<div style="width: 600px; border: solid 1px; margin-top: 30px; margin-left: 40px; position: relative;">
		활력징후
		<table style="border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
			<tr>
				<th width="70px">시간 </th>
				<th width="70px">혈압</th>
				<th width="70px">맥박</th>
				<th width="70px">체온</th> 
				<th width="70px">호흡</th> 
			</tr>
				
		</table>
			<c:forEach var="vitalVO" items="${vitalSignList.vitalSignList}">
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
						
					<tr>
				 		<th width="70px">
				 			${vitalVO.vitalTime}
				 		</th>
					 	<td>
					 		<input style="width: 70px" type="text" value="${vitalVO.bp}" readonly="readonly" />
					 	</td>
					 	<td>
					 		<input style="width: 70px" type="text" value="${vitalVO.hr}" readonly="readonly" />
					 	</td>
<!--비정상   -->
					 <c:if test="${vitalVO.bt >= 37}">
					 	<td>
					 		<input style="width: 70px" type="text" value="${vitalVO.bt}" readonly="readonly" id="red"/>
					 	</td>
					 </c:if>	
					 	<c:if test="${vitalVO.bt < 37}">
	<!-- 비정상 색넣기  -->				 	
						 	<td>
						 		<input style="width: 70px" type="text" value="${vitalVO.bt}" readonly="readonly" />
						 	</td>
					 	
					 	</c:if>
					 	<td>
					 		<input style="width: 70px" type="text" value="${vitalVO.rr}" readonly="readonly" />
					 	</td>
					 	<td>
				 			<button type="button" 
						 		onclick="location.href='deleteNursingVital.jsp?idx=${vitalVO.idx}&vitalTime=${vitalVO.vitalTime}&patientIdx=${patientIdx}&dDay=${dDay}'"> 
				 				<img alt="삭제" src="./images/x_circle.webp" width="15px">
					 		</button>
					 	</td>
				 	</tr>
				 </table>
			</c:forEach>

		<form action="insertNursing.jsp" method="post">
			<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
				<tr>
			 		<th width="70px">
<!-- 					<input style="width: 70px" type="text" name="vitalTime" /> -->
			 			<select name="vitalTime">
			 				<option value="MN">MN</option>
			 				<option value="1A">1A</option>
			 				<option value="2A">2A</option>
			 				<option value="3A">3A</option>
			 				<option value="4A">4A</option>
			 				<option value="5A">5A</option>
			 				<option value="6A">6A</option>
			 				<option value="7A">7A</option>
			 				<option value="8A">8A</option>
			 				<option value="9A" selected="selected">9A</option>
			 				<option value="10A">10A</option>
			 				<option value="11A">11A</option>
			 				<option value="MD">MD</option>
			 				<option value="1P">1P</option>
			 				<option value="2P">2P</option>
			 				<option value="3P">3P</option>
			 				<option value="4P">4P</option>
			 				<option value="5P">5P</option>
			 				<option value="6P">6P</option>
			 				<option value="7P">7P</option>
			 				<option value="8P">8P</option>
			 				<option value="9P">9P</option>
			 				<option value="10P">10P</option>
			 				<option value="11P">11P</option>
			 			</select>
				 		</th>
					 	<td>
					 		<input style="width: 70px" type="text" name="bp" />
					 	</td>
					 	<td>
							<input style="width: 70px" type="text" name="hr" />
					 	</td>
					 	<td>
							<input style="width: 70px" type="number" name="bt" value="36.5" step="0.1"/>
					 	</td>
					 	<td>
							<input style="width: 70px" type="number" name="rr" value="15"/>
					 	</td>
<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
								<button type="submit" disabled="disabled"> <img alt="추가" src="./images/plus.jpg" width="20px"></button>
					 		</td>
						</c:if>
	
						<c:if test="${dpart == '간호사'}">
							<td>
												<button type="submit"> <img alt="추가" src="./images/plus.jpg" width="20px"></button>
										 	</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
												<button type="submit" disabled="disabled"> <img alt="추가" src="./images/plus.jpg" width="20px"></button>
										 	</td>
						</c:if>
<!-- 여기까지  ======================================================   -->		 	
					 	
<!-- 					 	<td> -->
<!-- 							<button type="submit"> <img alt="추가" src="./images/plus.jpg" width="20px"></button> -->
<!-- 					 	</td> -->
				 	</tr>
				</table>
				<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
				<input type="hidden" value="${patientVO.getName()}" name="name">
				<input type="hidden" value="${employeeIdx}" name="employeeIdx">
				<input type="hidden" value="${employeeName}" name="employeeName">
				<input type="hidden" value="${dDay}" name="dDay">
			
			</form>
	</div>
	
<!-- 의사페이지에서 약 처방할때 간호 투약테이블에 insert가 바로 되어야함!! -->	
	<div style="width: 600px; border: solid 1px; margin-top: 30px; margin-left: 40px; position: relative;">
		투약
		<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
			<tr>
				<th width="110px">처방시각</th>
				<th width="180px">약명</th>
				<th width="80px">용량</th>
				<th width="60px">경로</th>
				<th width="100px">횟수</th>
				<th>9A</th>
				<th>1P</th>
				<th>6P</th> 
				<th>9P</th>
			</tr>
		</table>	
			<c:if test="${injectionList.injectionList.size() != 0}">
				<c:forEach var="injectionVO" items="${injectionList.injectionList}">
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
						<tr>
					 		<td width="110px">
					 			<fmt:formatDate value="${injectionVO.writedate}" pattern="a h:mm:ss"/>
					 		</td>
							<td width="180px">${injectionVO.medicine}</td>
							<td width="80px">${injectionVO.dosage}</td>
							<td width="60px">${injectionVO.route}</td>
							<td width="100px">${injectionVO.injectTime}</td>
							
						<c:if test="${injectionVO.realTime9A != 'Y'}">
							<td>
							<input type="checkbox" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=90&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
			
						<c:if test="${injectionVO.realTime9A == 'Y'}">
							<td>
							<input type="checkbox" checked="checked" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=91&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime1P != 'Y'}">
							<td>
							<input type="checkbox" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=130&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime1P == 'Y'}">
							<td>
							<input type="checkbox" checked="checked" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=131&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime6P != 'Y'}">
							<td>
							<input type="checkbox" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=180&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime6P == 'Y'}">
							<td>
							<input type="checkbox" checked="checked" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=181&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime9P != 'Y'}">
							<td>
							<input type="checkbox" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=210&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>
						
						<c:if test="${injectionVO.realTime9P == 'Y'}">
							<td>
							<input type="checkbox" checked="checked" 
							onchange="location.href='updateNursingInject.jsp?idx=${injectionVO.idx}&time=211&patientIdx=${patientIdx}&dDay=${dDay}'"/>
							</td>
						</c:if>	
					 	</tr>
					</table>
				</c:forEach>
			</c:if>
						
	<c:if test="${injectionList.injectionList.size() == 0}">
		<table>
			<tr>
				<td>
					금일 처방내역이 없습니다.
				</td>
			</tr>
		</table>
		</c:if>
	</div>
	
	<div style="width: 600px; border: solid 1px; margin-top: 30px; margin-left: 40px; position: relative;">
		검체채취
		<form action="insertNursing.jsp" method="post">
			<table style="border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
				<tr>
					<th>
					<label for="blood"><input type="radio" name="test" value="blood" id="blood">혈액검사</label>
					</th>
					<th>
					<label for="urine"><input type="radio" name="test" value="urine" id="urine">소변검사</label>
					</th>
					<th>
					<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
								<button type="submit" disabled="disabled">검사의뢰</button>
					 		</td>
						</c:if>
	
						<c:if test="${dpart == '간호사'}">
							<td>
												<button type="submit">검사의뢰</button>
										 	</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
								<button type="submit" disabled="disabled">검사의뢰</button>
						 	</td>
						</c:if>
					<!-- 여기까지  ======================================================   -->		 	
					</th>
				</tr>
			</table>
				<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
				<input type="hidden" value="${patientVO.getName()}" name="name">
				<input type="hidden" value="${employeeIdx}" name="employeeIdx">
				<input type="hidden" value="${employeeName}" name="fromName">
				<input type="hidden" value="${dDay}" name="dDay">
		</form>
	</div>
	
	
	
	
	<div style="width: 800px; border: solid 1px; margin-top: 30px; margin-left: 40px; position: relative;">
		간호기록
		<c:if test="${nursingCommentList.nursingCommentList.size() != 0}">
			<c:forEach var="vo" items="${nursingCommentList.nursingCommentList}">
				<c:set var="commentName" value="comment${vo.idx}"></c:set>
					<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;">
						
						<tr>
					 		<td>
					 			<fmt:formatDate value="${vo.writedate}" pattern="a h:mm:ss"/>
					 		</td>
						 	<td width="400px">
						 		<input type="text" value="${vo.recordN}" readonly="readonly" id="${commentName}">
						 		
						 	</td>
						 	<td>
						 		<input type="checkbox" onchange="commentCheck(${commentName})">
						 		<input class="btn btn-outline-info" type="button" value="수정" 
									onclick="commentUpdate(${commentName}, ${vo.idx}, ${patientIdx}, ${dDay})"/>
									
								<input class="btn btn-outline-danger" type="button" value="삭제" 
									onclick="location.href='deleteNursingComment.jsp?idx=${vo.idx}&patientIdx=${patientIdx}&dDay=${dDay}'"/>
						 	</td>
					 	</tr>
					 </table>
			</c:forEach>
		</c:if>
			<br/>
		<c:if test="${nursingCommentList.nursingCommentList.size() == 0}">
			<tr>
				<td>
					간호기록을 입력해주세요.
				</td>
			</tr>
		</c:if>
			<form action="insertNursing.jsp" method="post">
			<table>		
				<tr>
					<td width="495px">
						&nbsp;&nbsp;<input type="text" style="width: 450px;" name="recordN"/>
					</td>

					<td>
					<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<td>
								<button type="submit" disabled="disabled">등록하기</button>
					 		</td>
						</c:if>
	
						<c:if test="${dpart == '간호사'}">
							<td>
								<button type="submit">등록하기</button>
							</td>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<td>
								<button type="submit" disabled="disabled">등록하기</button>
						 	</td>
						</c:if>
					<!-- 여기까지  ======================================================   -->	
					</td>
				</tr>		
			</table>
			<input type="hidden" value="${patientVO.getPatientIdx()}" name="patientIdx">
			<input type="hidden" value="${patientVO.getName()}" name="name">
			<input type="hidden" value="${employeeIdx}" name="employeeIdx">
			<input type="hidden" value="${employeeName}" name="employeeName">
			<input type="hidden" value="${dDay}" name="dDay">
		</form>
	</div>
</div>

<script type="text/javascript">
function commentCheck(name) {
	
	name.removeAttribute("readonly");
	name.focus();
}

function commentUpdate(comment, nidx, pidx, day) {
//	console.log(comment);
//	console.log(comment.value);
//	console.log(nidx);
//	console.log(pidx);
	let recordN = comment.value;
 	location.href='updateNursingComment.jsp?idx=' + nidx + '&patientIdx=' + pidx + '&recordN=' + recordN + '&dDay=' + day;
}



</script>

</body>
</html>
