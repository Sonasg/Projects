package ehealthcare.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserRegistrationDetail;
import com.db.CrudOperation;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private PreparedStatement pslogin=null;
		private PreparedStatement psreg=null,ps=null;
		private Connection con=null;
		 private ResultSet rs=null;
		   private int flag=0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u_id=request.getParameter("ui");
        PrintWriter p=response.getWriter();
		String strsql="select * from logindetails where userid=?";
		con=CrudOperation.establishConnection();
		try
		{
			ps=con.prepareStatement(strsql);
		    ps.setString(1,u_id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				flag=1;
				p.println("userid already exists");
				
			}
			else
				flag=0;
			
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		long i=0;
		String nm=request.getParameter("nm");
		if(nm!=null && nm!="")
		{
			if(!nm.matches("[a-zA-Z]"))
			{
				p.print("Enter valid alphabetic name");
			}
			else if(nm.matches("[a-zA-Z]"))
			{
				flag=0;
			}
				try {
					flag=0;
					}
				catch(NumberFormatException nf)
					{
					flag=1;
					p.print("Non name not allowed in name!");
					}
			
			
		}
				
		String ph=request.getParameter("ph");
		if(ph!=null && ph!=""){
		if(ph.length()!=10)
			{
			flag=1;
			p.print("Incorrect phone number. Please check it.(10 digits)");}
		else if((ph.length()==10)&&(ph.charAt(0)!='8' && ph.charAt(0)!='9' &&  ph.charAt(0)!='7'))
		{
			p.print("Phone number should begin with 7,8 or 9");
		}
		else if((ph.length()==10)&&(ph.charAt(0)=='8'&&  ph.charAt(0)=='9'&&  ph.charAt(0)=='7'))
			flag=0;
		try {
			flag=0;
			//if(ph.trim()!="")
				 i=Long.parseLong(ph);
			//i=i+1-1;
		}
		catch(NumberFormatException nf){
			flag=1;
			p.print("Non numbers not allowed in phone number!");
		}
		}
		
		String mail=request.getParameter("mail");
		if(mail!=null && mail!=""){
		//System.out.println(mail.indexOf('@'));
		if(mail.indexOf('.')==-1 || mail.indexOf('@')==-1 || mail.indexOf('@')>mail.indexOf('.')) {
			flag=1;
			p.print("Incorrect mail id. (user@mail.com)");
		}
		else
			flag=0;
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		if(flag==1)
		{
		response.sendRedirect("/ehealthcare/jsp/user-register.jsp?msg=please try with another userid");
		}
		else if(flag==0)
		{
		String ui=request.getParameter("txtuserid");
		con=CrudOperation.establishConnection();
		String pass=request.getParameter("txtpass");
		String name=request.getParameter("txtname");
		String gender=request.getParameter("gender");
		String add=request.getParameter("txtaddress");
		String email=request.getParameter("txtemail");
		Long phno=Long.parseLong(request.getParameter("txtphone"));
		java.sql.Date dor=Date.valueOf(request.getParameter("txtreg"));
		java.sql.Date dob=Date.valueOf(request.getParameter("txtdob"));
		String ques=request.getParameter("security");
		String ans=request.getParameter("val");
		UserRegistrationDetail rd=new UserRegistrationDetail();
		rd.setUserid(ui);
		rd.setPass(pass);
		rd.setName(name);
		rd.setAddress(add);
		rd.setEmail(email);
		rd.setGender(gender);
		rd.setPhone(phno);
		rd.setDor(dor);
		rd.setDob(dob);
		rd.setQues(ques);
		rd.setAns(ans);
		String strlogininsert="insert into logindetails values(?,?,?,?)";
		String strreginsert="insert into userdetails values(?,?,?,?,?,?,?,?,?,?)";
		try
		{
			con.setAutoCommit(false);
			pslogin=con.prepareStatement(strlogininsert);
			pslogin.setString(1,ui);
			pslogin.setString(2,pass);
			pslogin.setString(3,"user");
			pslogin.setString(4,"true");
		int rw=pslogin.executeUpdate();
		psreg=con.prepareStatement(strreginsert);
		psreg.setString(1,rd.getUserid());
		psreg.setString(2,rd.getName());
		psreg.setString(3,rd.getAddress());
		psreg.setString(4,rd.getEmail());
		psreg.setString(5,rd.getGender());
		psreg.setLong(6,rd.getPhone());
		psreg.setDate(7,rd.getDor());
		psreg.setDate(8,rd.getDob());
		psreg.setString(9,rd.getQues());
		psreg.setString(10,rd.getAns());
	int rw1=psreg.executeUpdate();
	if(rw>0&&rw1>0)
	{
		con.commit();
		response.sendRedirect("/ehealthcare/jsp/message.jsp");
		
	}
	
	
	}
		catch(SQLException se)
		{
		System.out.println(se);
		}
		finally
		{
			try
			{
				if(pslogin!=null)
					pslogin.close();
				if(psreg!=null)
					psreg.close();
			}
			catch(SQLException se)
			{
				System.out.println(se);
			}
		}
	
	}}
	}


