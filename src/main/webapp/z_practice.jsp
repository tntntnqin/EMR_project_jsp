<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="sysday" class="java.util.Date" />
<fmt:formatDate var="now" value="${sysday}" pattern="yyyyMMdd" />

<fmt:formatDate var="adDate" value="${patientVO.adDate}" pattern="yyyyMMdd" />

날짜 수 : ${now - adDate}
<%

// 	Date date1 = new Date(2022, 10, 19, 02, 44);
// 	Date date1 = new Date(2022, 10, 19);
	
// 	out.println("date1 " + date1);
	

	Date date2 = new Date(2022, 10, 14);
	out.println("date2 " + date2);
		

// 	long sec = (today.getTime() - patientVO.getAdDate().getTime()) / 1000;
// 	long diffDay = sec / (24 * 60 * 60);

// 	long sec = (date1.getTime() - date2.getTime()) / 1000;
// 	long diffDay = sec / (24 * 60 * 60);
	
// 	out.println("차이= " + diffDay);

// 	out.println(today);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy, MM, dd");
	
	Date today = new Date();
	Date date1 = new Date(2022, 10, 14, 02, 44);
	Date date3 = new Date(2022, 10, 20);
	

	String sdfToday = sdf.format(today);
// 	String sdfAdDay = sdf.format(patientVO.getAdDate());
	String sdfAdDay = sdf.format(date1);
	
	Date sdf_Today = sdf.parse(sdfToday);
	Date sdf_AdDay = sdf.parse(sdfAdDay);

	out.println("오늘= " + sdf_Today);
	out.println("그날= " + sdf_AdDay);
	out.println("========================================= ");
			
	long sec = (sdf_Today.getTime() - sdf_AdDay.getTime()) / 1000;
	long diffDay = sec / (24 * 60 * 60);
	
	out.println("차이= " + diffDay);
	
	out.println("========================================= ");

	long sec2 = (date3.getTime() - date2.getTime()) / 1000;
	long diffDay2 = sec2 / (24 * 60 * 60);
	
	out.println("차이= " + diffDay2);

	out.println("========================================= ");
	
	out.println(date3);
	
%>






</body>
</html>