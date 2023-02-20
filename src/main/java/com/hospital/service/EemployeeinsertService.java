package com.hospital.service;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.EemployeeinsertDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.Employee_20VO;

public class EemployeeinsertService {

	private static EemployeeinsertService instance = new EemployeeinsertService();
	private EemployeeinsertService() {}
	public static EemployeeinsertService getinstance() {
		return instance;
	}
	
	// emploteeOK.jsp에서 넘어오는 회원가입 데이터를 저장
	public void employeeinsert(Employee_20VO employeevo) {
		System.out.println("EemployeeinsertService의 employeeinsert(회원가입)");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결성공");
		EemployeeinsertDAO.getinstance().employeeinsert(mapper, employeevo);
		
		mapper.commit();
		mapper.close();
	}
}
