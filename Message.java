package com.beans;

import java.sql.Date;

public class Message {
	private int msgid;
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getSenid() {
		return senid;
	}
	public void setSenid(String senid) {
		this.senid = senid;
	}
	public String getRecid() {
		return recid;
	}
	public void setRecid(String recid) {
		this.recid = recid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	private String senid;
	private String recid;
	private String msg;
	private String sub;
	private Date date;
private String rstatus;
private String sstatus;
public String getRstatus() {
	return rstatus;
}
public void setRstatus(String rstatus) {
	this.rstatus = rstatus;
}
public String getSstatus() {
	return sstatus;
}
public void setSstatus(String sstatus) {
	this.sstatus = sstatus;
}
}

