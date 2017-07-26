package com.lbg.library.entity;

import java.sql.Date;

/**
 * BQuery实体类
 * 2017/7/26.
 */
public class BQuery {

    private int bookid;
    private String bookname;
    private int rid;
    private String rname;
    private Date borrowtime;
    private Date limitbacktime;
    private byte ifback;

    public BQuery() {
    }

    public BQuery(int bookid, String bookname, int rid, String rname, Date borrowtime, Date limitbacktime, byte ifback) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.rid = rid;
        this.rname = rname;
        this.borrowtime = borrowtime;
        this.limitbacktime = limitbacktime;
        this.ifback = ifback;
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

    public byte getIfback() {
        return ifback;
    }

    public void setIfback(byte ifback) {
        this.ifback = ifback;
    }

    @Override
    public String toString() {
        return "BQuery{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", rid=" + rid +
                ", rname='" + rname + '\'' +
                ", borrowtime=" + borrowtime +
                ", limitbacktime=" + limitbacktime +
                ", ifback=" + ifback +
                '}';
    }
}
