package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Message;

public class CrudOperation {
private static Connection cn=null;
private ArrayList<Message> msglist=new ArrayList<Message>();
private PreparedStatement ps=null;
private ResultSet rs=null;
private Message r;

	public static Connection establishConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ehc","root","root");
			
		}
		catch(ClassNotFoundException|SQLException cse)
		{
			System.out.println(cse);
		}
	return cn;	
	}

	public ArrayList<Message> showMessage(String sql,String seid)
	{
		msglist=new ArrayList<Message>();
		cn=establishConnection();
		try
		{
			ps=cn.prepareStatement(sql);
			ps.setString(1,seid);
			ps.setString(2,"false");
			rs=ps.executeQuery();
			while(rs.next())
			{
				r=new Message();
				r.setMsgid(rs.getInt("messageid"));
				r.setSenid(rs.getString("senderid"));
				r.setRecid(rs.getString("receiverid"));
				r.setSub(rs.getString("subject"));
				r.setMsg(rs.getString("messagetext"));
				r.setDate(rs.getDate("date"));
				r.setRstatus(rs.getString("rstatus"));
				r.setSstatus(rs.getString("sstatus"));
				
			msglist.add(r);	
			}
		}
		catch(SQLException se)
		{
			
			System.out.println(se);
		}
		return msglist;
}
	public ArrayList<Message> showsentMessage(String sql,String seid)
	{
		msglist=new ArrayList<Message>();
		cn=establishConnection();
		try
		{
			ps=cn.prepareStatement(sql);
			ps.setString(1,seid);
			ps.setString(2,"false");
			rs=ps.executeQuery();
			while(rs.next())
			{
				r=new Message();
				r.setMsgid(rs.getInt("messageid"));
				r.setSenid(rs.getString("senderid"));
				r.setRecid(rs.getString("receiverid"));
				r.setSub(rs.getString("subject"));
				r.setMsg(rs.getString("messagetext"));
				r.setDate(rs.getDate("date"));
				r.setRstatus(rs.getString("rstatus"));
				r.setSstatus(rs.getString("sstatus"));
				
			msglist.add(r);	
			}
		}
		catch(SQLException se)
		{
			
			System.out.println(se);
		}
		return msglist;
}
}
