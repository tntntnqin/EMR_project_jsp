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
	String commentD = request.getParameter("commentD");
	String fromDT = request.getParameter("fromDT");
	int lev = Integer.parseInt(request.getParameter("lev"));
	int gup = Integer.parseInt(request.getParameter("gup"));
		
	
	HandoverD_3VO handoverDVO = new HandoverD_3VO();
	
	handoverDVO.setCommentD(commentD);
	handoverDVO.setEmployeeIdx(employeeIdx);
	handoverDVO.setFromDT(fromDT);
	handoverDVO.setFromName(fromName);
	handoverDVO.setGup(gup);
	handoverDVO.setLev(lev);
	
%>

<%-- 	<jsp:useBean id="HandoverDVO" class="com.hospital.vo.HandoverD_3VO"> --%>
<%-- 		<jsp:setProperty property="*" name="HandoverDVO"/> --%>
<%-- 	</jsp:useBean> --%>

<%

	if (lev == 0) {
	DoctorService.getInstance().insertHandoverD_new(handoverDVO);
		
	} else {
		
	DoctorService.getInstance().insertHandoverD_reply(handoverDVO);
	}
	
	
	out.println("<script>");
	out.println("alert('업무인계에 글이 등록되었습니다.')");
	out.println("location.href='viewMainDoctor.jsp'");
	out.println("</script>"); 



%>

</body>
</html>