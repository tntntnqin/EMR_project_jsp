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
	
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
// 	String bt = request.getParameter("bt");
	
	if (request.getParameter("vitalTime") != null) {
		
%>

	<jsp:useBean id="vo" class="com.hospital.vo.VitalSign_10VO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
<%-- 	 ${vo} --%>

<%
	NursingService.getInstance().insertVital(vo);
	
	out.println("<script>");
	out.println("alert('" + vo.getVitalTime() + " 의 활력징후가 저장되었습니다.')");
	out.println("location.href='viewNursing.jsp?patientIdx=" + vo.getPatientIdx() + "&dDay=" + dDay + "'");
	out.println("</script>"); 


	} else if (request.getParameter("test") != null) { 

%>
	<jsp:useBean id="noticeToPVO" class="com.hospital.vo.NoticeToP_14VO">
		<jsp:setProperty property="*" name="noticeToPVO"/>
	</jsp:useBean>

<%
		if (request.getParameter("test").equals("blood")) {
			noticeToPVO.setAlarmP("혈액검사의뢰");
		} else {
			noticeToPVO.setAlarmP("소변검사의뢰");
		}
		NursingService.getInstance().insertNoticeToP(noticeToPVO);
		
		out.println("<script>");
		out.println("alert('To.병리사 검사의뢰 알림이 발송되었습니다.')");
		out.println("location.href='viewNursing.jsp?patientIdx=" + noticeToPVO.getPatientIdx() + "&dDay=" + dDay + "'");
		out.println("</script>");

	} else if (request.getParameter("recordN") != null) {
		
%>
	<jsp:useBean id="commentVO" class="com.hospital.vo.NursingComment_13VO">
		<jsp:setProperty property="*" name="commentVO"/>
	</jsp:useBean>

 	${commentVO}
<% 		
	NursingService.getInstance().insertNursingComment(commentVO);
	
	out.println("<script>");
	out.println("alert('간호기록이 등록되었습니다.')");
	out.println("location.href='viewNursing.jsp?patientIdx=" + commentVO.getPatientIdx() + "&dDay=" + dDay + "'" );
	out.println("</script>");

 	} else {
 		out.println("<script>");
 		out.println("alert('내용을 입력해주세요.')");
 		out.println("location.href='viewNursing.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'" );
 		out.println("</script>");
 	}
%> 


</body>
</html>