package com.hospital.service;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.DoctorDAO;
import com.hospital.dao.NursingDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.HandoverD_3List;
import com.hospital.vo.HandoverD_3VO;
import com.hospital.vo.HandoverN_9List;
import com.hospital.vo.MedicalComment_7List;
import com.hospital.vo.MedicalComment_7VO;
import com.hospital.vo.Medicine_22List;
import com.hospital.vo.Medicine_22VO;
import com.hospital.vo.NoticeToD_2List;
import com.hospital.vo.NoticeToN_8List;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.NursingComment_13_List;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionMed_4List;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.PrescriptionTest_5List;
import com.hospital.vo.PrescriptionTest_5VO;

public class DoctorService {

	public static DoctorService instance = new DoctorService();

	private DoctorService() {
	}

	public static DoctorService getInstance() {
		return instance;
	}




// ===============================================================================	

// 메인페이지 (의사)
	
	/* 환자 select */
	public Patient_1VO selectPatient(int patientIdx) {
		System.out.println("DoctorService의 selectPatient() 메소드");
		SqlSession mapper = MySession.getSession();
		Patient_1VO patientVO = DoctorDAO.getInstance().selectPatient(mapper, patientIdx);
		mapper.close();
		return patientVO;
	}
	
	public NoticeToD_2List selectNoticeToDList(String doctorT) {
		System.out.println("DoctorService의 selectNoticeToDList() 메소드");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결 성공: " + mapper);
		
		NoticeToD_2List noticeToDList   = new NoticeToD_2List();
		noticeToDList.setNoticeToDList(DoctorDAO.getInstance().selectNoticeToDList(mapper, doctorT));
		
		mapper.close();
		return noticeToDList;
	}

	public HandoverD_3List selectHandoverDList(String doctorT) {
		System.out.println("DoctorService의 selectHandoverDList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		HandoverD_3List handoverDList   = new HandoverD_3List();
		handoverDList.setHandoverDList(DoctorDAO.getInstance().selectHandoverDList(mapper, doctorT));
		
		mapper.close();
		return handoverDList;		
	}
	
	
	
// =================================================================================	
// 진료수행 페이지 (의사)

//	약검색리스트	

	public Medicine_22List selectMedicineListByName(String mediName) {
		System.out.println("doctorService의 selectMedicineListByName() 메소드");
		SqlSession mapper = MySession.getSession();
		
		Medicine_22List medicineList = new Medicine_22List();
		medicineList.setMedicineList(DoctorDAO.getInstance().selectMedicineListByName(mapper, mediName));
		
		mapper.close();
		return medicineList;
	}
	
//	약검색 후 선택
	public Medicine_22VO selectMedicineByCode(String code) {
		System.out.println("DoctorService의 selectMedicineByCode() 메소드");
		SqlSession mapper = MySession.getSession();
		Medicine_22VO medicineVO = DoctorDAO.getInstance().selectMedicineByCode(mapper, code);
		mapper.close();
		return medicineVO;
	}

//	약물 처방 추가
	public void insertMediPreMed(PrescriptionMed_4VO preMedVO) {
		System.out.println("DoctorService의 insertMediPreMed() 메소드");
		SqlSession mapper = MySession.getSession();
		
		DoctorDAO.getInstance().insertMediPreMed(mapper, preMedVO);
		
		mapper.commit(); 
		mapper.close(); 
	}

// 약 처방 간호사 알림 보내기
	
	public void insertNoticeToNFromD(NoticeToN_8VO noticeToNVO) {
		System.out.println("DoctorService의 insertNoticeToNFromD() 메소드");
		SqlSession mapper = MySession.getSession();
		
		DoctorDAO.getInstance().insertNoticeToNFromD(mapper, noticeToNVO);
		
		mapper.commit(); 
		mapper.close(); 
	}
		
	
	
	/* 약 처방내역 */
	public PrescriptionMed_4List selectPrescriptionMedList(int patientIdx) {
		System.out.println("DoctorService의 selectPrescriptionMedList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PrescriptionMed_4List prescriptionMedList = new PrescriptionMed_4List();
		prescriptionMedList
		.setPrescriptionMedList(DoctorDAO.getInstance().selectPrescriptionMedList(mapper, patientIdx));
		
		mapper.close();
		return prescriptionMedList;
	}
	
	public PrescriptionTest_5List selectPrescriptionTestList(int patientIdx) {
		System.out.println("DoctorService의 selectPrescriptionTestList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PrescriptionTest_5List prescriptionTestList = new PrescriptionTest_5List();
		prescriptionTestList.setPrescriptionTestList(DoctorDAO.getInstance().selectPrescriptionTestList(mapper, patientIdx));
		
		mapper.close();
		return prescriptionTestList;
	}
	
	public MedicalComment_7List selectMediCommentList(int patientIdx) {
		System.out.println("doctorService의 selectMediCommentList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		MedicalComment_7List medicalCommentList = new MedicalComment_7List();
		medicalCommentList.setMedicalCommentList(DoctorDAO.getInstance().selectMediCommentList(mapper, patientIdx));
		
		mapper.close();
		return medicalCommentList;
	}
	
	public void deleteMediPreMed(int idx) {
		
		System.out.println("DoctorService의 deleteMediPreMed() 메소드");
		SqlSession mapper = MySession.getSession();
		DoctorDAO.getInstance().deleteMediPreMed(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void deleteMediPreTest(int idx) {
		
		System.out.println("DoctorService의 deleteMediPreTest() 메소드");
		SqlSession mapper = MySession.getSession();
		DoctorDAO.getInstance().deleteMediPreTest(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	
	public void insertMediPreTest(PrescriptionTest_5VO preTestVO) {
		System.out.println("DoctorService의 insertMediPreTest() 메소드");
		SqlSession mapper = MySession.getSession();
		
		DoctorDAO.getInstance().insertMediPreTest(mapper, preTestVO);
		
		mapper.commit(); 
		mapper.close(); 
	}
	
	public void insertMediComment(MedicalComment_7VO commentVO) {
		System.out.println("DoctorService의 insertMediComment() 메소드");
		SqlSession mapper = MySession.getSession();
		
		DoctorDAO.getInstance().insertMediComment(mapper, commentVO);
		
		mapper.commit(); 
		mapper.close(); 
	}
	
	
	public void updateMediComment(MedicalComment_7VO vo) {
		System.out.println("doctorService의 updateMediComment() 메소드");
		SqlSession mapper = MySession.getSession();
		DoctorDAO.getInstance().updateMediComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public void deleteMediComment(int idx) {
		System.out.println("doctorService의 deleteMediComment() 메소드");
		SqlSession mapper = MySession.getSession();
		DoctorDAO.getInstance().deleteMediComment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
//	초진 환자 정보 등록
	public void updatePatient(Patient_1VO patient_1vo) {
		System.out.println("DoctorService의 updatePatient() 메소드");
		SqlSession mapper = MySession.getSession();
		DoctorDAO.getInstance().updatePatient(mapper, patient_1vo);
		
		mapper.commit();
		mapper.close();
	}
	
//	환자 초진 알람 보내기
	public void insertNoticeToNFromD2(NoticeToN_8VO noticeToN_8VO) {
		System.out.println("doctorService의 insertNoticeToNFromD2() 메소드");
		SqlSession mapper = MySession.getSession();
		
		DoctorDAO.getInstance().insertNoticeToNFromD2(mapper, noticeToN_8VO);
		
		mapper.commit();
		mapper.close();
	}
	
	// ======================
//		업무 인계 
		
	// 새글
		
		public void insertHandoverD_new(HandoverD_3VO handoverDVO) {
			System.out.println("DoctorService의 insertHandoverD_new() 메소드");
			SqlSession mapper = MySession.getSession();
			
			DoctorDAO.getInstance().insertHandoverD_new(mapper, handoverDVO);
			
			mapper.commit(); 
			mapper.close(); 
		}
		public void insertHandoverD_reply(HandoverD_3VO handoverDVO) {
			System.out.println("DoctorService의 insertHandoverD_reply() 메소드");
			SqlSession mapper = MySession.getSession();
			
			DoctorDAO.getInstance().insertHandoverD_reply(mapper, handoverDVO);
			
			mapper.commit(); 
			mapper.close(); 
		}
		
		
		public HandoverD_3VO commentselectByIdx(int idx) {
			System.out.println("DoctorService의 commentselectByIdx() 메소드");
			SqlSession mapper = MySession.getSession();
			
			HandoverD_3VO handoverdvo =  DoctorDAO.getInstance().commentselectByIdx(mapper, idx);
			
			mapper.commit();
			mapper.close();
			return handoverdvo;
		}
		
		
		// 의사 업무인계 삭제
		public void deletehandover(int idx) {
			System.out.println("DoctorService의 deletehandover()");
			SqlSession mapper = MySession.getSession();		
			DoctorDAO.getInstance().deletehandover(mapper, idx);
			
			mapper.commit();
			mapper.close();
		}
		
		
		// 의사 업무인계 수정
		public void updatehandover(HandoverD_3VO handoverdvo) {
			System.out.println("DoctorService의 updatehandover()");
			SqlSession mapper = MySession.getSession();		
			DoctorDAO.getInstance().updatehandover(mapper, handoverdvo);
			
			mapper.commit();
			mapper.close();
		}

	
}