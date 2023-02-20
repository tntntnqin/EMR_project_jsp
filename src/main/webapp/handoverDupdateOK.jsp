<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.vo.HandoverD_3VO"%>
<%@page import="com.hospital.vo.WorkMemoP_15VO"%>
<%@page import="com.hospital.service.PathologistService"%>
<%@page import="com.hospital.service.AcceptanceService"%>
<%@page import="com.hospital.vo.WorkMemoA_19VO"%>
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

	String idx = request.getParameter("idx");
	String memo = request.getParameter("commentD");

	//out.println("idx: " + idx);
	
	%>

	<jsp:useBean id="handoverdvo" class="com.hospital.vo.HandoverD_3VO">
		<jsp:setProperty property="*" name="handoverdvo" />
	</jsp:useBean>
	${handoverdvo}



	<%
	DoctorService doctorservice = DoctorService.getInstance();
	HandoverD_3VO updatehandover = doctorservice.commentselectByIdx(handoverdvo.getIdx());

	doctorservice.updatehandover(handoverdvo) ;

	out.println("<script>");
	out.println("alert('업무인계 수정완료.')");
	out.println("location.href='workmemoDlist.jsp'");
	out.println("</script>");
	%>

</body>
</html>