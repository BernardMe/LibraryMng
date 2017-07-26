package com.lbg.library.entity;

import java.sql.Date;

/**
 * 借阅到期提醒 实体类
 * 
 * @author zmw
 *
 */

public class Alert4Return {
	
    private int bookid;
    private String bookname;
	private int rid;
	private String rname;
    private Date borrowtime;
    private Date limitbacktime;
    
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Date getBorrowtime() {
		return borrowtime;
	}
	public void setBorrowtime(Date borrowtime) {
		this.borrowtime = borrowtime;
	}
	public Date getLimitbacktime() {
		return limitbacktime;
	}
	public void setLimitbacktime(Date limitbacktime) {
		this.limitbacktime = limitbacktime;
	}

 
}
