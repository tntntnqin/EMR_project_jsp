package com.hospital.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.NoticeToA_18VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionTest_5VO;
import com.hospital.vo.WorkMemoA_19VO;

public class AcceptanceDAO {

	private static AcceptanceDAO instance = new AcceptanceDAO();
	private AcceptanceDAO() { }
	public static AcceptanceDAO getinstance() {
		return instance;
	}
	
	
	// 원무과 알림 리스트
	public ArrayList<NoticeToA_18VO> selectNoticeToAlist(SqlSession mapper) {
		System.out.println("AcceptanceDAO의 selectNoticeToAlist() 메소드");
		return (ArrayList<NoticeToA_18VO>) mapper.selectList("selectNoticeToAlist");
	}
	
	
	// 원무과 메모 리스트	
	public ArrayList<WorkMemoA_19VO> selectmemoList(SqlSession mapper) {
		System.out.println("AcceptanceDAO의 selectmemoList()");
		return (ArrayList<WorkMemoA_19VO>) mapper.selectList("selectmemoList");
	}
	
	
	// 원무과 메모 삽입
	public void workmemoinsert(SqlSession mapper, WorkMemoA_19VO workmemoavo) {
		System.out.println("AcceptanceDAO의 workmemoinsert() 메소드");
		mapper.insert("workmemoinsert", workmemoavo);
	}
	
	
	public WorkMemoA_19VO commentAselectByIdx(SqlSession mapper, int idx) {
		System.out.println("AcceptanceDAO의 commentAselectByIdx()");
		return (WorkMemoA_19VO) mapper.selectOne("commentAselectByIdx", idx);
	}
	
	
	// 원무과 메모 삭제
	public void deletememo(SqlSession mapper, int idx) {
		System.out.println("AcceptanceDAO의 deletememo() 메소드 실행");
		mapper.delete("deletememo", idx);
	}
	
	
	// 원무과 메모 수정
	public void updatememo(SqlSession mapper, WorkMemoA_19VO workmemoavo) {
		System.out.println("AcceptanceDAO의 updatememo() 메소드 실행");
		mapper.update("updatememo", workmemoavo);
	}
	
//	원무과 신환등록하면 알람 
	public void insertNoticeToDFromA(SqlSession mapper, NoticeToD_2VO noticeToD_2VO) {
		System.out.println("AcceptanceDAO의 insertNoticeToDFromA() 메소드 실행");
		mapper.insert("insertNoticeToDFromA", noticeToD_2VO);
		
	}
	// =================================================================
	// 퇴원수납 소변/혈액 검사
	public ArrayList<PrescriptionTest_5VO> selectPrescriptionTest(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 selectPrescriptionTest() 메소드");
		return (ArrayList<PrescriptionTest_5VO>) mapper.selectList("selectPrescriptionTest", patientIdx);
	}
	
	// 퇴원수납 혈액 검사 개수
	public int selectPreTestBCount(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 selectPreTestBCount() 메소드");
		return (int) mapper.selectOne("selectPreTestBCount", patientIdx);
	}
	// 퇴원수납 소변 검사 개수
	public int selectPreTestPCount(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 selectPreTestPCount() 메소드");
		return (int) mapper.selectOne("selectPreTestPCount", patientIdx);
	}
	
	
	// 약품비
	public int selectPrescriptionMed(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 selectPrescriptionMed() 메소드");
		return (int) mapper.selectOne("selectPrescriptionMed", patientIdx);
	}
	
	
	// 진찰료
	public int selectMedicalComment(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 selectMedicalComment() 메소드");
		return (int) mapper.selectOne("selectMedicalComment", patientIdx);
	}
	
	
	public Patient_1VO dischargeselectByIdx(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 dischargeselectByIdx()");
		return (Patient_1VO) mapper.selectOne("dischargeselectByIdx", patientIdx);
	}

	
	// 수납완료시 환자 퇴원컬럼 수정
	public void changedischarge(SqlSession mapper, Patient_1VO patientvo) {
		System.out.println("AcceptanceDAO의 changedischarge() 메소드 실행");
		mapper.update("changedischarge", patientvo);
		
	}
	public void updatePatientDischarge(SqlSession mapper, int patientIdx) {
		System.out.println("AcceptanceDAO의 updatePatientDischarge() 메소드 실행");
		mapper.update("updatePatientDischarge", patientIdx);
	}
	
}
