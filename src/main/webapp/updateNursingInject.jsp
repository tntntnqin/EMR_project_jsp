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
	request.setAttribute("patientIdx", patientIdx);
	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int time = Integer.parseInt(request.getParameter("time"));
	
	String realTime = null;
	
	switch (time) {
		case 90:
			realTime = "9A";
			NursingService.getInstance().updateInjectionY(idx, realTime);
			break;
		case 91:
			realTime = "9A";
			NursingService.getInstance().updateInjectionN(idx, realTime);
			break;
		case 130:
			realTime = "1P";
			NursingService.getInstance().updateInjectionY(idx, realTime);
			break;
		case 131:
			realTime = "1P";
			NursingService.getInstance().updateInjectionN(idx, realTime);
			break;
		case 180:
			realTime = "6P";
			NursingService.getInstance().updateInjectionY(idx, realTime);
			break;
		case 181:
			realTime = "6P";
			NursingService.getInstance().updateInjectionN(idx, realTime);
			break;
		case 210:
			realTime = "9P";
			NursingService.getInstance().updateInjectionY(idx, realTime);
			break;
		case 211:
			realTime = "9P";
			NursingService.getInstance().updateInjectionN(idx, realTime);
			break;
	}

	out.println("<script>");
	out.println("alert('" + realTime + " 투약여부가 변경되었습니다.')");
	out.println("location.href='viewNursing.jsp?patientIdx=" + patientIdx + "&dDay=" + dDay + "'" );
	out.println("</script>");
	
%>	
</body>
</html>