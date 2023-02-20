package com.hospital.service;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.PathologistDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.Employee_20VO;
import com.hospital.vo.NoticeToD_2VO;
import com.hospital.vo.NoticeToN_8VO;
import com.hospital.vo.NoticeToP_14List;
import com.hospital.vo.Patient_1VO;
import com.hospital.vo.TestBlood_17VO;
import com.hospital.vo.TestUrine_21VO;
import com.hospital.vo.WorkMemoP_15List;
import com.hospital.vo.WorkMemoP_15VO;

public class PathologistService {

	public static PathologistService instance = new PathologistService();

	private PathologistService() {
	}

	public static PathologistService getInstance() {
		return instance;
	}

// ===============================================================================	
	
	// 병리사 메인페이지 업무 알림 리스트
	public NoticeToP_14List selectNoticeToPList() {
		System.out.println("PathologistService의 selectNoticeToPList() 메소드");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결 성공: " + mapper);

		NoticeToP_14List noticePlist = new NoticeToP_14List();
		noticePlist.setNoticeToPList(PathologistDAO.getInstance().selectNoticeToPList(mapper));
		
		mapper.commit();
		mapper.close();
		return noticePlist;
	}
	
//	직원 번호로 직원 정보 뽑아오기
	public Employee_20VO selectByEmployeeIdx(int employeeIdx) {
		System.out.println("PathologistService의 selectByEmployeeIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		Employee_20VO employee_20vo = PathologistDAO.getInstance().selectByEmployeeIdx(mapper, employeeIdx);
		
		mapper.close();
		return employee_20vo;
		
	}

// ===============================================================================	
//	업무 메모 관련 메소드
	
	// 메인페이지 업무메모 리스트
	public WorkMemoP_15List selectmemoPList() {
		System.out.println("PathologistService의 selectmemoPList() 메소드");
		SqlSession mapper = MySession.getSession();

		WorkMemoP_15List workmemoPlist = new WorkMemoP_15List();
		workmemoPlist.setWorkmemoPList(PathologistDAO.getInstance().selectmemoPList(mapper));

		mapper.commit();
		mapper.close();
		return workmemoPlist;
	}
	

	
	// 메인페이지 업무메모 삽입
	public void workmemoPinsert(WorkMemoP_15VO workmemopvo) {
		System.out.println("PathologistService의 workmemoPinsert()");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결성공");
		
		PathologistDAO.getInstance().workmemoPinsert(mapper, workmemopvo);
		
		mapper.commit();
		mapper.close();
	}
	
	
	public WorkMemoP_15VO commentPselectByIdx(int idx) {
		System.out.println("PathologistService의 commentPselectByIdx()");
		SqlSession mapper = MySession.getSession();
		
		WorkMemoP_15VO workmemopvo = PathologistDAO.getInstance().commentPselectByIdx(mapper, idx);
		
		mapper.commit();
		mapper.close();
		return workmemopvo;
	}
	
	
	// 업무메모 삭제
	public void deletePmemo(int idx) {
		System.out.println("PathologistService의 deletePmemo()");
		SqlSession mapper = MySession.getSession();		
		PathologistDAO.getInstance().deletePmemo(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	
	// 업무메모 수정
	public void updatePmemo(WorkMemoP_15VO workmemopvo) {
		System.out.println("PathologistService의 updatePmemo()");
		SqlSession mapper = MySession.getSession();		
		PathologistDAO.getInstance().updatePmemo(mapper, workmemopvo);
		
		mapper.commit();
		mapper.close();
	}
// =====================================================
//	검사 수행
	
//	 혈액 검사 결과를 저장
	public void insertTestBlood(TestBlood_17VO testBlood_17VO) {
		System.out.println("PathologistService의 insertTestBlood() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PathologistDAO.getInstance().insertTestBlood(mapper, testBlood_17VO);		
		mapper.commit();
		mapper.close();
	}
	
//	소변 검사 결과를 저장
	public void insertTestUrine(TestUrine_21VO testUrine_21VO) {
		System.out.println("PathologistService의 insertTestUrine() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PathologistDAO.getInstance().insertTestUrine(mapper, testUrine_21VO);		
		mapper.commit();
		mapper.close();
	}
	
	//==================================================================
//	검사 결과 알림
	//	의사에게 결과 알림
	public void insertNoticeToD(NoticeToD_2VO noticeToD_2VO) {
		System.out.println("PathologistService의 insertNoticeToD() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PathologistDAO.getInstance().insertNoticeToD(mapper,noticeToD_2VO);
		mapper.commit();
		mapper.close();
		
	}
	//	간호사에게 결과 알림
	public void insertNoticeToN(NoticeToN_8VO noticeToN_8VO) {
		System.out.println("PathologistService의 insertNoticeToD() 메소드");
		SqlSession mapper = MySession.getSession();
		
		PathologistDAO.getInstance().insertNoticeToN(mapper,noticeToN_8VO);
		mapper.commit();
		mapper.close();
		
	}
}
