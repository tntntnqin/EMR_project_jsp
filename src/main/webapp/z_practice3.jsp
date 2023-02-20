<%@page import="java.util.Date"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.PatientService"%>
<%@page import="com.hospital.vo.Patient_1List_All"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hospital.vo.ViewNursingVO"%>
<%@page import="com.hospital.vo.NursingComment_13_List"%>
<%@page import="com.hospital.vo.Injection_11List"%>
<%@page import="com.hospital.vo.VitalSign_10List"%>
<%@page import="com.hospital.service.MenuService"%>
<%@page import="com.hospital.vo.ViewNursingList"%>
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

<%--  <jsp:useBean id="sysday" class="java.util.Date" /> --%>
<%-- <fmt:formatDate var="now" value="${sysday}" pattern="yyyyMMdd" /> --%>

<%-- <fmt:formatDate var="adDate" value="${patientVO.adDate}" pattern="yyyyMMdd" /> --%>

<%-- 날짜 수 : ${now - adDate} --%>

<c:forEach var="i" begin="0" end="5" step="1">

안녕
</c:forEach>

${now}
${now -1 }

	<jsp:useBean id="today" class="java.util.Date" />
		<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
<%

	Date sysday = new Date();
	Date date1 = new Date(2022, 10, 19, 02, 44);
//	Date date1 = new Date(2022, 10, 19);

//	out.println("date1 " + date1);


// Date date2 = new Date(2022, 10, 14);
// out.println("date2 " + date2);
	
// 	long sec = (sysday.getTime() - date1.getTime()) / 1000;
// 	long diffDay = sec / (24 * 60 * 60);


out.println("년: " + sysday.getYear());
out.println("월: " + sysday.getMonth());
out.println("일: " + sysday.getDate());
out.println("월: " + sysday.getDay());

//	out.println(today);
// out.println(sysday);

//재원환자 리스트
	Patient_1List_All patient_1List_All = PatientService.getInstance().selectPatientList_All();
	request.setAttribute("patient_1List_All", patient_1List_All);

out.println("=====================================");

// out.println(patientVO.adDate); 

for (Patient_1VO patientVO: patient_1List_All.getPatient_1List_All()) {
	
	Date adDay = patientVO.getAdDate();
	long sec = (today.getTime() - adDay.getTime()) / 1000;
	int	dDay = ((int) sec / (24 * 60 * 60)) + 2;
%>

<%=dDay%>

<%


// 	out.println("디데이 " + dDay);
	out.println("<br/>");
 


}

out.println("=====================================");
Date adDate = patient_1List_All.getPatient_1List_All().get(0).getAdDate();


// 	long sec = (today.getTime() - patientVO.getAdDate().getTime()) / 1000;
	long sec = (today.getTime() - adDate.getTime()) / 1000;
	int	diffDay = (int) sec / (24 * 60 * 60);

	out.println("차이= " + diffDay);
	out.println("오늘" + today);
	
	String name = patient_1List_All.getPatient_1List_All().get(0).getName();
	out.println("이름" + name);

%>


		<c:if test="${patient_1List_All.patient_1List_All.size() != 0}">
			<c:forEach var="patientVO" items="${patient_1List_All.patient_1List_All}">
			
				<fmt:formatDate var="adDate" value="${patientVO.adDate}" pattern="yyyyMMdd" />

<!-- 재원환자별 스타일조정위해 태그에 아이디 설정-->				
				<c:set var="dDay" value="d${now - adDate + 1}"></c:set>
				
				<table style=" border: solid 1px; margin-top: 0px; margin-left: 0px; position: relative;"></table>
		</c:forEach>				
</c:if>


<%


Date date3 = new Date(2022, 10, 31);
Date date4 = new Date(2022, 11, 21);

long sec2 = (date4.getTime() - date3.getTime()) / 1000;
int	sec2day = ((int) sec2 / (24 * 60 * 60));



out.println("낢자: " + sec2day);


for (Patient_1VO patientVO: patient_1List_All.getPatient_1List_All()) {
	
	Date adDay = patientVO.getAdDate();
	long sec1 = (today.getTime() - adDay.getTime()) / 1000;
	int	dDay = ((int) sec / (24 * 60 * 60)) + 2;

	out.println("<br/>");

}
%>


<form action="z_practice4.jsp">

<input type="date" name="what">

<input type="submit">
</form>








</body>
</html>