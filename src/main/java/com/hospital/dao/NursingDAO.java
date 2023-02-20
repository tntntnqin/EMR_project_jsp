package com.hospital.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.HandoverN_9VO;
import com.hospital.vo.Injection_11VO;
import com.hospital.vo.NoticeToA_18VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NoticeToP_14VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.VitalSign_10VO;

public class NursingDAO {

	private static NursingDAO instance = new NursingDAO(); 
	
	private NursingDAO() {
	}
	public static NursingDAO getInstance() {
		return instance;
	}
	
	
	public ArrayList<NursingComment_13VO> selectNursingCommentList(SqlSession mapper, int patientIdx) {

		System.out.println("NursingDAO의 selectNursingCommentList() 메소드");
		// selectOne(): ibatis의 queryForObject() 메소드와 같은 기능이 실행된다.
		// selectList(): ibatis의 queryForList() 메소드와 같은 기능이 실행된다.
		return (ArrayList<NursingComment_13VO>) mapper.selectList("selectNursingCommentList", patientIdx);
	}
	public void deleteNursingComment(SqlSession mapper, int idx) {
		System.out.println("NursingDAO의 deleteNursingComment() 메소드");
		mapper.delete("deleteNursingComment", idx);
	}
	public Patient_1VO selectPatient(SqlSession mapper, int patientIdx) {
		
		System.out.println("nursingDAO의 selectPatient() 메소드");
		return (Patient_1VO) mapper.selectOne("selectPatient", patientIdx);
	}
	public ArrayList<PrescriptionMed_4VO> selectPrescriptionMedList(SqlSession mapper, int patientIdx) {
		System.out.println("NursingDAO의 selectPrescriptionMedList() 메소드");
		return (ArrayList<PrescriptionMed_4VO>) mapper.selectList("selectPrescriptionMedList", patientIdx);
	}
	public ArrayList<Injection_11VO> selectInjectionList(SqlSession mapper, int patientIdx) {
		System.out.println("NursingDAO의 selectInjectionList() 메소드");
		return (ArrayList<Injection_11VO>) mapper.selectList("selectInjectionList", patientIdx);
	}

// 약 추가	
	public void insertInjection(SqlSession mapper, PrescriptionMed_4VO preMedVO) {
		System.out.println("NursingDAO의 insertInjection() 메소드");
		mapper.insert("insertInjection", preMedVO);
		
	}	
	
	
	public void updateInjectionY(SqlSession mapper, int idx, String realTime) {
		System.out.println("NursingDAO의 updateInjectionY() 메소드");
		
		switch (realTime) {
			case "9A":
				mapper.update("updateInjection9Y", idx);
				break;
			case "1P":
				mapper.update("updateInjection13Y", idx);
				break;
				
			case "6P":
				mapper.update("updateInjection18Y", idx);
				break;
				
			case "9P":
				mapper.update("updateInjection21Y", idx);
				break;
		}
	}
	
	public void updateInjectionN(SqlSession mapper, int idx, String realTime) {
		System.out.println("NursingDAO의 updateInjectionY() 메소드");
		switch (realTime) {
			case "9A":
				mapper.update("updateInjection9N", idx);
				break;
			case "1P":
				mapper.update("updateInjection13N", idx);
				break;
				
			case "6P":
				mapper.update("updateInjection18N", idx);
				break;
				
			case "9P":
				mapper.update("updateInjection21N", idx);
				break;	
		}
	}
	
	public void updateNursingComment(SqlSession mapper, NursingComment_13VO vo) {
		System.out.println("NursingDAO의 updateNursingComment() 메소드");
		mapper.update("updateNursingComment", vo);
	}
	public ArrayList<VitalSign_10VO> selectVitalSignList(SqlSession mapper, int patientIdx) {
		System.out.println("NursingDAO의 selectVitalSignList() 메소드");
		return (ArrayList<VitalSign_10VO>) mapper.selectList("selectVitalSignList", patientIdx);
	}
	public void insertVital(SqlSession mapper, VitalSign_10VO vo) {
		System.out.println("NursingDAO의 insertVital() 메소드");
		mapper.insert("insertVital", vo);
	}
	public void deleteNursingVital(SqlSession mapper, int idx) {
		System.out.println("NursingDAO의 deleteNursingVital() 메소드");
		mapper.delete("deleteNursingVital", idx);
	}

	public void insertNursingComment(SqlSession mapper, NursingComment_13VO commentVO) {
		System.out.println("NursingDAO의 insertNursingComment() 메소드");
		mapper.insert("insertNursingComment", commentVO);
		
	}
	public void insertNoticeToP(SqlSession mapper, NoticeToP_14VO noticeToPVO) {
		System.out.println("NursingDAO의 insertNoticeToP() 메소드");
		mapper.insert("insertNoticeToP", noticeToPVO);
	}
	public void insertNoticeToA(SqlSession mapper, NoticeToA_18VO noticeToAVO) {
		System.out.println("NursingDAO의 insertNoticeToA() 메소드");
		mapper.insert("insertNoticeToA", noticeToAVO);
	}

	public void insertNoticeToDFromN(SqlSession mapper, NoticeToD_2VO noticeToDVO) {
		System.out.println("NursingDAO의 insertNoticeToDFromN() 메소드");
		mapper.insert("insertNoticeToDFromN", noticeToDVO);
		
	}
	
	
// 메인 페이지 (간호사)
	
	public ArrayList<NoticeToN_8VO> selectNoticeToNList(SqlSession mapper, String nurseT) {
		System.out.println("NursingDAO의 selectNoticeToNList() 메소드");
		return (ArrayList<NoticeToN_8VO>) mapper.selectList("selectNoticeToNList", nurseT);
	}
	public ArrayList<HandoverN_9VO> selectHandoverNList(SqlSession mapper, String nurseT) {
		System.out.println("NursingDAO의 selectHandoverNList() 메소드");
		return (ArrayList<HandoverN_9VO>) mapper.selectList("selectHandoverNList", nurseT);
	}
		
	//=====================================================

	// 간호 다오

	// 업무인계	
		public void insertHandoverN_new(SqlSession mapper, HandoverN_9VO handoverNVO) {
			System.out.println("nursingDAO의 insertHandoverN_new() 메소드");
			mapper.insert("insertHandoverN_new", handoverNVO);	
		}
		public void insertHandoverN_reply(SqlSession mapper, HandoverN_9VO handoverNVO) {
			System.out.println("nursingDAO의 insertHandoverN_reply() 메소드");
			mapper.insert("insertHandoverN_reply", handoverNVO);	
		}
			
		
			
		public HandoverN_9VO commentNselectByIdx(SqlSession mapper, int idx) {
			System.out.println("NursingDAO의 commentNselectByIdx() 메소드");
			return (HandoverN_9VO) mapper.selectOne("commentNselectByIdx", idx);
		}
		
		
		// 업무인계 삭제
		public void deleteNhandover(SqlSession mapper, int idx) {
			System.out.println("NursingDAO의 deleteNhandover() 메소드");
			mapper.delete("deleteNhandover", idx);
		}
		
		// 업무인계 수정
		public void updateNhandover(SqlSession mapper, HandoverN_9VO handovernvo) {
			System.out.println("NursingDAO의 updateNhandover() 메소드");
			mapper.delete("updateNhandover", handovernvo);
			
		}



		
	
	
}
