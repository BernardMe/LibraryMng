package com.lbg.library.entity;

/**
 * 读者借阅检查实体类
 * 2017/7/25.
 */
public class R4Borrow {

    private int rid;
    private String rname;
    private byte gender;
    private String papertype;
    private String paperno;
    private String rtypename;
    private byte count;

    public R4Borrow() {
    }

    public R4Borrow(int rid, String rname, byte gender, String papertype, String paperno, String rtypename, byte count) {
        this.rid = rid;
        this.rname = rname;
        this.gender = gender;
        this.papertype = papertype;
        this.paperno = paperno;
        this.rtypename = rtypename;
        this.count = count;
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

    public byte getGender() {
        return gender;
    }

    public void setGender(byte gender) {
        this.gender = gender;
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

    @Override
    public String toString() {
        return "R4Borrow{" +
                "rid=" + rid +
                ", rname='" + rname + '\'' +
                ", gender=" + gender +
                ", papertype='" + papertype + '\'' +
                ", paperno='" + paperno + '\'' +
                ", rtypename='" + rtypename + '\'' +
                ", count=" + count +
                '}';
    }
}
