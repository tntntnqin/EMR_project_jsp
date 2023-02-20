<%@page import="java.util.ArrayList"%>
<%@page import="com.hospital.vo.ViewNursingVO"%>
<%@page import="com.hospital.vo.NursingComment_13_List"%>
<%@page import="com.hospital.vo.Injection_11List"%>
<%@page import="com.hospital.vo.VitalSign_10List"%>
<%@page import="com.hospital.service.MenuService"%>
<%@page import="com.hospital.vo.ViewNursingList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <jsp:useBean id="sysday" class="java.util.Date" />
<fmt:formatDate var="now" value="${sysday}" pattern="yyyyMMdd" />

<%-- <fmt:formatDate var="adDate" value="${patientVO.adDate}" pattern="yyyyMMdd" /> --%>

<%-- 날짜 수 : ${now - adDate} --%>

<c:forEach var="i" begin="0" end="5" step="1">

안녕
</c:forEach>

${now}
${now -1 }

<%



//중간시작을 위해 임시로 설정한 아래 3줄 2101, '정호석'
	session.setAttribute("employeeIdx", 2101);
	session.setAttribute("employeeName", "정호석");
	int patientIdx = 100001;
	int dDay = 21;
	
	request.setCharacterEncoding("UTF-8");

	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
//환자 tag에 필요한 코드
//	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

//	int dDay = Integer.parseInt(request.getParameter("dDay"));
	request.setAttribute("dDay", dDay);	

	
//	diffDay = dDay - 1이 된다. (이건 재원환자일 경우이고, 퇴원환자조회에서는 따로 계산식써야함)  	
	int diffDay = dDay - 1;


//	페이징 작업
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) { }
	

	int pageSize = 3;
	int totalCount = diffDay;
	
	ViewNursingList viewNursingList = new ViewNursingList(pageSize, totalCount, currentPage);
	
	int startNo = viewNursingList.getStartNo();
	int endNo = viewNursingList.getEndNo();


	MenuService service = MenuService.getInstance();

	VitalSign_10List vitalSignList = null;
	Injection_11List injectionList = null;
	NursingComment_13_List nursingCommentList = null;
// 	ViewNursingVO viewNursingVO = new ViewNursingVO(); 
	

	ArrayList<Integer> inte = new ArrayList<>();
	
	for (int j=1; j<=diffDay; j++) {	// diffDay = 20 임.
		
		inte.add(j);
		out.println("<br>");
	}
	
	out.println(inte);
//	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]	
	
	out.println("<br/><br/>");


	ArrayList<ViewNursingVO> viewNursingVOList1 = new ArrayList<>();

	for (int subDay=1; subDay<=diffDay; subDay++) {		// diffDay = 20 임.
		
		ViewNursingVO viewNursingVO = new ViewNursingVO();	
		vitalSignList = service.selectVitalSignList_Menu(patientIdx, subDay);
		injectionList = service.selectInjectionList_Menu(patientIdx, subDay);
		nursingCommentList = service.selectNursingCommentList_Menu(patientIdx, subDay);
		
		viewNursingVO.setVitalSignList(vitalSignList);
		viewNursingVO.setInjectionList(injectionList);
		viewNursingVO.setNursingCommentList(nursingCommentList);
		
// 		out.println(subDay + ": " );
// 		out.println(vitalSignList);
// 		out.println(viewNursingVO);
// 		out.println("<br/><br/>");
		
		viewNursingVOList1.add(viewNursingVO); 
// 		viewNursingVOList1.add(subDay-1, viewNursingVO);

		out.println("리스트 ->");
		out.println(viewNursingVOList1);  // 이거하면 위 int로 했던 것 처럼 안나오고 
		out.println("<br/><br/>");			// 쉽게 말하면 [20, 20, 20, 20, 20, 20.....20] 이렇게 나와
										// 맨마지막에 add된 데이터가 20번 나와.
										// 위 int로 했을 떄 나온거 보면 방법은 맞는데,
										// 데이터타입이 int일떄랑 class 일떄랑 뭔가 다른 규칙이 있는거같아
		
	}
	

	ArrayList<ViewNursingVO> viewNursingVOList2 = new ArrayList<>();
	
	for (int i=startNo; i<=endNo; i++) {
	
		viewNursingVOList2.add(viewNursingVOList1.get(i));
// 		out.println(viewNursingVOList1.get(i));
// 		out.println("<br/><br/>");
	}
	
	
	viewNursingList.setViewNursingVOList(viewNursingVOList2);
	
	
//	1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수가 초기화된 객체를 request 영역에 저장한다.
	request.setAttribute("viewNursingList", viewNursingList);
//	글을 입력할 때 엔터키를 눌러 줄을 바꿔 입력한 경우 브라우저에 <br/> 태그로 바꿔 출력하기 위해
//	request영역에 "\r\n"을 저장한다.
	request.setAttribute("enter", "\r\n");
//	request 영역에 저장된 데이터를 가지고 브라우저에 글을 출력하는 페이지(listView2.jsp)로 넘겨준다.
// 	pageContext.forward("viewListNursing.jsp");
	
	
	


	
%>






</body>
</html>