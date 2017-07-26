package com.lbg.library.entity;

import java.sql.Date;

/**
 * 已借阅图书实体类
 * 2017/7/26.
 */
public class Borrowed {

    private int swid;
    private int bookid;
    private String bookname;
    private String isbn;
    private Date borrowtime;
    private Date limitbacktime;
    private byte ifback;

    public Borrowed() {
    }

    public Borrowed(int swid, int bookid, String bookname, String isbn, Date borrowtime, Date limitbacktime, byte ifback) {
        this.swid = swid;
        this.bookid = bookid;
        this.bookname = bookname;
        this.isbn = isbn;
        this.borrowtime = borrowtime;
        this.limitbacktime = limitbacktime;
        this.ifback = ifback;
    }

    public int getSwid() {
        return swid;
    }

    public void setSwid(int swid) {
        this.swid = swid;
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

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
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
        return "Borrowed{" +
                "swid=" + swid +
                ", bookid=" + bookid +
                ", bookname=" + bookname +
                ", isbn='" + isbn + '\'' +
                ", borrowtime=" + borrowtime +
                ", limitbacktime=" + limitbacktime +
                ", ifback=" + ifback +
                '}';
    }
}
