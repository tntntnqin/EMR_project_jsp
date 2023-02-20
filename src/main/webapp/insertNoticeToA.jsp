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
		
%>

	<jsp:useBean id="noticeToAVO" class="com.hospital.vo.NoticeToA_18VO">
		<jsp:setProperty property="*" name="noticeToAVO"/>
	</jsp:useBean>

<%
	noticeToAVO.setAlarmA("퇴원수속");
	noticeToAVO.setFromDP("간호사");
	
	out.println(noticeToAVO);
	
	NursingService.getInstance().insertNoticeToA(noticeToAVO);
	
	out.println("<script>");
	out.println("alert(' To.원무과  " + noticeToAVO.getName() + "님의 퇴원수속 알림이 발송되었습니다.')");
	out.println("location.href='viewNursing.jsp?patientIdx=" + noticeToAVO.getPatientIdx() + "&dDay=" + dDay + "'");
	out.println("</script>"); 



%>

</body>
</html>