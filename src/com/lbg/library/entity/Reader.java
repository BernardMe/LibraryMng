package com.lbg.library.entity;

import java.sql.Date;

/**
 * 读者实体类
 * 2017/07/24
 * @author zmw
 *
 */

public class Reader {
	
	//读者条形码
	private int rid;
	private String rname;
	private byte gender;
	private String vocation;
	private Date birthday;
	private String papertype;
	private String paperno;
	private String tel;
	private String email;
	private Date createdate;
	private String remark;
	private byte rtypeid;
	private String operator;
	//读者类型
	private String rtypename;
	private byte count;
	
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
	public byte getGender() {
		return gender;
	}
	public void setGender(byte gender) {
		this.gender = gender;
	}
	public String getVocation() {
		return vocation;
	}
	public void setVocation(String vocation) {
		this.vocation = vocation;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPapertype() {
		return papertype;
	}
	public void setPapertype(String papertype) {
		this.papertype = papertype;
	}
	public String getPaperno() {
		return paperno;
	}
	public void setPaperno(String paperno) {
		this.paperno = paperno;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public byte getRtypeid() {
		return rtypeid;
	}
	public void setRtypeid(byte rtypeid) {
		this.rtypeid = rtypeid;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getRtypename() {
		return rtypename;
	}
	public void setRtypename(String rtypename) {
		this.rtypename = rtypename;
	}
	public byte getCount() {
		return count;
	}
	public void setCount(byte count) {
		this.count = count;
	}
		
}
