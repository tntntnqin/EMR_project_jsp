package com.hospital.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.Employee_20VO;
import com.hospital.vo.HandoverD_3VO;
import com.hospital.vo.HandoverN_9VO;
import com.hospital.vo.MedicalComment_7VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NoticeToP_14VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.PrescriptionTest_5VO;
import com.hospital.vo.TestBlood_17VO;
import com.hospital.vo.TestUrine_21VO;
import com.hospital.vo.WorkMemoA_19VO;
import com.hospital.vo.WorkMemoP_15VO;

public class PathologistDAO {

	public static PathologistDAO instance = new PathologistDAO();

	private PathologistDAO() {
	}

	public static PathologistDAO getInstance() {
		return instance;
	}




	
// ===============================================================================	

// 메인페이지 (병리사)	

	/* 환자 select */
	public Patient_1VO selectPatient(SqlSession mapper, int patientIdx) {
		System.out.println("PathologistDAO의 selectPatient() 메소드");
		return (Patient_1VO) mapper.selectOne("selectPatient", patientIdx);
	}
	
	// 병리사 알림 리스트
	public ArrayList<NoticeToP_14VO> selectNoticeToPList(SqlSession mapper) {
		System.out.println("PathologistDAO의 selectNoticeToPList() 메소드");
		return (ArrayList<NoticeToP_14VO>) mapper.selectList("selectNoticeToPList");
	}
	
//	직원 번호로 직원 정보 받아오기	
	public Employee_20VO selectByEmployeeIdx(SqlSession mapper, int employeeIdx) {
		System.out.println("PathologistDAO의 selectByEmployeeIdx() 메소드");
		return (Employee_20VO) mapper.selectOne("selectByEmployeeIdx", employeeIdx);
	}
// ===============================================================================	

	// 병리사 메모 리스트
	public ArrayList<WorkMemoP_15VO> selectmemoPList(SqlSession mapper) {
		System.out.println("PathologistDAO의 selectmemoPList() 메소드");
		return (ArrayList<WorkMemoP_15VO>) mapper.selectList("selectmemoPList");
	}
	
	
	// 메모 삽입
	public void workmemoPinsert(SqlSession mapper, WorkMemoP_15VO workmemopvo) {
		System.out.println("PathologistDAO의 workmemoPinsert() 메소드");
		mapper.insert("workmemoPinsert", workmemopvo);
	}
	
	
	public WorkMemoP_15VO commentPselectByIdx(SqlSession mapper, int idx) {
		System.out.println("PathologistDAO의 commentPselectByIdx()");
		return (WorkMemoP_15VO) mapper.selectOne("commentPselectByIdx", idx);
	}
	
	
	// 메모 삭제
	public void deletePmemo(SqlSession mapper, int idx) {
		System.out.println("PathologistDAO의 deletePmemo() 메소드 실행");
		mapper.delete("deletePmemo", idx);
	}
	
	
	// 메모 수정
	public void updatePmemo(SqlSession mapper, WorkMemoP_15VO workmemopvo) {
		System.out.println("PathologistDAO의 updatePmemo() 메소드 실행");
		mapper.update("updatePmemo", workmemopvo);
	}
// ===============================================================================	

	//	혈액 검사 결과를 저장한다.
	public void insertTestBlood(SqlSession mapper, TestBlood_17VO testBlood_17VO) {
		System.out.println("PathologistDAO의 selectNoticeToPList() 메소드");
		mapper.insert("insertTestBlood", testBlood_17VO);
	}

	//	소변 검사 결과를 저장한다.
	public void insertTestUrine(SqlSession mapper, TestUrine_21VO testUrine_21VO) {
		System.out.println("PathologistDAO의 selectNoticeToPList() 메소드");
		mapper.insert("insertTestUrine", testUrine_21VO);
	}
//========================================================
//	의사에게 검사 결과 알림
	public void insertNoticeToD(SqlSession mapper, NoticeToD_2VO noticeToD_2VO) {
		System.out.println("PathologistDAO의 insertNoticeToD() 메소드");
		mapper.insert("insertNoticeToD", noticeToD_2VO);
	}

//	간호사에게 검사 결과 알림
	public void insertNoticeToN(SqlSession mapper, NoticeToN_8VO noticeToN_8VO) {
		System.out.println("PathologistDAO의 insertNoticeToN() 메소드");
		mapper.insert("insertNoticeToN", noticeToN_8VO);
	}	
}
