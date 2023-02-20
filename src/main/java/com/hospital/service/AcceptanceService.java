package com.hospital.service;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.AcceptanceDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.WorkMemoA_19List;
import com.hospital.vo.WorkMemoA_19VO;
import com.hospital.vo.NoticeToA_18List;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionTest_5List;

public class AcceptanceService {

	private static AcceptanceService instance = new AcceptanceService();
	private AcceptanceService() {}
	public static AcceptanceService getinstance() {
		return instance;
	}
	
	
	
	// 원무과 메인페이지 업무 알림 리스트
	public NoticeToA_18List selectNoticeToAList() {
		System.out.println("AcceptanceService의 selectNoticeToAList() 메소드");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결 성공: ");
		
		NoticeToA_18List noticeAlist = new NoticeToA_18List();
		//noticeAlist.setNoticeToAList(AcceptanceDAO.getinstance().selectNoticeToAlist(mapper, accepT));
		noticeAlist.setNoticeToAList(AcceptanceDAO.getinstance().selectNoticeToAlist(mapper));
		
		mapper.commit();
		mapper.close();
		return noticeAlist;		
	}
	
	
	
	// 원무과 메인페이지 업무메모 리스트
	public WorkMemoA_19List selectmemoList() {
		System.out.println("AcceptanceService의 selectmemoList()");
		SqlSession mapper = MySession.getSession();
		
		WorkMemoA_19List workmemolist = new WorkMemoA_19List();
		workmemolist.setMemoAlist(AcceptanceDAO.getinstance().selectmemoList(mapper));
		
		mapper.commit();
		mapper.close();
		return workmemolist;
	}
	
	
	// 원무과 메인페이지 업무메모 삽입
	public void workmemoinsert(WorkMemoA_19VO workmemoavo) {
		System.out.println("AcceptanceService의 workmemoinsert()");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결성공");
		
		AcceptanceDAO.getinstance().workmemoinsert(mapper, workmemoavo);
		
		mapper.commit();
		mapper.close();
	}
	
	
	public WorkMemoA_19VO commentAselectByIdx(int idx) {
		System.out.println("AcceptanceService의 commentAselectByIdx()");
		SqlSession mapper = MySession.getSession();
		
		WorkMemoA_19VO workmemoavo = AcceptanceDAO.getinstance().commentAselectByIdx(mapper, idx);
		
		mapper.commit();
		mapper.close();
		return workmemoavo;
	}
	
	
	// 원무과 업무메모 삭제
	public void deletememo(int idx) {
		System.out.println("AcceptanceService의 deletememo()");
		SqlSession mapper = MySession.getSession();		
		AcceptanceDAO.getinstance().deletememo(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	
	// 원무과 업무메모 수정
	public void updatememo(WorkMemoA_19VO workmemoavo) {
		System.out.println("AcceptanceService의 updatememo()");
		SqlSession mapper = MySession.getSession();		
		AcceptanceDAO.getinstance().updatememo(mapper, workmemoavo);
		
		mapper.commit();
		mapper.close();
	}
	
//	원무과에서 신환등록하면 의사에게 알람가는 서비스
	public void insertNoticeToDFromA(NoticeToD_2VO noticeToD_2VO) {
		System.out.println("AcceptanceService의 insertNoticeToDFromA()");
		SqlSession mapper = MySession.getSession();		
		AcceptanceDAO.getinstance().insertNoticeToDFromA(mapper, noticeToD_2VO);
		
		mapper.commit();
		mapper.close();
	}
	// =================================================================
	// 퇴원수납 혈액/소변검사
	public PrescriptionTest_5List selectPrescriptionTest(int patientIdx) {
		System.out.println("AcceptanceService의 selectPrescriptionTest() 메소드");
		SqlSession mapper = MySession.getSession();
		//PrescriptionTest_5VO prescriptionTestList =  AcceptanceDAO.getinstance().selectPrescriptionTest(mapper, patientIdx);
		PrescriptionTest_5List prescriptionTestList = new PrescriptionTest_5List();
		prescriptionTestList.setPrescriptionTestList(AcceptanceDAO.getinstance().selectPrescriptionTest(mapper, patientIdx));
		mapper.commit();
		mapper.close();
		return prescriptionTestList;
	}
	
	
	// 퇴원수납 혈액검사 개수
	public int selectPreTestBCount(int patientIdx) {
		System.out.println("AcceptanceService의 selectPreTestBCount() 메소드");
		SqlSession mapper = MySession.getSession();
		int pretestBcount =  AcceptanceDAO.getinstance().selectPreTestBCount(mapper, patientIdx);
		mapper.commit();
		mapper.close();
		return pretestBcount;
	}
	// 퇴원수납 소변검사 개수
	public int selectPreTestPCount(int patientIdx) {
		System.out.println("AcceptanceService의 selectPreTestPCount() 메소드");
		SqlSession mapper = MySession.getSession();
		int pretestPcount =  AcceptanceDAO.getinstance().selectPreTestPCount(mapper, patientIdx);
		mapper.commit();
		mapper.close();
		return pretestPcount;
	}
	
	
	// 퇴원수납 약품비(약품 개수)
	public int selectPrescriptionMed(int patientIdx) {
		System.out.println("AcceptanceService의 selectPrescriptionMed() 메소드");
		SqlSession mapper = MySession.getSession();
		int premedcount =  AcceptanceDAO.getinstance().selectPrescriptionMed(mapper, patientIdx);
		mapper.commit();
		mapper.close();
		return premedcount;
	}
	
	
	// 퇴원수납 진찰료(진찰 개수)
	public int selectMedicalComment(int patientIdx) {
		System.out.println("AcceptanceService의 selectMedicalComment() 메소드");
		SqlSession mapper = MySession.getSession();
		int medicomcount =  AcceptanceDAO.getinstance().selectMedicalComment(mapper, patientIdx);
		mapper.commit();
		mapper.close();
		return medicomcount;
	}
	
	
	
	public Patient_1VO dischargeselectByIdx(int patientIdx) {
		System.out.println("AcceptanceService의 dischargeselectByIdx()");
		SqlSession mapper = MySession.getSession();
		
		Patient_1VO patientvo = AcceptanceDAO.getinstance().dischargeselectByIdx(mapper, patientIdx);
		
		mapper.commit();
		mapper.close();
		return patientvo;
	}
	
	// 퇴원수납 완료버튼 클릭 시 퇴원 컬럼 n -> y 수정
		public void changedischarge(Patient_1VO patientvo) {
			System.out.println("AcceptanceService의 changedischarge()");
			SqlSession mapper = MySession.getSession();		
			AcceptanceDAO.getinstance().changedischarge(mapper, patientvo);
			
			mapper.commit();
			mapper.close();
		}
		
	public void updatePatientDischarge(int patientIdx) {
		System.out.println("acceptService의 updatePatientDischarge() 메소드");
		SqlSession mapper = MySession.getSession();
		AcceptanceDAO.getinstance().updatePatientDischarge(mapper, patientIdx);
		mapper.commit();
		mapper.close();
		
	}
	
	
	
}
