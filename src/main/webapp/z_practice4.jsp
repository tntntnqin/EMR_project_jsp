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

<%

request.setCharacterEncoding("UTF-8");

String what = request.getParameter("what");

out.println(what);


%>








</body>
</html>