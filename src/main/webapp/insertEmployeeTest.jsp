<%@page import="org.apache.ibatis.migration.commands.NewCommand"%>
<%@page import="com.hospital.vo.Employee_20VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String id = request.getParameter("id").trim();
		String password1 = request.getParameter("password1").trim();
		String password2 = request.getParameter("password2").trim();
		String name = request.getParameter("name").trim();
		String age = request.getParameter("age").trim();
		String gender = request.getParameter("gender").trim();
		String dpart = request.getParameter("dpart").trim();
		String nurseT = request.getParameter("dpart").trim();
		String doctorT = request.getParameter("dpart").trim();
		String dnumber = request.getParameter("dnumber").trim();
		String enumber = request.getParameter("enumber").trim();
		//out.println(id + password1 + password2 + name + age + gender + dpart + dnumber + enumber);
		
		
		// 입력 체크 (공란 확인)
		if (id == null || id.equals("") || 
			password1 == null || password1.equals("")||
			password2 == null || password2.equals("")||
			name == null || name.equals("")||
			age == null || age.equals("")||
			gender == null || gender.equals("")||
			dpart == null || dpart.equals("")||
			dnumber == null || dnumber.equals("")||
			enumber == null || enumber.equals("")) {
			
			// 입력 체크 실패시 메시지를 session에 저장
			// getsessoin(): 서블릿에서 session을 얻어온다.
			request.getSession().setAttribute("messageType", "오류 메시지"); // ①
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요"); // ①
			response.sendRedirect("insertEmployee.jsp"); // ①
			
			// 입력 체크 성공 여부에 따른 메시지를 ajax로 넘겨준다.
			//response.getWriter().write("1");
			return; // 입력 데이터에 오류가 있으므로 서블릿을 종료
		}
		
		// 비밀번호 체크
		if (!password1.equals(password2)) {
			// 비밀번호 불일치 메시지를 session에 저장
			request.getSession().setAttribute("messageType", "오류 메시지"); // ①
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다."); // ①
			response.sendRedirect("insertEmployee.jsp"); // ①
			
			//response.getWriter().write("2");
			return; // 비밀번호가 일치하지 않으므로 서블릿을 종료
		}
		
	%>
		<jsp:include page="./viewMainA.jsp"></jsp:include>
	

</body>
</html>