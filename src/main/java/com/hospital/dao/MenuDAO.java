package com.hospital.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.Injection_11VO;
import com.hospital.vo.MedicalComment_7VO;
import com.hospital.vo.NursingComment_13VO;
import com.hospital.vo.PrescriptionMed_4VO;
import com.hospital.vo.PrescriptionTest_5VO;
import com.hospital.vo.VitalSign_10VO;

//환자 상세페이지 메뉴바 DAO클래스

public class MenuDAO {

	
	private static MenuDAO instance = new MenuDAO();
	
	private MenuDAO() {
	}
	
	public static MenuDAO getInstance() {
		return instance;
	}

	
	// < 간호기록조회 >	
	

		public ArrayList<VitalSign_10VO> selectVitalSignList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {
			System.out.println("MenuDAO의 selectVitalSignList_Menu() 메소드");
			return (ArrayList<VitalSign_10VO>) mapper.selectList("selectVitalSignList_Menu", hmap);
			
		}
		
		public ArrayList<Injection_11VO> selectInjectionList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {
			System.out.println("MenuDAO의 selectInjectionList_Menu() 메소드");
			return (ArrayList<Injection_11VO>) mapper.selectList("selectInjectionList_Menu", hmap);
		}
		
		public ArrayList<NursingComment_13VO> selectNursingCommentList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("MenuDAO의 selectNursingCommentList_Menu() 메소드");
		return (ArrayList<NursingComment_13VO>) mapper.selectList("selectNursingCommentList_Menu", hmap);
		}
		
		
	// < 의무기록 조회 >	


		public ArrayList<PrescriptionMed_4VO> selectPrescriptionMedList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {
			System.out.println("MenuDAO의 selectPrescriptionMedList_Menu(약 처방내역) 메소드");
			return (ArrayList<PrescriptionMed_4VO>) mapper.selectList("selectPrescriptionMedList_Menu", hmap);
		}	
		
		public ArrayList<PrescriptionTest_5VO> selectPrescriptionTestList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {
			System.out.println("MenuDAO의 selectPrescriptionTestList_Menu(검사 처방내역) 메소드");
			return (ArrayList<PrescriptionTest_5VO>) mapper.selectList("selectPrescriptionTestList_Menu", hmap);
		
		}
		
		public ArrayList<MedicalComment_7VO> selectMediCommentList_Menu(SqlSession mapper, HashMap<String, Integer> hmap) {

			System.out.println("MenuDAO의 selectMediCommentList_Menu() 메소드");
			return (ArrayList<MedicalComment_7VO>) mapper.selectList("selectMediCommentList_Menu", hmap);
		}	
	
	
	
	
	
	
	
	
	
	

}
