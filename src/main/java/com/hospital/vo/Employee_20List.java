package com.hospital.vo;

import java.util.ArrayList;

public class Employee_20List {

	private ArrayList<Employee_20VO> employeeList = new ArrayList<>();

	public ArrayList<Employee_20VO> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(ArrayList<Employee_20VO> employeeList) {
		this.employeeList = employeeList;
	}

	@Override
	public String toString() {
		return "Employee_20List [employeeList=" + employeeList + "]";
	}

	
}
