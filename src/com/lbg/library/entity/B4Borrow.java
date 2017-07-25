package com.lbg.library.entity;

import java.sql.Date;

/**
 * 查询借阅图书实体类
 * 2017/7/25.
 */
public class B4Borrow {

    private int bookid;
    private String bookname;
    private Date borrowtm;
    private Date limitbacktm;
    private String isbn;
    private int shelfid;
    private double price;

    public B4Borrow() {
    }

    public B4Borrow(int bookid, String bookname, Date borrowtm, Date limitbacktm, String isbn, int shelfid, double price) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.borrowtm = borrowtm;
        this.limitbacktm = limitbacktm;
        this.isbn = isbn;
        this.shelfid = shelfid;
        this.price = price;
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

    public Date getBorrowtm() {
        return borrowtm;
    }

    public void setBorrowtm(Date borrowtm) {
        this.borrowtm = borrowtm;
    }

    public Date getLimitbacktm() {
        return limitbacktm;
    }

    public void setLimitbacktm(Date limitbacktm) {
        this.limitbacktm = limitbacktm;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getShelfid() {
        return shelfid;
    }

    public void setShelfid(int shelfid) {
        this.shelfid = shelfid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "B4Borrow{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", borrowtm=" + borrowtm +
                ", limitbacktm=" + limitbacktm +
                ", isbn='" + isbn + '\'' +
                ", shelfid=" + shelfid +
                ", price=" + price +
                '}';
    }
}
