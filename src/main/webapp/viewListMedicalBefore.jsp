<%@page import="com.hospital.vo.ViewMedicalVO"%>
<%@page import="com.hospital.vo.MedicalComment_7List"%>
<%@page import="com.hospital.vo.PrescriptionTest_5List"%>
<%@page import="com.hospital.vo.ViewMedicalList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hospital.vo.ViewNursingVO"%>
<%@page import="com.hospital.service.MenuService"%>
<%@page import="com.hospital.vo.ViewNursingList"%>
<%@page import="com.hospital.vo.NoticeToP_14VO"%>
<%@page import="com.hospital.vo.NursingComment_13VO"%>
<%@page import="com.hospital.vo.VitalSign_10VO"%>
<%@page import="com.hospital.vo.VitalSign_10List"%>
<%@page import="com.hospital.vo.Injection_11VO"%>
<%@page import="com.hospital.vo.Injection_11List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4List"%>
<%@page import="com.hospital.vo.PrescriptionMed_4VO"%>
<%@page import="com.hospital.vo.Patient_1VO"%>
<%@page import="com.hospital.service.NursingService"%>
<%@page import="com.hospital.vo.NursingComment_13_List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의무기록 조회</title>

<style type="text/css">


</style>
</head>
<body>

<!-- 날짜계산에 필요한 코드, 뷰페이지 오기 전에 설정해서 넘길것 , (이건 퇴원환자떄 필요 -->
<!-- 
<jsp:useBean id="sysday" class="java.util.Date" />
<fmt:formatDate var="now" value="${sysday}" pattern="yyyyMMdd" />

<fmt:formatDate var="adDate" value="${patientVO.adDate}" pattern="yyyyMMdd" />

날짜 수 : ${now - adDate}
 -->

<%

//중간시작을 위해 임시로 설정한 아래 3줄 2101, '정호석'
//	session.setAttribute("employeeIdx", 2101);
//	session.setAttribute("employeeName", "정호석");
//	int patientIdx = 100001;
//	int dDay = 21;
	
	request.setCharacterEncoding("UTF-8");

	int employeeIdx = (int) session.getAttribute("employeeIdx"); 
	String employeeName = (String) session.getAttribute("employeeName"); 
	
// 환자 tag에 필요한 코드
	int patientIdx = Integer.parseInt(request.getParameter("patientIdx"));
	request.setAttribute("patientIdx", patientIdx);

	int dDay = Integer.parseInt(request.getParameter("dDay"));
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
	
	ViewMedicalList viewMedicalList = new ViewMedicalList(pageSize, totalCount, currentPage);
	
	int startNo = viewMedicalList.getStartNo();
	int endNo = viewMedicalList.getEndNo();


	MenuService service = MenuService.getInstance();

	PrescriptionMed_4List prescriptionMedList = null;
	PrescriptionTest_5List prescriptionTestList = null;
	MedicalComment_7List medicalCommentList = null;
	
	ArrayList<ViewMedicalVO> viewMedicalVOList1 = new ArrayList<>();
	
	
	for (int subDay=1; subDay<=diffDay; subDay++) {
		
		ViewMedicalVO viewMedicalVO = new ViewMedicalVO(); 
		prescriptionMedList = service.selectPrescriptionMedList_Menu(patientIdx, subDay);
		prescriptionTestList = service.selectPrescriptionTestList_Menu(patientIdx, subDay);
		medicalCommentList = service.selectMediCommentList_Menu(patientIdx, subDay);
		
		viewMedicalVO.setPrescriptionMedList(prescriptionMedList);
		viewMedicalVO.setPrescriptionTestList(prescriptionTestList);
		viewMedicalVO.setMedicalCommentList(medicalCommentList);
		
		viewMedicalVOList1.add(viewMedicalVO);
		
	}

	ArrayList<ViewMedicalVO> viewMedicalVOList2 = new ArrayList<>();
	
	for (int i=startNo; i<=endNo; i++) {
	
		viewMedicalVOList2.add(viewMedicalVOList1.get(i));
	}
	
	
	viewMedicalList.setViewMedicalVOList(viewMedicalVOList2);
	
	
	
//	1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수가 초기화된 객체를 request 영역에 저장한다.
	request.setAttribute("viewMedicalList", viewMedicalList);
//	글을 입력할 때 엔터키를 눌러 줄을 바꿔 입력한 경우 브라우저에 <br/> 태그로 바꿔 출력하기 위해
//	request영역에 "\r\n"을 저장한다.
	request.setAttribute("enter", "\r\n");
//	request 영역에 저장된 데이터를 가지고 브라우저에 글을 출력하는 페이지로 넘겨준다.
	pageContext.forward("viewListMedical.jsp");
	
	
	

%>


<script type="text/javascript">




</script>

</body>
</html>
