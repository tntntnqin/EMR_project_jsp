package com.hospital.service;

import org.apache.ibatis.session.SqlSession;

import com.hospital.dao.EmployeeDAO;
import com.hospital.mybatis.MySession;
import com.hospital.vo.Dpart_23List;
import com.hospital.vo.Employee_20List;
import com.hospital.vo.Employee_20VO;

public class EmployeeService {

public static EmployeeService instance = new EmployeeService();
	
	private EmployeeService() { }
	
	public static EmployeeService getInstance() {
		return instance;
	}
	

//	================================================================================
//	<로그인 페이지>
	
// loginOK.jsp에서 호출 사번과 비밀번호를 가지고 있는 vo를 얻어오기 위한 select
	public Employee_20VO selectByEmployeeIdx(int idx) {
		System.out.println("EmployeeService의 selectByEmployeeIdx()");
		SqlSession mapper = MySession.getSession();
		System.out.println("연결성공 : " + mapper);
		Employee_20VO vo =  EmployeeDAO.getInstance().selectByEmployeeIdx(mapper, idx);
		
		mapper.close();
		return vo;
	}	
	
//	===========================================================================

//	< 사내검색 >	
	
	public Employee_20List selectEmployeeListByName(String item) {
		System.out.println("EmployeeService의 selectEmployeeListByName() 메소드");
		SqlSession mapper = MySession.getSession();
		
		Employee_20List employeeList = new Employee_20List();
		employeeList.setEmployeeList(EmployeeDAO.getInstance().selectEmployeeListByName(mapper, item));
		
		mapper.close();
		return employeeList;
	} 
	
	
	public Dpart_23List selectdpartListByName(String item) {
		System.out.println("EmployeeService의 selectdpartListByName() 메소드");
		SqlSession mapper = MySession.getSession();
		
		Dpart_23List dpartList = new Dpart_23List();
		dpartList.setDpartList(EmployeeDAO.getInstance().selectdpartListByName(mapper, item));
		
		mapper.close();
		return dpartList;
	}
	
//	=========================================================================================	
	
	
	
	
}