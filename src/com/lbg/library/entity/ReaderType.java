package com.lbg.library.entity;


/**
 * @author zmw
 *
 */

public class ReaderType {
	
	private byte rtypeid;
	private String rtypename;
	private byte count;
	
	public byte getRtypeid() {
		return rtypeid;
	}
	public void setRtypeid(byte rtypeid) {
		this.rtypeid = rtypeid;
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
