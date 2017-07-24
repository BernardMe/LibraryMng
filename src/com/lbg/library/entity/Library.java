package com.lbg.library.entity;

import java.sql.Date;
/**
 *馆长实体类
 */

public class Library {
	private int libraryid;
	private String libraryname;
	//馆长姓名
	private String curator;
	private String tel;
	private String address;
	private String email;
	private String url;
	private Date createdate;
	private String introduce;
	public int getLibraryid() {
		return libraryid;
	}
	public void setLibraryid(int libraryid) {
		this.libraryid = libraryid;
	}
	public String getLibraryname() {
		return libraryname;
	}
	public void setLibraryname(String libraryname) {
		this.libraryname = libraryname;
	}
	public String getCurator() {
		return curator;
	}
	public void setCurator(String curator) {
		this.curator = curator;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
}
