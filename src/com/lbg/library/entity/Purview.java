package com.lbg.library.entity;

public class Purview {
	private String mname;
	 private int mid;
	 private int sysset=0;
	//readerset|读者权限
	private int readerset=0;
	//bookset|图书权限
	private int bookset=0;
	//borrowback|借阅权限
	private int borrowback=0;
	//sysquery|系统查询权限
	private int sysquery=0;
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getSysset() {
		return sysset;
	}
	public void setSysset(int sysset) {
		this.sysset = sysset;
	}
	public int getReaderset() {
		return readerset;
	}
	public void setReaderset(int readerset) {
		this.readerset = readerset;
	}
	public int getBookset() {
		return bookset;
	}
	public void setBookset(int bookset) {
		this.bookset = bookset;
	}
	public int getBorrowback() {
		return borrowback;
	}
	public void setBorrowback(int borrowback) {
		this.borrowback = borrowback;
	}
	public int getSysquery() {
		return sysquery;
	}
	public void setSysquery(int sysquery) {
		this.sysquery = sysquery;
	}
	
}
