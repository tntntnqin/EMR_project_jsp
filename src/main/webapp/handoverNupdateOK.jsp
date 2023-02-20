<%@page import="com.hospital.vo.HandoverN_9VO"%>
<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.HandoverD_3VO"%>
<%@page import="com.hospital.vo.WorkMemoP_15VO"%>
<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.WorkMemoA_19VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");
	String memo = request.getParameter("commentN");

	out.println("idx: " + idx);
	%>

	<jsp:useBean id="handovernvo" class="com.hospital.vo.HandoverN_9VO">
		<jsp:setProperty property="*" name="handovernvo" />
	</jsp:useBean>
	${handovernvo}



	<%
		NursingService nurseservice = NursingService.getInstance();
		HandoverN_9VO updatehandover = nurseservice.commentNselectByIdx(handovernvo.getIdx());
	
		nurseservice.updateNhandover(handovernvo) ;
	
		out.println("<script>");
		out.println("alert('업무인계 수정완료.')");
		out.println("location.href='workmemoNlist.jsp'");
		out.println("</script>");
	%>

</body>
</html>