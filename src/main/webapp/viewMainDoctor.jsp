<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.vo.HandoverD_3List"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.NoticeToD_2List"%>
<%@page import="com.hospital.service.NursingService"%>
<%@page import="java.util.Date"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 메인</title>

<!-- 기본틀 css -->
<link rel="stylesheet" href="./css/mainframe.css"/>
<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/viewMain.css" />
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />


<style type="text/css">

#d1 {
	color: blue;	/* 금일입원한 환자는 재원환자조회에서 다른색 글씨로 나오게함 */
}

.block {
	background-color: #CEECF5; /* 새 알림이 오면 블럭처리된 상태이고 클릭하면 블럭처리가 사라짐  */
}

</style>

</head>
<body>
<%

// 의사 알림 리스트
	String doctorT = (String) session.getAttribute("doctorT");
	NoticeToD_2List noticeToDList = DoctorService.getInstance().selectNoticeToDList(doctorT);
	request.setAttribute("noticeToDList", noticeToDList);

// 간호사 업무인계 리스트	
	HandoverD_3List handoverDList = DoctorService.getInstance().selectHandoverDList(doctorT);	
	request.setAttribute("handoverDList", handoverDList);
	
// 재원환자 리스트
	Patient_1List_All patient_1List_All = PatientService.getInstance().selectPatientList_All();
	request.setAttribute("patient_1List_All", patient_1List_All);

	
%>

<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>

<div style="width: 1100px;  margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
		<header>
			<input type="button" name="employee" value="사원조회"
				onclick="location.href='viewSearchEmployee.jsp'"/> 
			<input type="button" name="patient" value="퇴원환자조회"
				onclick="location.href='viewDisPatient.jsp'"/>
		</header>

		<section>
			<nav>
		 	<div style="height: 30px; width: 500px; margin-left: 30px;">업무 알림</div>
				<div style="border: solid 1px; width: 500px; height: 250px; margin-left: 30px;" >
					<c:if test="${noticeToDList.noticeToDList.size() != 0}">
						<c:forEach var="noticeToDVO" items="${noticeToDList.noticeToDList}">
						<c:set var="alarmName" value="alarm${noticeToDVO.idx}"></c:set>
							<button style="width: 490px; text-align: left;" class="block" id="${alarmName}"
								onclick="removeBlock(${alarmName})">
								${noticeToDVO.alarmD}&nbsp;&nbsp;${noticeToDVO.patientIdx}&nbsp;&nbsp;${noticeToDVO.name}&nbsp;&nbsp;from${noticeToDVO.fromDP}&nbsp;&nbsp;
								<fmt:formatDate value="${noticeToDVO.writedate}" pattern="a h:mm"/>
							</button>
						</c:forEach>
					</c:if>
					<c:if test="${noticeToDList.noticeToDList.size() == 0}">
						수신된 알림이 없습니다.
					</c:if> 
				</div><br/>
				
<!-- 여기서부터 업무인계하면서 변경된 코드~~~ -->				
				<!-- 입력창 따로 div만들어서 바닥에 붙이는거 해보기 -->
				<div style="border: solid 1px; width: 500px; height: 300px; margin-left: 30px;  position: relative; float: left;">
					<div style="border: solid 1px; width: 500px; height: 260px;">
					<div>업무 인계</div>
						<c:if test="${handoverDList.handoverDList.size() != 0}">
							<c:forEach var="handoverDVO" items="${handoverDList.handoverDList}">
							<c:set var="handName" value="hand${handoverDVO.idx}"></c:set>
								<table style="width: 500px;">
									<tr>
										<td>
											<c:if test="${handoverDVO.lev > 0}">
												<c:forEach var="i" begin="1" end="${handoverDVO.lev}" step="1">
													&nbsp;&nbsp;&nbsp;
												</c:forEach>
												<img alt="화살표" src="./images/arrow2.png" width="20"/>							
											</c:if>
										<input type="checkbox" onchange="changeBtn(${handName})"/> 
										<input style="width: 250px;" type="text" readonly="readonly" value="${handoverDVO.commentD}" id="${handName}"/>
										by.${handoverDVO.fromName}
										<fmt:formatDate value="${handoverDVO.writedate}" pattern="MM/dd/hh:mm"/>
									</td>
								</tr>
							</table>
						</c:forEach>
					
					</c:if>
				<c:if test="${handoverDList.handoverDList.size() == 0}">
					인계 내용이 없습니다.
				</c:if>	
				<br/>
				
				</div>
			
				<form id="form" action="./insertHandoverD.jsp" method="post" >
				<div style="width: 99%; text-align: right; margin-bottom: 0px;">
					<input style="width: 300px;" type="text" name="commentD" id="commentD"/>
					<input type="submit" name="" value="새글등록" id="handInsert"> 
					<input type="button" name="" class="update" value="수정"> 
					<input type="button" name="" class="delete" value="삭제">
					
					<input type="hidden" value="${employeeIdx}" name="employeeIdx">
					<input type="hidden" value="${employeeName}" name="fromName">
					<input type="hidden" value="0" name="lev" id="lev">
					<input type="hidden" value="1" name="gup" id="gup">
					<input type="hidden" value="${doctorT}" name="fromDT">
				</div>
			</form>
		</div>
	</nav>
<!-- 업무인계 여기까지  -->
	<article>
		<div>재원환자조회</div>
		<div style="border: solid 1px; width: 450px; height: 570px;">
					
			<jsp:useBean id="today" class="java.util.Date" />
			<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
	
			<table class="table table-hover">
				<c:if test="${patient_1List_All.patient_1List_All.size() != 0}">
			
<%
	int dDay = 0;
	int patientIdx = 0;
	String name = null;
	int age = 0;
	String gender = null;
	String diagnosis = null;
	
	
	for (Patient_1VO patientVO: patient_1List_All.getPatient_1List_All()) {
		
		Date adDay = patientVO.getAdDate();
		
		Date todayForm = new Date(today.getYear() + 1900, today.getMonth() + 1, today.getDate()); 
		Date adDayForm = new Date(adDay.getYear() + 1900, adDay.getMonth() + 1, adDay.getDate());	
		
		long sec = (todayForm.getTime() - adDayForm.getTime()) / 1000;
		dDay = ((int) sec / (24 * 60 * 60)) + 1;
	
		patientIdx = patientVO.getPatientIdx();
		name = patientVO.getName();
		age = patientVO.getAge();
		gender = patientVO.getGender();
		diagnosis = patientVO.getDiagnosis();


%>
				
				<!-- <table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;"> -->
						
					<tr>
						<td>
					<!-- 재원환자별 스타일조정위해 태그에 아이디 설정-->				
							<button style="width: 98%; text-align: left;" id="d<%=dDay%>"
								onclick="location.href='viewPatientDetail.jsp?patientIdx=<%=patientIdx%>&dDay=<%=dDay%>'">
							<%=patientIdx%>&nbsp;&nbsp;<%=name%>&nbsp;&nbsp;<%=age%>/<%=gender%>&nbsp;&nbsp;<%=diagnosis%>&nbsp;&nbsp;D+<%=dDay%>
							</button>
						</td>						 	
					</tr>
<%

	}

%>
		</c:if>
		
		<c:if test="${patient_1List_All.patient_1List_All.size() == 0}">
			<tr>
				<td>
					재원 중인 환자가 없습니다.
				</td>
			</tr>
		</c:if>
	</table>
				
	</div>
</article>
		</section>
	</div>
<script type="text/javascript">

//5초마다 자동새로고침 함수!

onload = () => {
	
	setInterval(() => {
		location.href='viewMainDoctor.jsp';
		
	}, 30 * 1000)
	
}


// 새 알림이 오면 블럭처리된 상태인데 알림을 클릭하면 블럭처리가 사라지게하는 함수
function removeBlock(obj) {

	console.log(obj);
	obj.classList.remove("block");	
}


// 아래부터 업무인계 때 수정됐거나 추가된 코드야 

function changeBtn(obj) {	
	console.log('번호' + obj.id);
	console.log();
	let a = obj.id.substring(4);
	console.log(a);
	
	let btn = document.querySelector('#handInsert');
	let lev = document.querySelector('#lev');
	let gup = document.querySelector('#gup');
	
	if (btn.value == '댓글등록') {
		btn.value = '새글등록';
		
	} else {
		btn.value = '댓글등록';
		lev.value = '1';
		gup.value = a;
	}
	
	commentDelete(a);
	commentUpdate(a);
}
function commentDelete(a) {
	$('.delete').click(function() {		
		location.href = 'handoverDdeleteOK.jsp?idx=' + a;
	})
}


function commentUpdate(a) {
	$('.update').click(function() {	
		if ($('#commentD').val() == null) {
			alert('수정할 내용을 입력하세요');
			$('#commentD')[0].reset();
			$('#commentD').focus();
		} else {
			location.href = 'handoverDupdateOK.jsp?idx=' + a +'&commentD=' + commentD.value;
		}
	})
}
</script>


</body>
</html>
