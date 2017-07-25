package com.lbg.library.entity;

import java.sql.Date;

public class BookInfo {
	private int bookid;  //书的条形码
	private String bookname;  //书的名称
	private int typeid;     //书的所属类型  外键
	private String author;  //作者
	private String translator; //翻译者
	private String isbn;  //国际图书编号 <FK> 参考表  tb_publishing
	private double price; //书的价格
	private int page;  //书的页数
	private int shelfid; //所属书架
	private Date intime; //上架日期
	private String operator; //操作员    
	private int del;// 是否删除
	
	private String typename;  //书的类型名
	private String pubname;  //出版社名
	private String shelfname;
	public String getShelfname() {
		return shelfname;
	}

	public void setShelfname(String shelfname) {
		this.shelfname = shelfname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getPubname() {
		return pubname;
	}

	public void setPubname(String pubname) {
		this.pubname = pubname;
	}


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

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getShelfid() {
		return shelfid;
	}

	public void setShelfid(int shelfid) {
		this.shelfid = shelfid;
	}

	public Date getIntime() {
		return intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

}
