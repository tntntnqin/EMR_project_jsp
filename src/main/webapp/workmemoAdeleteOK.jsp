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
	
		out.println("idx: "+ idx);			
		
		
	%>
	
	<jsp:useBean id="workmemoavo" class="com.hospital.vo.WorkMemoA_19VO">
		<jsp:setProperty property="*" name="workmemoavo"/>
	</jsp:useBean>
	${workmemoavo}
	
	
	
	<%
		AcceptanceService acceptanceService = AcceptanceService.getinstance();
		WorkMemoA_19VO memo = acceptanceService.commentAselectByIdx(workmemoavo.getIdx());
		
		
		out.println("<script>");
		acceptanceService.deletememo(workmemoavo.getIdx());
		out.println("alert('메모 삭제완료.')");
		out.println("location.href='workmemolist.jsp'");
		out.println("</script>");
		
	%>
	
</body>
</html>