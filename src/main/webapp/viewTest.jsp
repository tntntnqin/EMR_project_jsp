<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병리사 메인페이지</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

 <style type="text/css">
	.disUse {
		opacity: 0;
		position: absolute;
		z-index: -1;
	}
	.use {
		
	
	}
	
</style> 


<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
	
	Patient_1VO patientVO = PatientService.getInstance().selectPatient(patientIdx);
	request.setAttribute("patientVO", patientVO);
	
%>
<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>
	<div style="width: 1100px; height:800px; margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px;">
		<header>
			<input type="button" name="employee" value="사원조회"
				onclick="location.href='viewSearchEmployee.jsp'"/> 
			<input type="button" name="patient" value="퇴원환자조회"
				onclick="location.href='viewDisPatient.jsp'"/>
		</header>
		<section>		
			<div style="width: 500px; border: solid 1px; margin-top: 30px; margin-left: auto; margin-right: auto; position: relative; font-size: 20px; font-weight:bold;;">
				${patientVO.getPatientIdx()} ${patientVO.getName()} ${patientVO.getAge()}/${patientVO.getGender()} ${patientVO.getDiagnosis()} D+${dDay}
			</div>
		</section>	
		<section>
			<div style="width: 300px; border: solid 1px; margin-top: 30px; margin-left: 100px; padding: 5px;" >
				<table class="table table-borderless">
					<tr align="center">
						<th>
							<label><input type="radio" class="form-check-input" value="blood" id="blood"name="insertTest" >혈액검사</label>
							<label><input type="radio" class="form-check-input" value="urine" id="urine" name="insertTest">소변검사</label>
						</th>
					</tr>
					<tr align="center">
					<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
						<c:if test="${dpart == '의사'}">
							<th>
								<input type="button" class="btn btn-sm btn-outline-info" value="선택" onclick="insertTestCheck()" disabled="disabled"/>
							</th>
						</c:if>
			
						<c:if test="${dpart == '간호사'}">
							<th>
								<input type="button" class="btn btn-sm btn-outline-info" value="선택" onclick="insertTestCheck()" disabled="disabled"/>
							</th>
						</c:if>
						
						<c:if test="${dpart == '병리사'}">
							<th>
								<input type="button" class="btn btn-sm btn-outline-info" value="선택" onclick="insertTestCheck()"/>
							</th>
						</c:if>
				<!-- 여기까지  ======================================================   -->	
					</tr>
				</table>
			</div>
		</section>
			
			<section>
				<nav>
<!-- =====================혈액 검사 결과 기록 ==================================== -->
				   <div id ="bloodTest" class="disUse" style=" border: solid 1px; width: 400px; margin-top:20px; margin-left:50px; float: left;">
				    	<div>혈액 검사 결과 기록</div>
					   <form action="viewTestOK.jsp" method="post" name="testbloodresult">
							<table id="testbloodresult" name="testbloodresult" class="table table-bordered">
								<tr>
									<th width="100px"><label for="WBC">WBC</label></th>
									<td><input type="text" id="WBC" name="WBC" style="width: 150px;">&nbsp;mm<sup>3</sup></td>
								</tr>
								<tr>
									<th><label for="Hb">Hb</label></th>
									<td><input type="text" id="Hb" name="Hb" style="width: 150px;">&nbsp;g/dl</td>
								</tr>
								<tr>
									<th><label for="Hct">Hct</label></th>
									<td><input type="text" id="Hct" name="Hct" style="width: 150px;">&nbsp;%</td>
								</tr>
								<tr>
									<th><label for="RBC">RBC</label></th>
									<td><input type="text" id="RBC" name="RBC" style="width: 150px;">&nbsp;mm3</td>
								</tr>
								<tr>
									<th><label for="MCV">MCV</label></th>
									<td><input type="text" id="MCV" name="MCV" style="width: 150px;">&nbsp;fl</td>
								</tr>
								<tr>
									<th><label for="MCH">MCH</label></th>
									<td><input type="text" id="MCH" name="MCH" style="width: 150px;">&nbsp;pg</td>
								</tr>
								<tr>
									<th><label for="MCHC">MCHC</label></th>
									<td><input type="text" id="MCHC" name="MCHC" style="width: 150px;">&nbsp;g/dl</td>
								</tr>
								<tr>
									<th><label for="Platelet">Platelet</label></th>
									<td><input type="text" id="Platelet" name="Platelet" style="width: 150px;">&nbsp;mm<sup>3</sup></td>
								</tr>
								<tr>
									<th colspan="2">
										<input type="hidden" name="patientIdx" value="${patientVO.getPatientIdx()}"/>			
										<input type="hidden" name="dDay" value="${dDay}"/>			
									</th>
								</tr>
								<tr>
									<th colspan="2">
										<input type="submit" class="btn btn-sm btn-outline-info" value="등록">
										<input type="reset" class="btn btn-sm btn-outline-danger" value="다시쓰기">
									</th>
								</tr>
							</table>
						</form>
					</div>
<!-- =====================소변 검사 결과 기록 ==================================== -->
					<div id ="urineTest" class="disUse"  style="border: solid 1px; width: 600px; margin-top:20px; margin-left:50px; float: left;">
						<div>소변 검사 결과 기록</div>
						<form action="viewTestOK.jsp" method="post" name="testbloodresult">
							<table id="testUrineresult" name="testUrineresult" class="table table-bordered">
								<tr>
									<th width="100px"><label for="color">color</label></th>
									<td colspan="3"><input type="text"  id="color"name="color"></td>
								</tr>
								<tr>
									<th><label for="turbidity">turbidity</label></th>
									<td colspan="3"><input type="text" id="turbidity" name="turbidity"></td>
								</tr>
								<tr>
									<th><label for="gravity">gravity</label></th>
									<td colspan="3"><input type="text" id="gravity" name="gravity"></td>
								</tr>
								<tr>
									<th><label for="acidity">acidity</label></th>
									<td colspan="3"><input type="text" id="acidity" name="acidity"></td>
								</tr>
								<tr>
									<th>albumin</th>
									<td>
										<select name="albumin">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
									<th>glucose</th>
									<td>
										<select name="glucose">
											<option value="Normal">Normal</option>
											<option value="Abnormal">Abnormal</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>ketones</th>
									<td>
										<select name="ketones">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
									<th>bilirubin</th>
									<td>
										<select name="bilirubin">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>blood</th>
									<td>
										<select name="blood">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
									<th>bilinogen</th>
									<td>
										<select name="bilinogen">
											<option value="Normal">Normal</option>
											<option value="Abnormal">Abnormal</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>nitrite</th>
									<td>
										<select name="nitrite">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
									<th>leukocyte</th>
									<td>
										<select name="leukocyte">
											<option value="Negative">Negative</option>
											<option value="Positive">Positive</option>
										</select>
									</td>
								</tr>
								<tr align="center">
									<th colspan="4">
										<input type="hidden" name="patientIdx" value="${patientVO.getPatientIdx()}"/>	
										<input type="hidden" name="dDay" value="${dDay}"/>			
										<input type="submit" class="btn btn-sm btn-outline-info" value="등록">
										<input type="reset" class="btn btn-sm btn-outline-danger" value="다시쓰기">&nbsp;
									</th>
								</tr>
							</table>
						</form>
					</div>
					<br/>
<!-- =====================파일 보내기랑 결과 보내기 ==================================== -->
			<!-- 나중에 수정 예정 -->
		 				<div style="width: 400px; margin-bottom:30px; border: 1px solid; margin-right: 40px; float: right;">
<%-- 				 		<form action="viewPatientDetail.jsp?patientIdx=${patientIdx}&dDay=${dDay}" method="post" enctype="multipart/form-data"> --%>
				 		<form action="uploadTestResult.jsp" method="post" enctype="multipart/form-data">
							<table class="table table-border">
								<tr class="table-info">
									<th colspan="2">검사결과</th>
								</tr>
								<tr>
									<th colspan="2">파일 업로드</th>
								</tr>
								<!-- 직종별 버튼 못쓰게 ========================================== -->					 	
								<c:if test="${dpart == '의사'}">
									<tr>
										<th><input type="file" name="file1"  disabled="disabled"/></th>
										<td><input type="submit" value="upload" disabled="disabled" /></td>
									</tr>
									<tr align="center">
										<th colspan="4"><input type="button" value="결과 보고"  disabled="disabled"/> 
											<input type="reset" value="다시쓰기" disabled="disabled"/>
										</th>
									</tr>
								</c:if>
						
									<c:if test="${dpart == '간호사'}">
										<tr>
											<th><input type="file" name="file1"  disabled="disabled"/></th>
											<td><input type="submit" value="upload" disabled="disabled" /></td>
										</tr>
										<tr align="center">
											<th colspan="4"><input type="button" value="결과 보고"  disabled="disabled"/> 
												<input type="reset" value="다시쓰기" disabled="disabled"/>
											</th>
										</tr>
									</c:if>
									
									<c:if test="${dpart == '병리사'}">
										<tr>
											<th><input type="file" name="file1"/></th>
											<td><input type="submit" value="upload"/></td>
										</tr>
										<tr align="center">
											<th colspan="4"><input type="button" value="결과 보고"/> 
												<input type="reset" value="다시쓰기"/>
											</th>
										</tr>
									</c:if>
								<!-- 여기까지  ======================================================   -->	
							</table>
							<input type="hidden" name="patientIdx" value="${patientIdx}">
							<input type="hidden" name="dDay" value="${dDay}">
						</form> 
					</div>
				<!-- 테스트차 여기 있음 퇴원수납페이지에서 검사지발급버튼으로 옮길것 -->
				<!-- <form action="fileDownload.jsp">
					<input class="btn" type="submit" value="검사지 발급" onclick="###" />
				</form> -->
				</nav>
		</section>
	</div>		

<script type="text/javascript">
//  이거 수정해서 누르면 한쪽이 readonly 설정 되게 
  function insertTestCheck() {
	let insertTest = $('input[name = insertTest]:checked').val();
	$('request')
	
	if (insertTest == 'blood') {
		$('#urineTest').addClass('disUse')
		$('#bloodTest').removeClass('disUse')
		var insertTestCheck 
	}else if (insertTest == 'urine') {
		$('#bloodTest').addClass('disUse')
		$('#urineTest').removeClass('disUse')
	}
} 
</script>

</body>
</html>