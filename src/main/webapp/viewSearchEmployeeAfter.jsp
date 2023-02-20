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
<title>사내검색</title>

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

String item = request.getParameter("item");
String set = request.getParameter("set");
/* String pIdx = request.getParameter("pIdx");
String pName = request.getParameter("pName");
String pDisDate = request.getParameter("pDisDate");	 */	// 2022-10-31


 if (set.equals("eName")) {
	
	Employee_20List employeeList = EmployeeService.getInstance().selectEmployeeListByName(item.trim());
	request.setAttribute("employeeList", employeeList);
	
	
	
	
} else if (set.equals("pName")) {
	
	Dpart_23List dpartList = EmployeeService.getInstance().selectdpartListByName(item.trim());
	request.setAttribute("dpartList", dpartList);
	
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
	
pageContext.forward("viewSearchEmployee.jsp");





	
%>



	
</body>
</html>