package com.hospital.dao;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.Employee_20VO;

public class EemployeeinsertDAO {

	private static EemployeeinsertDAO instance = new EemployeeinsertDAO();
	private EemployeeinsertDAO() { }
	public static EemployeeinsertDAO getinstance() {
		return instance;
	}
	
	
	// EemployeeinsertService 클래스에서 호출되는 회원가입
	public void employeeinsert(SqlSession mapper, Employee_20VO employeevo) {
		System.out.println("EemployeeinsertDAO의 employeeinsert(회원가입)");
		mapper.insert("employeeinsert", employeevo);
	}
	
	
	
	
	
}

