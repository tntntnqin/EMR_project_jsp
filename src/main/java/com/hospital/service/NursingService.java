package com.hospital.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.HandoverN_9List;
import com.hospital.vo.HandoverN_9VO;
import com.hospital.vo.Injection_11List;
import com.hospital.vo.NoticeToA_18VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.NoticeToN_8List;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NoticeToP_14VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.NursingComment_13_List;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionMed_4List;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.VitalSign_10List;
import com.hospital.vo.VitalSign_10VO;
import com.hospital.dao.NursingDAO;
import com.hospital.mybatis.MySession;

public class NursingService {

	private static NursingService instance = new NursingService();
	
	private NursingService() {
	}
	
	public static NursingService getInstance() {
		return instance;
	}

	
	
// 간호수행 페이지	
	public NursingComment_13_List selectNursingCommentList(int patientIdx) {
		System.out.println("NursingService의 selectNursingCommentList() 메소드");
		SqlSession mapper = MySession.getSession();
		 System.out.println("연결 성공: " + mapper);
		
		NursingComment_13_List nursingCommentList = new NursingComment_13_List();
		nursingCommentList.setNursingCommentList(NursingDAO.getInstance().selectNursingCommentList(mapper, patientIdx));
		
		mapper.close();
		return nursingCommentList;
	}
	
	public void deleteNursingComment(int idx) {
		System.out.println("NursingService의 deleteNursingComment() 메소드");
		SqlSession mapper = MySession.getSession();
		NursingDAO.getInstance().deleteNursingComment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	

	public Patient_1VO selectPatient(int patientIdx) {
		System.out.println("NursingService의 selectPatient() 메소드");
		SqlSession mapper = MySession.getSession();
		Patient_1VO patientVO = NursingDAO.getInstance().selectPatient(mapper, patientIdx);
		mapper.close();
		return patientVO;
	}

	public PrescriptionMed_4List selectPrescriptionMedList(int patientIdx) {
		System.out.println("NursingService의 selectPrescriptionMedList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PrescriptionMed_4List prescriptionMedList = new PrescriptionMed_4List();
		prescriptionMedList.setPrescriptionMedList(NursingDAO.getInstance().selectPrescriptionMedList(mapper, patientIdx));
		
		mapper.close();
		return prescriptionMedList;
	}
	
	public Injection_11List selectInjectionList(int patientIdx) {
		System.out.println("NursingService의 selectInjectionList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		Injection_11List injectionList = new Injection_11List();
		injectionList.setInjectionList(NursingDAO.getInstance().selectInjectionList(mapper, patientIdx));
		
		mapper.close();
		return injectionList;
	}

// 약 추가	
	public void insertInjection(PrescriptionMed_4VO preMedVO) {
		System.out.println("NursingService의 insertInjection() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertInjection(mapper, preMedVO);
		
		mapper.commit(); 
		mapper.close(); 
	}	
	
	public void updateInjectionY(int idx, String realTime) {
		System.out.println("NursingService의 updateInjectionY() 메소드");
		SqlSession mapper = MySession.getSession();
		NursingDAO.getInstance().updateInjectionY(mapper, idx, realTime);
		mapper.commit();
		mapper.close();
	}
	
	public void updateInjectionN(int idx, String realTime) {
		System.out.println("NursingService의 updateInjectionN() 메소드");
		SqlSession mapper = MySession.getSession();
		NursingDAO.getInstance().updateInjectionN(mapper, idx, realTime);
		mapper.commit();
		mapper.close();
	}
	
	public void updateNursingComment(NursingComment_13VO vo) {
		System.out.println("NursingService의 updateNursingComment() 메소드");
		SqlSession mapper = MySession.getSession();
		NursingDAO.getInstance().updateNursingComment(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public VitalSign_10List selectVitalSignList(int patientIdx) {
		System.out.println("NursingService의 selectVitalSignList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		VitalSign_10List vitalSignList = new VitalSign_10List();
		vitalSignList.setVitalSignList(NursingDAO.getInstance().selectVitalSignList(mapper, patientIdx));
		mapper.close();
		return vitalSignList;
	}
	
	public void insertVital(VitalSign_10VO vo) {
		System.out.println("NursingService의 insertViatl() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertVital(mapper, vo);
		
		mapper.commit(); 
		mapper.close(); 
	}
	
	public void deleteNursingVital(int idx) {
		System.out.println("NursingService의 deleteNursingVital() 메소드");
		SqlSession mapper = MySession.getSession();
		NursingDAO.getInstance().deleteNursingVital(mapper, idx);
		mapper.commit();
		mapper.close();
	
	}
	public void insertNursingComment(NursingComment_13VO commentVO) {
		System.out.println("NursingService의 insertComment() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertNursingComment(mapper, commentVO);
		
		mapper.commit(); 
		mapper.close(); 
	}

	public void insertNoticeToP(NoticeToP_14VO noticeToPVO) {
		System.out.println("NursingService의 insertNoticeToP() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertNoticeToP(mapper, noticeToPVO);
		
		mapper.commit(); 
		mapper.close(); 
	}

	public void insertNoticeToA(NoticeToA_18VO noticeToAVO) {
		System.out.println("NursingService의 insertNoticeToA() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertNoticeToA(mapper, noticeToAVO);
		
		mapper.commit(); 
		mapper.close(); 
		
	}
	public void insertNoticeToDFromN(NoticeToD_2VO noticeToDVO) {
		System.out.println("NursingService의 insertNoticeToD() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertNoticeToDFromN(mapper, noticeToDVO);
		
		mapper.commit(); 
		mapper.close(); 
		
	}

// 메인 페이지 (간호사) 
	
	public NoticeToN_8List selectNoticeToNList(String nurseT) {
		System.out.println("NursingService의 selectNoticeToNList() 메소드");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결 성공: " + mapper);
		
		NoticeToN_8List noticeToNList   = new NoticeToN_8List();
		noticeToNList.setNoticeToNList(NursingDAO.getInstance().selectNoticeToNList(mapper, nurseT));
		
		mapper.close();
		return noticeToNList;
	}

	public HandoverN_9List selectHandoverNList(String nurseT) {
		System.out.println("NursingService의 selectHandoverNList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		HandoverN_9List handoverNList   = new HandoverN_9List();
		handoverNList.setHandoverNList(NursingDAO.getInstance().selectHandoverNList(mapper, nurseT));
		
		mapper.close();
		return handoverNList;		
	}
	
//	업무인계
	
	public void insertHandoverN_new(HandoverN_9VO handoverNVO) {
		System.out.println("nuresingService의 insertHandoverD_new() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertHandoverN_new(mapper, handoverNVO);
		
		mapper.commit(); 
		mapper.close(); 
	}
	public void insertHandoverN_reply(HandoverN_9VO handoverNVO) {
		System.out.println("nursingService의 insertHandoverD_reply() 메소드");
		SqlSession mapper = MySession.getSession();
		
		NursingDAO.getInstance().insertHandoverN_reply(mapper, handoverNVO);
		
		mapper.commit(); 
		mapper.close(); 
	}
	
	
	public HandoverN_9VO commentNselectByIdx(int idx) {
		System.out.println("NursingService의 commentNselectByIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		
		HandoverN_9VO handovernvo =  NursingDAO.getInstance().commentNselectByIdx(mapper, idx);
		
		mapper.commit();
		mapper.close();
		return handovernvo;
	}
	
	
	// 간호사 업무인계 삭제
	public void deleteNhandover(int idx) {
		System.out.println("NursingService의 deleteNhandover()");
		SqlSession mapper = MySession.getSession();		
		NursingDAO.getInstance().deleteNhandover(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	
	// 간호사 업무인계 수정
	public void updateNhandover(HandoverN_9VO handovernvo) {
		System.out.println("NursingService의 updateNhandover()");
		SqlSession mapper = MySession.getSession();		
		NursingDAO.getInstance().updateNhandover(mapper, handovernvo);
		
		mapper.commit();
		mapper.close();
	}

	
}

