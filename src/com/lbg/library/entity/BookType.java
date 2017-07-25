package com.lbg.library.entity;

/**
 * 图书类型实体类
 * 2017/07/24
 */
public class BookType {
    private int typeid;  //书的类型id
    private String typename;  //书的类型名
    private int days;   //可借天数

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }
}
