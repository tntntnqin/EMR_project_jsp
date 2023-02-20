package com.hospital.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.DoctorDAO;
import com.hospital.dao.MenuDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.Injection_11List;
import com.hospital.vo.MedicalComment_7List;
import com.hospital.vo.NursingComment_13_List;
import com.hospital.vo.PrescriptionMed_4List;
import com.hospital.vo.PrescriptionTest_5List;
import com.hospital.vo.VitalSign_10List;

// 환자 상세페이지 메뉴바 Service클래스

public class MenuService {

	private static MenuService instance = new MenuService();
		
	private MenuService() {
	}
	
	public static MenuService getInstance() {
		return instance;
	}
	
// < 간호기록조회 >
	
	public VitalSign_10List selectVitalSignList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectVitalSignList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		VitalSign_10List vitalSignList = new VitalSign_10List();
		vitalSignList.setVitalSignList(MenuDAO.getInstance().selectVitalSignList_Menu(mapper, hmap));
		mapper.close();
		return vitalSignList;
	}
	
	public Injection_11List selectInjectionList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectInjectionList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		Injection_11List injectionList = new Injection_11List();
		injectionList.setInjectionList(MenuDAO.getInstance().selectInjectionList_Menu(mapper, hmap));
		
		mapper.close();
		return injectionList;
	}
	
	public NursingComment_13_List selectNursingCommentList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectNursingCommentList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		
		NursingComment_13_List nursingCommentList = new NursingComment_13_List();
		nursingCommentList.setNursingCommentList(MenuDAO.getInstance().selectNursingCommentList_Menu(mapper, hmap));
		
		mapper.close();
		return nursingCommentList;
	}

// < 의무기록조회 >

	public PrescriptionMed_4List selectPrescriptionMedList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectPrescriptionMedList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		PrescriptionMed_4List prescriptionMedList = new PrescriptionMed_4List();
		prescriptionMedList.setPrescriptionMedList(MenuDAO.getInstance().selectPrescriptionMedList_Menu(mapper, hmap));
		
		mapper.close();
		return prescriptionMedList;
	}
	
	public PrescriptionTest_5List selectPrescriptionTestList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectPrescriptionTestList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		PrescriptionTest_5List prescriptionTestList = new PrescriptionTest_5List();
		prescriptionTestList.setPrescriptionTestList(MenuDAO.getInstance().selectPrescriptionTestList_Menu(mapper, hmap));
		
		mapper.close();
		return prescriptionTestList;
	}
	
	public MedicalComment_7List selectMediCommentList_Menu(int patientIdx, int subDay) {
		System.out.println("MenuService의 selectMediCommentList_Menu() 메소드");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("patientIdx", patientIdx);
		hmap.put("subDay", subDay);
		MedicalComment_7List medicalCommentList = new MedicalComment_7List();
		medicalCommentList.setMedicalCommentList(MenuDAO.getInstance().selectMediCommentList_Menu(mapper, hmap));
		
		mapper.close();
		return medicalCommentList;
	}
	
	
	
}
