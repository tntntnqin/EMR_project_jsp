<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴원 환자 조회</title>

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
//  검색어가 비어있을때 /검색어에 숫자가 아닌데 검색어 눌럿을떄, js걸어서 알림뜨게ㅅ해야해.


request.setCharacterEncoding("UTF-8");

// int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
String item = request.getParameter("item").trim();

String category = request.getParameter("category");
request.setAttribute("category", category);
String set = request.getParameter("set");

if (item == null || set == null || item.equals("")) {
	
	out.println("<script>");
	out.println("alert('검색어를 입력해주세요.')");
	out.println("location.href='viewDisPatient.jsp'");
	out.println("</script>"); 
}



if (set == null) {
	out.println("<script>");
	out.println("alert('검색조건을 선택해주세요.')");
	out.println("location.href='viewDisPatient.jsp'");
	out.println("</script>"); 
	
}	
	
	
	if (set.equals("pIdx")) {
		
		int num = Integer.parseInt(item.trim());
		Patient_1List_All patient_1List_pIdx = PatientService.getInstance().selectPatientList_pIdx(num);
		request.setAttribute("patient_1List_Item", patient_1List_pIdx);
		
	} else if (set.equals("pName")) {
		
		Patient_1List_All patient_1List_pName = PatientService.getInstance().selectPatientList_pName(item.trim());
		request.setAttribute("patient_1List_Item", patient_1List_pName);
		
	} else if (set.equals("pDisDate")) {
		
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = format.parse(item);
		
		Patient_1List_All patient_1List_pDisDate = PatientService.getInstance().selectPatientList_pDisDate(date);
		request.setAttribute("patient_1List_Item", patient_1List_pDisDate);
		
	} else {
		out.println("<script>");
		out.println("alert('검색어를 입력해주세요.')");
		out.println("</script>"); 
		
	}


	
	
	
	


// 	switch (category) {
// 		case "vMed": 
			
// 			break;
			
			
// 		case "vNur": 
// 			break;
// 		case "vTest": 
// 			break;
// 		case "vPt": 
// 			break;

// 	}
	
pageContext.forward("viewDisPatient.jsp");





	
%>



	
</body>
</html>