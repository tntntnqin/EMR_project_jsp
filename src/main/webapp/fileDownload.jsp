<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사지 출력</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

span {
	color: black;
	text-decoration: none;
}
<link rel="shortcut icon" type="image/x-icon" href="./images/logo.png" />
</style>

</head>
<body>
	<%
	String uploadDirectory = application.getRealPath("./upload");

	String[] files = new File(uploadDirectory).list();
	//out.println(Arrays.toString(files));

 //	int i = 0;
//	for (String file : files) {
	%>
<%--	<%=++i%>. 
 	<a href="<%=request.getContextPath()%>/downloadTest?file=<%=URLEncoder.encode(file, "UTF-8")%>">
		 <span><%=file%></span> <img alt="다운로드 이미지" src="./images/download.png" width="20"/>
	</a>
	<br> --%>
	<%
//	}
	%> 

				<div style="border: solid 1px; width: 500px; height: 250px; margin-left:auto; margin-right:auto; margin-top:100px;position: relative;" >

					<table class="table table-hover">
<%
int i = 0;
for (String file : files) {

%>
					<tr>
						<td>
							<a href="<%=request.getContextPath()%>/downloadTest?file=<%=URLEncoder.encode(file, "UTF-8")%>">
								 <span><%=file%></span> <img alt="다운로드 이미지" src="./images/download.png" width="20"/>
							</a>
						</td>
					</tr>
<%
	}
%>					
				</table>
				</div><br/>

<%-- 	
<form action="<%=request.getContextPath() %>/downloadTest" method="post">
<input type="submit" value="도롱"> 
</form>--%>

</body>
</html>