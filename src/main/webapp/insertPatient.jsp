<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>신규환자 등록</title>


<script type="text/javascript" src="./js/juminForm.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />




</head>
<body>

<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./quickmenu.jsp"></jsp:include>

<div style="width: 1100px;  margin-left: auto; margin-right: auto; margin-top: 20px; border: solid 1px; padding: 20px;">
	<form action="insertPatientOK.jsp" method="post" name="insertPatient">
		<div style="width: 600px; border: solid 1px; margin-left: auto; margin-right: auto;">
		<table class="table" style="width: 600px; ">
			<thead>
				<tr>
					<th colspan="2">
						<h2>신규 환자 등록</h2>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th width="150px">성명</th>
					<td colspan="2">
						<input id="name" class="form-control" type="text" name="name" placeholder="이름" autocomplete="off" />
					</td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td colspan="2">
						<input id="registNum1" type="text" name="registNum1" autocomplete="off" width="100px" onkeyup="moveNext(this, 6, document.insertPatient.registNum2)"/>
						-<input id="registNum2" type="password" name="registNum2" autocomplete="off" width="100px" onkeyup="moveNext(this, 7, document.insertPatient.age)"/>
					</td>
				</tr>
				<tr>
					<th class="warning" style="vertical-align: middle;">나이</th>
					<td colspan="2">
						<input id="age" class="form-control" type="text" name="age" placeholder="나이"	autocomplete="off" />
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="2">
						<div class="form-group">
							<div class="btn-group" data-toggle="buttons">
								<label> <input type="radio" name="gender" value="M" checked="checked">남</label>
								 <label class="btn"> <input type="radio" name="gender" value="F">여</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2"><input id="address" class="form-control" type="text" name="address" autocomplete="off" /></td>
				</tr>
				<tr>
					<th>보험 종류</th>
					<td colspan="2">
						<div class="form-group"	>
							<div class="btn-group" data-toggle="buttons">
								<label> <input type="radio" name="insurance" value="건강보험" checked="checked">건강보험</label> 
								<label class="btn"> <input type="radio"	name="insurance"  value="의료급여">의료급여 </label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>입원실</th>
					<td colspan="2">
						<div>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn"><input type="radio" name="room" checked="checked" value="6인실">6인실</label> 
								<label class="btn"> <input type="radio" name="room" value="2인실">2인실</label> 
								<label class="btn"> <input type="radio" name="room" value="1인실">1인실</label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th>식사</th>
					<td colspan="2">
						<div>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn"> <input type="radio" name="meal" value="true">식사</label> 
								<label class="btn"> <input type="radio" name="meal"  checked="checked" value="false">신청안함</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>담당교수</th>
					<td colspan="2">
						<select name="doctorT" style="width: 200px;">
						<%-- <c:if>
						</c:if> --%>
							<option value="A">의사A</option>
							<option value="B">의사B</option>
							<option value="C">의사C</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>간호팀</th>
					<td colspan="2">
						<select name="nurseT" style="width: 200px;">
								<option value="A">간호A</option>
								<option value="B">간호B</option>
								<option value="C">간호C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;">
						<input class="btn" type="submit" value="등록하기" /> 
						<input class="btn" type="reset" value="다시쓰기">
					</td>
				</tr>
			</tbody>
		</table>
		</div>
	</form>
</div>
	

	
	

</body>
</html>