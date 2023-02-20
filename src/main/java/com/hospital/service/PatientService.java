package com.hospital.service;


import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.PatientDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.Patient_1List_All;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.TestBlood_17List;
import com.hospital.vo.TestUrine_21List;

public class PatientService {

	public static PatientService instance = new PatientService();

	private PatientService() {
	}
	public static PatientService getInstance() {
		return instance;
	}

	
	// insertPatientOK.jsp에서 호출 초진 환자를 데이터베이스에 저장하기 위한 insert
	public void InsertPatient(Patient_1VO vo) {
		System.out.println("PatientService의 Insert()메소드");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결 성공: " + mapper);

		PatientDAO.getInstance().InsertPatient(mapper, vo);

		mapper.commit();
		mapper.close();
	}

 
//	===============================================================================	
//	< 메인페이지 >
	 
// 재원환자 조회	 
	 public Patient_1List_All selectPatientList_All() {
		 System.out.println("PatientService의 selectPatientList_All() 메소드");
		 SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		 
		 Patient_1List_All patient_1List_All = new Patient_1List_All();
		 patient_1List_All.setPatient_1List_All(PatientDAO.getInstance().selectPatientList_All(mapper));
		 
		 mapper.close();
		 return patient_1List_All;
	 }

// 환자 Tag
	 public Patient_1VO selectPatient(int patientIdx) {
			System.out.println("PatientService의 selectPatient() 메소드");
			SqlSession mapper = MySession.getSession();
			Patient_1VO patientVO = PatientDAO.getInstance().selectPatient(mapper, patientIdx);
			mapper.close();
			return patientVO;
		}

// ========================================================================
	 
// < 메인페이지_메뉴바: 퇴원환자 조회>
	 
// 퇴원환자 리스트 
	 
	 public Patient_1List_All selectPatientList_DisAll() {
		 System.out.println("PatientService의 selectPatientList_DisAll() 메소드");
		 SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		 
		 Patient_1List_All patient_1List_DisAll = new Patient_1List_All();
		 patient_1List_DisAll.setPatient_1List_All(PatientDAO.getInstance().selectPatientList_DisAll(mapper));
		 
		 mapper.close();
		 return patient_1List_DisAll;
	 }		 
	 public Patient_1List_All selectPatientList_pIdx(int patientIdx) {
		 System.out.println("PatientService의 selectPatientList_pIdx() 메소드");
		 SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		 
		 Patient_1List_All patient_1List_pIdx = new Patient_1List_All();
		 patient_1List_pIdx.setPatient_1List_All(PatientDAO.getInstance().selectPatientList_pIdx(mapper, patientIdx));
		 
		 mapper.close();
		 return patient_1List_pIdx;
	 }		 
	 public Patient_1List_All selectPatientList_pName(String pName) {
		 System.out.println("PatientService의 selectPatientList_pName() 메소드");
		 SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		 
		 Patient_1List_All patient_1List_pName = new Patient_1List_All();
		 patient_1List_pName.setPatient_1List_All(PatientDAO.getInstance().selectPatientList_pName(mapper, pName));
		 
		 mapper.close();
		 return patient_1List_pName;
	 }		 
	 public Patient_1List_All selectPatientList_pDisDate(Date pDisDate) {
		 System.out.println("PatientService의 selectPatientList_pDisDate() 메소드");
		 SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		 
		 Patient_1List_All patient_1List_pDisDate = new Patient_1List_All();
		 patient_1List_pDisDate.setPatient_1List_All(PatientDAO.getInstance().selectPatientList_pDisDate(mapper, pDisDate));
		 
		 mapper.close();
		 return patient_1List_pDisDate;
	 }		 
	 
// ======================================================================

// < 환자상세페이지_메뉴바: 환자정보조회 >
	 
//	환자 정보 수정
	 public void updatePatientDetail(Patient_1VO vo) {
		 System.out.println("PatientService의 updatePatientDetail() 메소드");
		 SqlSession mapper = MySession.getSession();
		 
		 PatientDAO.getInstance().updatePatientDetail(mapper, vo);

		mapper.commit();
		mapper.close();
	 }
		 
//		환자 번호 제일 끝 번호를 가져와서  +1 해서 patientIdx 삽입해주기(서비스 클래스에서  +1 해옴) 아직 idx없어서 임시로 붙여주는 번호
//	 	초진 환자 환자번호 주려고 젤 끝번호 +1해주는 서비스 
		 public int selectnewPatientIdx() {
			System.out.println("PatientService의 selectBloodTest(검사결과) 메소드");
			SqlSession mapper = MySession.getSession();
					
			int newPatientIdx = PatientDAO.getInstance().selectnewPatientIdx(mapper);
			
			mapper.close();		
			return newPatientIdx + 1; 
			 }
// ======================
//	검사결과조회
		 
//			소변 검사결과를 환자번호로받아오는 서비스
	 public TestUrine_21List selectUrineTest(int patientIdx) {
		System.out.println("PatientService의 selectUrineTest(검사결과) 메소드");
		SqlSession mapper = MySession.getSession();
		TestUrine_21List testUrineList = new TestUrine_21List();
		testUrineList.setTestUrine_21List(PatientDAO.getInstance().selectUrineTest(mapper, patientIdx));
		
		mapper.close();
		return testUrineList;
		}
//			혈액 검사를 환자 번호로 받아오는 서비스
	 public TestBlood_17List selectBloodTest(int patientIdx) {
		System.out.println("PatientService의 selectBloodTest(검사결과) 메소드");
		SqlSession mapper = MySession.getSession();
		TestBlood_17List testBloodList = new TestBlood_17List();
		testBloodList.setTestBlood_17List(PatientDAO.getInstance().selectBloodTest(mapper, patientIdx));
		mapper.close();
		return testBloodList;
		}	
		 
		 
		 
}
