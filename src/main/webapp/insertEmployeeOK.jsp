<%@page import="com.hospital.service.EemployeeinsertService"%>
<%@page import="com.hospital.vo.Employee_20VO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String employeeIdx = request.getParameter("employeeIdx").trim();
		String password1 = request.getParameter("password1").trim();
		String password2 = request.getParameter("password2").trim();
		String name = request.getParameter("name").trim();
		String age = request.getParameter("age").trim();
		String gender = request.getParameter("gender").trim();
		String dpart = request.getParameter("dpart").trim();
		
		String doctorT = null;
		String nurseT = null;
		if(request.getParameter("dpart").equals("의사")){			
			 doctorT = request.getParameter("team");
			out.println("doctorT: "+ doctorT);
		} else if (request.getParameter("dpart").equals("간호사")){			
			 nurseT = request.getParameter("team");
			out.println("nurseT: "+ nurseT);
		} 
		
		String team = request.getParameter("team");
		String dnumber = request.getParameter("dnumber").trim();
		String enumber = request.getParameter("enumber").trim();
		
		
// 		out.println("employeeIdx: "+ employeeIdx); 
// 		out.println("password1: "+ password1);
// 		out.println("password2: "+ password2);
// 		out.println("name: "+ name);
// 		out.println("age: "+ age);
// 		out.println("gender: "+ gender);
// 		out.println("dpart: "+ dpart);
// 		//out.println(doctorT);
// 		//out.println(nurseT);
// 		out.println("team: "+ team);
// 		out.println("dnumber: "+ dnumber);
// 		out.println("enumber: "+ enumber);
		
		
		out.println("<script>");
		if (employeeIdx == null || employeeIdx.equals("") || 
				password1 == null || password1.equals("")||
				password2 == null || password2.equals("")||
				name == null || name.equals("")||
				age == null || age.equals("")||
				gender == null || gender.equals("")||
				dpart == null || dpart.equals("")||
				dnumber == null || dnumber.equals("")||
				enumber == null || enumber.equals("")) {
					out.println("alert('모든 내용을 입력하세요')");
					out.println("location.href='insertEmployee.jsp'");
					
			  } else if (!password1.equals(password2)){
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("location.href='insertEmployee.jsp'");
			 	
			} else {
				Employee_20VO employeevo = new Employee_20VO();  
				employeevo.setEmployeeIdx(Integer.parseInt(employeeIdx));
				employeevo.setPassword(password2);
				employeevo.setName(name);
				employeevo.setAge(Integer.parseInt(age));
				employeevo.setGender(gender);
				employeevo.setDpart(dpart);
				employeevo.setDoctorT(doctorT);
				employeevo.setNurseT(nurseT);
				employeevo.setDnumber(dnumber);
				employeevo.setEnumber(enumber);	
				EemployeeinsertService.getinstance().employeeinsert(employeevo);
				out.println("alert('회원가입 완료!')");
				out.println("location.href='login.jsp'");
			}
		out.println("</script>");
	%>
	

</body>
</html>