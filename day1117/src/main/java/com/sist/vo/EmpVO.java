package com.sist.vo;

import java.util.Date;

public class EmpVO {
 private int eno;
 private String ename;
 private Date hirdate;
 private int total;
 private String jumin;
 private String id;
public EmpVO(int eno, String ename, Date hirdate, int total, String jumin, String id) {
	super();
	this.eno = eno;
	this.ename = ename;
	this.hirdate = hirdate;
	this.total = total;
	this.jumin = jumin;
	this.id = id;
}
public EmpVO() {
	super();
	// TODO Auto-generated constructor stub
}
public int getEno() {
	return eno;
}
public void setEno(int eno) {
	this.eno = eno;
}
public String getEname() {
	return ename;
}
public void setEname(String ename) {
	this.ename = ename;
}
public Date getHirdate() {
	return hirdate;
}
public void setHirdate(Date hirdate) {
	this.hirdate = hirdate;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public String getJumin() {
	return jumin;
}
public void setJumin(String jumin) {
	this.jumin = jumin;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
 
 
}
