package com.hospital.vo;

public class Employee_20VO {
	
	private int employeeIdx;
	private String password;
	private String name;
	private String gender;
	private int age;
	private String dpart;
	private String doctorT;
	private String nurseT;
	private String dnumber;
	private String enumber;
	
public Employee_20VO() {
	// TODO Auto-generated constructor stub
}

public Employee_20VO(int employeeIdx, String password, String name, String gender, int age, String dpart,
		String doctorT, String nurseT, String dnumber, String enumber) {
	super();
	this.employeeIdx = employeeIdx;
	this.password = password;
	this.name = name;
	this.gender = gender;
	this.age = age;
	this.dpart = dpart;
	this.doctorT = doctorT;
	this.nurseT = nurseT;
	this.dnumber = dnumber;
	this.enumber = enumber;
}

public int getEmployeeIdx() {
	return employeeIdx;
}

public void setEmployeeIdx(int employeeIdx) {
	this.employeeIdx = employeeIdx;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public int getAge() {
	return age;
}

public void setAge(int age) {
	this.age = age;
}

public String getDpart() {
	return dpart;
}

public void setDpart(String dpart) {
	this.dpart = dpart;
}

public String getDoctorT() {
	return doctorT;
}

public void setDoctorT(String doctorT) {
	this.doctorT = doctorT;
}

public String getNurseT() {
	return nurseT;
}

public void setNurseT(String nurseT) {
	this.nurseT = nurseT;
}

public String getDnumber() {
	return dnumber;
}

public void setDnumber(String dnumber) {
	this.dnumber = dnumber;
}

public String getEnumber() {
	return enumber;
}

public void setEnumber(String enumber) {
	this.enumber = enumber;
}

@Override
public String toString() {
	return "Employee_20VO [employeeIdx=" + employeeIdx + ", password=" + password + ", name=" + name + ", gender="
			+ gender + ", age=" + age + ", dpart=" + dpart + ", doctorT=" + doctorT + ", nurseT=" + nurseT
			+ ", dnumber=" + dnumber + ", enumber=" + enumber + "]";
}



	
}
