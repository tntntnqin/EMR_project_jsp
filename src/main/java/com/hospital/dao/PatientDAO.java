package com.hospital.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.Patient_1VO;
import com.hospital.vo.TestBlood_17VO;
import com.hospital.vo.TestUrine_21VO;

public class PatientDAO {
	public static PatientDAO instance = new PatientDAO(); 
	
	private PatientDAO() { }
	
	public static PatientDAO getInstance() {
		return instance;
	}

	public void InsertPatient(SqlSession mapper, Patient_1VO vo) {
		System.out.println("PatientDAO의 InsertPatient() 메소드 실행 ");
		mapper.insert("InsertPatient", vo);
	}

	
// ==================================================================================
// < 메인페이지 >

// 재원환자 조회
	
	public ArrayList<Patient_1VO> selectPatientList_All(SqlSession mapper) {
		System.out.println("PatientDAO의 selectPatientList_All() 메소드 실행");
		return (ArrayList<Patient_1VO>) mapper.selectList("selectPatientList_All");
		
	}
	
// 환자 Tag	
	public Patient_1VO selectPatient(SqlSession mapper, int patientIdx) {
		
		System.out.println("PatientDAO의 selectPatient() 메소드");
		return (Patient_1VO) mapper.selectOne("selectPatient", patientIdx);
	}

// =====================================================================
	
// < 메인페이지_ 메뉴바: 퇴원환자 조회 >
	
// 퇴원환자 리스트 
	
	public ArrayList<Patient_1VO> selectPatientList_DisAll(SqlSession mapper) {
		System.out.println("PatientDAO의 selectPatientList_DisAll() 메소드 실행");
		return (ArrayList<Patient_1VO>) mapper.selectList("selectPatientList_DisAll");
		
	}
	public ArrayList<Patient_1VO> selectPatientList_pIdx(SqlSession mapper, int patientIdx) {
		System.out.println("PatientDAO의 selectPatientList_pIdx() 메소드 실행");
		return (ArrayList<Patient_1VO>) mapper.selectList("selectPatientList_pIdx", patientIdx);
	}
	public ArrayList<Patient_1VO> selectPatientList_pName(SqlSession mapper, String pName) {
		System.out.println("PatientDAO의 selectPatientList_pName() 메소드 실행");
		return (ArrayList<Patient_1VO>) mapper.selectList("selectPatientList_pName", pName);
	}
	
	public ArrayList<Patient_1VO> selectPatientList_pDisDate(SqlSession mapper, Date pDisDate) {
		System.out.println("PatientDAO의 selectPatientList_pDisDate() 메소드 실행");
		return (ArrayList<Patient_1VO>) mapper.selectList("selectPatientList_pDisDate", pDisDate);
	}
	
	
// ==============================================================
// < 환자상세페이지 - 메뉴바 : 환자정보조회 >

//	환자 정보 수정
	public void updatePatientDetail(SqlSession mapper, Patient_1VO vo) {
		System.out.println("PatientDAO의 updatePatientDetail() 메소드 실행");
		mapper.update("updatePatientDetail", vo);
		
	}

//	끝번호 + 1 
	public int selectnewPatientIdx(SqlSession mapper) {
		System.out.println("PathologistDAO의 selectnewPatientIdx() 메소드");
		return (int) mapper.selectOne("selectnewPatientIdx");
	}
	
//	==========================

//	검사결과조회
	
	public ArrayList<TestUrine_21VO> selectUrineTest(SqlSession mapper, int patientIdx) {
		System.out.println("PatientDAO의 selectUrineTest() 메소드 실행");
		return (ArrayList<TestUrine_21VO>) mapper.selectList("selectUrineTest", patientIdx); 
		
	}

	public ArrayList<TestBlood_17VO> selectBloodTest(SqlSession mapper, int patientIdx) {
		System.out.println("PatientDAO의 selectBloodTest() 메소드 실행");
		return (ArrayList<TestBlood_17VO>) mapper.selectList("selectBloodTest", patientIdx);
	}	
	
	
	
	
	
}
