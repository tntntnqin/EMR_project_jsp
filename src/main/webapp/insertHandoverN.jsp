<%@page import="com.hospital.vo.HandoverN_9VO"%>
<%@page import="com.hospital.service.DoctorService"%>
<%@page import="com.hospital.dao.DoctorDAO"%>
<%@page import="com.hospital.vo.HandoverD_3VO"%>
<%@page import="com.hospital.service.NursingService"%>
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
	
	int employeeIdx = Integer.parseInt(request.getParameter("employeeIdx"));
	String fromName = request.getParameter("fromName");
	String commentN = request.getParameter("commentN");
	String fromDT = request.getParameter("fromDT");
	int lev = Integer.parseInt(request.getParameter("lev"));
	int gup = Integer.parseInt(request.getParameter("gup"));
		
	
	HandoverN_9VO handoverNVO = new HandoverN_9VO();
	
	handoverNVO.setCommentN(commentN);
	handoverNVO.setEmployeeIdx(employeeIdx);
	handoverNVO.setFromDT(fromDT);
	handoverNVO.setFromName(fromName);
	handoverNVO.setGup(gup);
	handoverNVO.setLev(lev);
	
%>

<%-- 	<jsp:useBean id="HandoverNVO" class="com.hospital.vo.HandoverN_9VO"> --%>
<%-- 		<jsp:setProperty property="*" name="HandoverDVO"/> --%>
<%-- 	</jsp:useBean> --%>

<%

	if (lev == 0) {
		NursingService.getInstance().insertHandoverN_new(handoverNVO);
		
	} else {
		
		NursingService.getInstance().insertHandoverN_reply(handoverNVO);
	}
	
	
	out.println("<script>");
	out.println("alert('업무인계에 글이 등록되었습니다.')");
	out.println("location.href='viewMainN.jsp'");
	out.println("</script>"); 



%>

</body>
</html>