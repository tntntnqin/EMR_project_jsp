<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

		MultipartRequest mr = new MultipartRequest(request, application.getRealPath("/upload"), 5 * 1024 * 1024, "UTF-8",
		new DefaultFileRenamePolicy());

		String originalFilename = mr.getOriginalFileName("file1");
		out.println("원본파일이름 : " + originalFilename + "<br/>");
		
		
		File realFilename = mr.getFile("file1");
		out.println("저장된 파일이름 : " + realFilename.getName()+"<br/>");

		long fileLength = realFilename.length();
		if(fileLength > 5* 1024 *1024){
			
		out.println("<script>");
		out.println("alert('파일 용량 초과')");
		out.println("</script>");
		}else{
		out.println("<script>");
		out.println("alert('업로드 완료')");
		out.println("</script>");			
		}
			
	
	
		out.println("<script>");
		out.println("history.back(-1)");
		out.println("</script>");
		
	%>
	
	


</body>
</html>