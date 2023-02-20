<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="./js/jquery-3.6.1.js"></script>

<!-- <script type="text/javascript" src="./js/bootstrap.js"></script> -->

</head>
<body>
<%

//	< 페이지 설명 >  
//	모든 페이지 최상단에 삽입되는 헤더 페이지.
//	로그인 정보(세션변수)와 로그아웃 버튼을 포함한다. 
//	세션변수 : employeeIdx, employeeName, dpart, doctorT, nurseT

%>
<%--  <div style="text-align: right; height: 60px;">
	<c:if test="${dpart == '의사'}">
		<img width="50px" alt="의사" src="./images/doctor.png" /> ${dpart} ${doctorT}팀 ${employeeName}
	</c:if>
	
	<c:if test="${dpart == '간호사'}">
		<img width="50px" alt="간호사" src="./images/nurse.png" /> ${dpart} ${nurseT}팀 ${employeeName}
	</c:if>
	
	<c:if test="${dpart == '병리사'}">
		<img width="50px" alt="병리사" src="./images/pathologist.png" /> ${dpart} ${employeeName}
	</c:if>
	
	<c:if test="${dpart == '원무과'}">
		<img width="50px" alt="원무과" src="./images/accountant.png" /> ${dpart} ${employeeName}
	</c:if>
	&nbsp;&nbsp; 
	<button style="border-color: white; background-color: white;" onclick="location.href='logout.jsp'">
		<img width="50px" alt="로그아웃" src="./images/logout.png">
	</button>
	&nbsp;&nbsp;
</div>  --%> 



<div style="text-align: right; height: 60px; padding: 20px">
	<c:if test="${dpart == '의사'}">
		&nbsp;&nbsp; 
	 <a class="navbar-brand" href="viewMainDoctor.jsp">
	 	<img src="./images/logo.png" alt="메인으로 가기" width="50px" align="left" style="margin-left: 10px;">
	</a>
	<img width="50px" alt="의사" src="./images/doctor.png" style="position: absolute; margin-left:-70px;"/> ${dpart} ${doctorT}팀 ${employeeName}
	</c:if>
	
	<c:if test="${dpart == '간호사'}">
			&nbsp;&nbsp; 
	 <a class="navbar-brand" href="viewMainN.jsp" style="align-items: flex-start;">
	 	<img src="./images/logo.png" alt="메인으로 가기" width="50px" align="left" style="margin-left: 10px;">
	</a>
		<img width="50px" alt="의사" src="./images/nurse.png" style="position: absolute; margin-left:-70px;"/> ${dpart} ${nurseT}팀 ${employeeName}
	
	</c:if>
	
	<c:if test="${dpart == '병리사'}">
			&nbsp;&nbsp; 
	 <a class="navbar-brand" href="viewMainP.jsp" style="align-items: flex-start;">
	 	<img src="./images/logo.png" alt="메인으로 가기" width="50px" align="left" style="margin-left: 10px;">
	</a>
		<img width="50px" alt="의사" src="./images/pathologist.png" style="position: absolute; margin-left:-70px;"/> ${dpart} ${employeeName}
	
	</c:if>
	
	<c:if test="${dpart == '원무과'}">
				&nbsp;&nbsp; 
	<a class="navbar-brand" href="viewMainA.jsp" style="align-items: flex-start;">
	 	<img src="./images/logo.png" alt="메인으로 가기" width="50px" align="left" style="margin-left: 10px;">
	</a>
		<img width="50px" alt="의사" src="./images/accountant.png" style="position: absolute; margin-left:-70px;"/> ${dpart} ${employeeName}
	</c:if>
	
	<button style="border-color: white; background-color: white; "  onclick="location.href='logout.jsp'">
		<img width="50px" alt="로그아웃" src="./images/logout.png" align="right">
	</button>
	&nbsp;&nbsp;
</div>



</body>
</html>