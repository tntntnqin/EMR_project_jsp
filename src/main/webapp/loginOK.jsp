<%@page import="com.hospital.service.EmployeeService"%>
<%@page import="com.hospital.vo.Employee_20VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	// < 페이지 설명 >  
	// 로그인되면 로그인 정보를 세션에 담는다. 
	// 세션변수 : employeeIdx, employeeName, dpart, doctorT, nurseT

	request.setCharacterEncoding("UTF-8");
	//	로그인 페이지에서 얻어온 사번, 패스워드 	
	String employeeIdx = request.getParameter("employeeIdx").trim();
	String password = request.getParameter("password").trim();
	//	out.println(employeeIdx);
	//	out.println(password);

	//	사번이나 비번 입력 안되었으면 얼럿창 띄우고 다시 로그인 페이지로 이동
	if (employeeIdx == null || employeeIdx.equals("") || 
		password == null || password.equals("")) {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 입력해주세요.')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
	//	사번에 문자가 들어오면 생기는 에러 방지 
		try {
			
			Employee_20VO original = EmployeeService.getInstance().selectByEmployeeIdx(Integer.parseInt(employeeIdx));
	
			//	입력된 사번이 디비에 존재하면 	
			if (original != null) {
	
				// 	비번 확인후 부서에 따른 메인페이지로 이동
				request.setAttribute("original", original);
				out.println("<script>");
	
				if (password.equals(original.getPassword())) {
	
					session.setAttribute("employeeIdx", original.getEmployeeIdx());
					session.setAttribute("dpart", original.getDpart());
					session.setAttribute("employeeName", original.getName());
					
						if (original.getEmployeeIdx() / 1000 == 1) {
				
							session.setAttribute("doctorT", original.getDoctorT());
							out.println("location.href='viewMainDoctor.jsp'");
	
						} else if (original.getEmployeeIdx() / 1000 == 2) {
				
							session.setAttribute("nurseT", original.getNurseT());
							out.println("location.href='viewMainN.jsp'");
				
						} else if (original.getEmployeeIdx() / 1000 == 3) {
							out.println("location.href='viewMainP.jsp'");
				
						} else {
							out.println("location.href='viewMainA.jsp'");
						}
	
				} else {
					out.println("alert('비밀번호가 일치하지 않습니다.')");
					out.println("location.href='login.jsp'");
				}
				out.println("</script>");
	
			} else if (original == null) {
				out.println("<script>");
				out.println("alert('존재하지 않는 사번입니다.')");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}
		} catch (NumberFormatException e) {
			out.println("<script>");
			out.println("alert('사번은 숫자를 입력해주세요.')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		}
	%>


</body>
</html>