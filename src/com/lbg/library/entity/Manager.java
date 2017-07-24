package com.lbg.library.entity;

/**
 * 管理员实体类
 * 2017/7/13.
 */
public class Manager {

    private int mid;
    private String mname;
    private String rname;
    private String mpwd;

    public Manager() {
    }

    public Manager(int mid, String mname, String rname, String mpwd) {
        this.mid = mid;
        this.mname = mname;
        this.rname = rname;
        this.mpwd = mpwd;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getMpwd() {
        return mpwd;
    }

    public void setMpwd(String mpwd) {
        this.mpwd = mpwd;
    }


    @Override
    public String toString() {
        return "Manager{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", rname='" + rname + '\'' +
                ", mpwd='" + mpwd + '\'' +
                '}';
    }
}
