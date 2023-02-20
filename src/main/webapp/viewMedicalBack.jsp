<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.Dpart_23List"%>
<%@page import="com.hospital.service.EmployeeService"%>
<%@page import="com.hospital.vo.Employee_20List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

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

int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
int dDay = Integer.parseInt(request.getParameter("dDay"));
String code = request.getParameter("code");

request.setAttribute("dDay", dDay);



	

//		Medicine_22List medicineList = DoctorService.getInstance().selectMedicineListByName(mediName.trim());
//		request.setAttribute("medicineList", medicineList);
	
	

out.println("<script>");
out.println("location.href='viewMedical.jsp?patientIdx=" + patientIdx + "&code=" + code + "&dDay=" + dDay + "'");
out.println("</script>"); 

	
%>

<script type="text/javascript">



</script>

	
</body>
</html>