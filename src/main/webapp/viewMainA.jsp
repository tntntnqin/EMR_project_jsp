<%@page import="java.util.Date"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.vo.WorkMemoA_19List"%>
<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.NoticeToA_18List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원무과viewMain</title>

<meta name="viewpport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/viewMain.css" />
<script type="text/javascript" src="./js/workmemo.js" defer="defer"></script>
<!-- 자동 새로고침 -->
<!-- <meta http-equiv="refresh" content="3; url='?' "> -->
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />

</head>
<body>	

	<%
		// 원무과 업무 알림 리스트
		NoticeToA_18List noticeToAlist = AcceptanceService.getinstance().selectNoticeToAList();
		request.setAttribute("noticeToAlist", noticeToAlist);
		
		
		// 원무과 메모 리스트
		WorkMemoA_19List workmemoList = AcceptanceService.getinstance().selectmemoList();
		request.setAttribute("workmemolist", workmemoList);
			 
			
		// 재원환자 리스트
		Patient_1List_All patient_1List_All = PatientService.getInstance().selectPatientList_All();
		request.setAttribute("patient_1List_All", patient_1List_All);
		 
	%>
	
	<jsp:include page="./header.jsp"></jsp:include>
	<jsp:include page="./quickmenu.jsp"></jsp:include>
	
	<div style="width: 1100px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
		<header>
			<input type="button" name="employee" value="사원조회"
				onclick="location.href='viewSearchEmployee.jsp'"/> 
			<input type="button" name="patient" value="퇴원환자조회"
				onclick="location.href='viewDisPatient.jsp'"/>
		</header>

		<section>
			<nav>
				<div style="height: 30px; width: 500px; margin-left: 30px;">업무 알림</div>
				<div style="border: solid 1px; width: 500px; height: 250px; margin-left: 30px; float: left; position: relative;" >
					<table class="table table-hover">
					<c:if test="${noticeToAlist.noticeToAList.size() != 0}">
						<c:forEach var="noticeToAVO" items="${noticeToAlist.noticeToAList}">
						<c:set var="alarmName" value="alarm${noticeToAVO.idx}"></c:set>
							<tr>
								<td>
									<button style="width: 480px; text-align: left;" class="block" id="${alarmName}"
										onclick="removeBlock(${alarmName})">
										${noticeToAVO.alarmA}&nbsp;&nbsp;${noticeToAVO.patientIdx}&nbsp;&nbsp;${noticeToAVO.name}&nbsp;&nbsp;from${noticeToAVO.fromDP}&nbsp;&nbsp;
										<fmt:formatDate value="${noticeToAVO.writedate}" pattern="a h:mm"/>
									</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${noticeToAlist.noticeToAList.size() == 0}">
						<tr>
							<td>
						
						수신된 알림이 없습니다.
							</td>
						</tr>
					</c:if> 
				</table>
				</div><br/>
				<form id="form" action="./workmemoOK.jsp" method="get" onsubmit="return workmemoCheck(this)">
					<!-- 입력창 따로 div만들어서 바닥에 붙이는거 해보기 -->
					<div style="border: solid 1px; width: 500px; height: 260px; position: relative; float: left; margin-top: 30px; margin-left: 20px;">
						<div>업무 메모</div>
						<div>
							<c:if test="${workmemolist.memoAlist.size() != 0}">
								<c:forEach var="workmemoAvo" items="${workmemolist.memoAlist}">
								<c:set var="formName" value="form${workmemoAvo.idx}"></c:set>
									<input type="checkbox" name="workmemo" class="workmemo" value="${workmemoAvo.idx}" onchange="checkboxcheck(this.value)">
									<%-- ${workmemopvo.idx} --%>${workmemoAvo.commentA}
									<fmt:formatDate value="${workmemoAvo.writedate}" pattern="MM/dd a h:mm"/><br/>
								</c:forEach>
							</c:if>	
							
							<c:if test="${workmemolist.memoAlist.size() == 0}">
								업무메모가 없습니다.
							</c:if>
							
						</div>
						<div style="width: 480px; text-align: right; margin-left:0px; margin-right:0px; margin-bottom:0px;position:relative;" >
							<input id="commentP" type="text" name="commentP"class="form-control" />
						</div>
						<div style="width: 480px; text-align: right; margin-bottom:0px; position:relative;" >
							<input type="submit" value="등록"> 
							<input type="button" class="update" name="update" value="수정"> 
							<input type="button" class="delete" name="delete" value="삭제">
						</div>
						<!-- <input id="chk" value="" type="hidden"></input> -->
					</div>
				</form>
			</nav>
			



<article>
		<div style="padding: 5px;">
			재원환자조회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="patient" value="환자등록" style="float: right;" onclick="location.href='insertPatient.jsp'"/>
		</div>
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
								onclick="location.href='insertAccept.jsp?patientIdx=<%=patientIdx%>&dDay=<%=dDay%>'">
								
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
			location.href='viewMainA.jsp';
			
		}, 5 * 1000)
		
	}
	
	
	// 새 알림이 오면 블럭처리된 상태인데 알림을 클릭하면 블럭처리가 사라지게하는 함수
	function removeBlock(obj) {

		console.log(obj);
		obj.classList.remove("block");	
	}
	
	// 체크 해제가 됐을 때도 값이 넘어감,,,
		function checkboxcheck(val) {	
			$('input:checkbox[name=workmemo]').each(function (val) {
				if($(this).is(":checked")==true){
			    	console.log($(this).val());
			    	let idx = $(this).val();
					$(this).val('');
					$(this).val(idx);
					commentDelete(idx);
					commentUpdate(idx);
			    } 
			})
		}
	</script>
	
</body>
</html>
