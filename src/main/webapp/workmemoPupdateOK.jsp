<%@page import="com.hospital.vo.WorkMemoP_15VO"%>
<%@page import="com.hospital.service.PathologistService"%>
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
	String memo = request.getParameter("commentP");

	out.println("idx: " + idx);
	%>

	<jsp:useBean id="workmemopvo" class="com.hospital.vo.WorkMemoP_15VO">
		<jsp:setProperty property="*" name="workmemopvo" />
	</jsp:useBean>
	${workmemopvo}



	<%
	PathologistService pathologistService = PathologistService.getInstance();
	WorkMemoP_15VO updatepmemo = pathologistService.commentPselectByIdx(workmemopvo.getIdx());

	pathologistService.updatePmemo(workmemopvo) ;

	out.println("<script>");
	out.println("alert('메모 수정완료.')");
	out.println("location.href='workmemoPlist.jsp'");
	out.println("</script>");
	%>

</body>
</html>