package com.hospital.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.HandoverD_3VO;
import com.hospital.vo.HandoverN_9VO;
import com.hospital.vo.MedicalComment_7VO;
import com.hospital.vo.Medicine_22VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.PrescriptionTest_5VO;

public class DoctorDAO {

	public static DoctorDAO instance = new DoctorDAO();

	private DoctorDAO() {
	}

	public static DoctorDAO getInstance() {
		return instance;
	}




	
// ===============================================================================	

// 메인페이지 (의사)	

	/* 환자 select */
	public Patient_1VO selectPatient(SqlSession mapper, int patientIdx) {
		
		System.out.println("DoctorDAO의 selectPatient() 메소드");
		return (Patient_1VO) mapper.selectOne("selectPatient", patientIdx);
	}
	
	public ArrayList<NoticeToD_2VO> selectNoticeToDList(SqlSession mapper, String doctorT) {
		System.out.println("NursingDAO의 selectNoticeToNList() 메소드");
		return (ArrayList<NoticeToD_2VO>) mapper.selectList("selectNoticeToDList", doctorT);
	}
	public ArrayList<HandoverD_3VO> selectHandoverDList(SqlSession mapper, String doctorT) {
		System.out.println("DoctorDAO의 selectHandoverDList() 메소드");
		return (ArrayList<HandoverD_3VO>) mapper.selectList("selectHandoverDList", doctorT);
	}

	
	
// ===============================================================================	
	
// 진료수행 페이지 (의사)	

//	약검색	
	public ArrayList<Medicine_22VO> selectMedicineListByName(SqlSession mapper, String mediName) {
		System.out.println("doctorDAO의 selectMedicineListByName() 메소드");
		return (ArrayList<Medicine_22VO>) mapper.selectList("selectMedicineListByName", mediName);
		
	}
//	약검색 후 선택
	public Medicine_22VO selectMedicineByCode(SqlSession mapper, String code) {
		System.out.println("Doctor의 selectMedicineByCode() 메소드");
		return (Medicine_22VO) mapper.selectOne("selectMedicineByCode", code);
	}
	
//	약물 처방 추가 	
	public void insertMediPreMed(SqlSession mapper, PrescriptionMed_4VO preMedVO) {
		System.out.println("DoctorDAO의 insertMediPreMed() 메소드");
		mapper.insert("insertMediPreMed", preMedVO);	
	}
//	약물 처방 추가 후 간호사에게 약처방 알림	
	public void insertNoticeToNFromD(SqlSession mapper, NoticeToN_8VO noticeToNVO) {
		System.out.println("doctorDAO의 insertNoticeToNFromD() 메소드");
		mapper.insert("insertNoticeToNFromD", noticeToNVO);
	}	
	
	
	
	
	/* 약 처방내역 */
	public ArrayList<PrescriptionMed_4VO> selectPrescriptionMedList(SqlSession mapper, int patientIdx) {
		System.out.println("DoctorDAO의 selectPrescriptionMedList(약 처방내역) 메소드");
		return (ArrayList<PrescriptionMed_4VO>) mapper.selectList("selectPrescriptionMedList", patientIdx);
	}	
	
	public ArrayList<PrescriptionTest_5VO> selectPrescriptionTestList(SqlSession mapper, int patientIdx) {
		System.out.println("DoctorDAO의 selectPrescriptionTestList(검사 처방내역) 메소드");
		return (ArrayList<PrescriptionTest_5VO>) mapper.selectList("selectPrescriptionTestList", patientIdx);
	
	}
	
	public ArrayList<MedicalComment_7VO> selectMediCommentList(SqlSession mapper, int patientIdx) {

		System.out.println("doctorDAO의 selectMediCommentList() 메소드");
		return (ArrayList<MedicalComment_7VO>) mapper.selectList("selectMediCommentList", patientIdx);
	}

	public void deleteMediPreMed(SqlSession mapper, int idx) {
		System.out.println("DoctorDAO의 deleteMediPreMed() 메소드");
		mapper.delete("deleteMediPreMed", idx);
		
	}
	
	public void deleteMediPreTest(SqlSession mapper, int idx) {
		System.out.println("DoctorDAO의 deleteMediPreTest() 메소드");
		mapper.delete("deleteMediPreTest", idx);
		
	}

	public void insertMediPreTest(SqlSession mapper, PrescriptionTest_5VO preTestVO) {
		System.out.println("DoctorDAO의 insertMediPreTest() 메소드");
		mapper.insert("insertMediPreTest", preTestVO);	
	}

	public void insertMediComment(SqlSession mapper, MedicalComment_7VO commentVO) {
		System.out.println("DoctorDAO의 insertMediComment() 메소드");
		mapper.insert("insertMediComment", commentVO);		
	}
	
	
	public void deleteMediComment(SqlSession mapper, int idx) {
		System.out.println("doctorDAO의 deleteMediComment() 메소드");
		mapper.delete("deleteMediComment", idx);
	}
	
	public void updateMediComment(SqlSession mapper, MedicalComment_7VO vo) {
		System.out.println("doctorDAO의 updateMediComment() 메소드");
		mapper.update("updateMediComment", vo);
	}
	
//	초진 환자 정보 저장
	public void updatePatient(SqlSession mapper, Patient_1VO patient_1vo) {
		System.out.println("doctorDAO의 updatePatient() 메소드");
		mapper.update("updatePatient", patient_1vo);
		
	}
	
//	초진 환자 알람
	public void insertNoticeToNFromD2(SqlSession mapper, NoticeToN_8VO noticeToN_8VO) {
		System.out.println("doctorDAO의 insertNoticeToNFromD2() 메소드");
		mapper.update("insertNoticeToNFromD2", noticeToN_8VO);
	}
	
	// =========================================================

//		업무인계
		public void insertHandoverD_new(SqlSession mapper, HandoverD_3VO handoverDVO) {
			System.out.println("DoctorDAO의 insertHandoverD_new() 메소드");
			mapper.insert("insertHandoverD_new", handoverDVO);	
		}

		public void insertHandoverD_reply(SqlSession mapper, HandoverD_3VO handoverDVO) {

			System.out.println("DoctorDAO의 insertHandoverD_reply() 메소드");
			mapper.insert("insertHandoverD_reply", handoverDVO);	
		}
		
			
		public HandoverD_3VO commentselectByIdx(SqlSession mapper, int idx) {
			System.out.println("DoctorDAO의 commentselectByIdx()");
			return (HandoverD_3VO) mapper.selectOne("commentselectByIdx", idx);
		}
		
		
		// 업무인계 삭제
		public void deletehandover(SqlSession mapper, int idx) {
			System.out.println("DoctorDAO의 deletehandover() 메소드 실행");
			mapper.delete("deletehandover", idx);
		}
		
		// 업무인계 수정
		public void updatehandover(SqlSession mapper, HandoverD_3VO handoverdvo) {
			System.out.println("DoctorDAO의 updatehandover() 메소드 실행");
			mapper.update("updatehandover", handoverdvo);
		}

	
	
	
}
