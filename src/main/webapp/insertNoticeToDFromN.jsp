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
	out.println(patientIdx);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);

%>

	<jsp:useBean id="noticeToDVO" class="com.hospital.vo.NoticeToD_2VO">
		<jsp:setProperty property="*" name="noticeToDVO"/>
	</jsp:useBean>

<%
	noticeToDVO.setAlarmD("환자이상");
	noticeToDVO.setFromDP("간호사");
	
	out.println(noticeToDVO);
	
	NursingService.getInstance().insertNoticeToDFromN(noticeToDVO);
	
	out.println("<script>");
	out.println("alert(' To.의사  " + noticeToDVO.getName() + "님의 이상보고 알림이 발송되었습니다.')");
	out.println("location.href='viewNursing.jsp?patientIdx=" + noticeToDVO.getPatientIdx() + "&dDay=" + dDay + "'");
	out.println("</script>"); 

%>

</body>
</html>