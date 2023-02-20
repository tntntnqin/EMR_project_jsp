package com.hospital.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.hospital.vo.Dpart_23VO;
import com.hospital.vo.Employee_20VO;

public class EmployeeDAO {

	public static EmployeeDAO instance = new EmployeeDAO();
	
	private EmployeeDAO() { }
	
	public static EmployeeDAO getInstance() {
		return instance;
	}


//	==================================================================================
//	<로그인 페이지>
	
	public Employee_20VO selectByEmployeeIdx(SqlSession mapper, int idx) {
		System.out.println("EmployeeDAO의 selectByEmployeeIdx() 메소드 실행 " );
		return (Employee_20VO) mapper.selectOne("selectByEmployeeIdx", idx);
	}
	
	
	
//	====================================================================================	

//	<사내검색>	
	
	public ArrayList<Employee_20VO> selectEmployeeListByName(SqlSession mapper, String item) {
		System.out.println("EmployeeDAO의 selectEmployeeListByName() 메소드");
		return (ArrayList<Employee_20VO>) mapper.selectList("selectEmployeeListByName", item);
		
	}

	public ArrayList<Dpart_23VO> selectdpartListByName(SqlSession mapper, String item) {
		System.out.println("EmployeeDAO의 selectdpartListByName() 메소드");
		return (ArrayList<Dpart_23VO>) mapper.selectList("selectdpartListByName", item);
	}

	
		
	
	
}
