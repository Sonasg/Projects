package ehealthcare.ser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.CrudOperation;

/**

 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private ResultSet rs=null,rs1=null;
	private PreparedStatement ps=null,ps1=null;
       HttpSession hs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ui=request.getParameter("txtuserid");
		String upass=request.getParameter("txtpass");
		con=CrudOperation.establishConnection();
		//String strsql="Select * from logindetails where userid=? and userpass=? and status=?";
		String strsql1="select * from logindetails where userid=? and userpass=?";
		try
		{
		ps1=con.prepareStatement(strsql1);
		ps1.setString(1,ui);
		ps1.setString(2,upass);
		hs=request.getSession();
		hs.setAttribute("userdetail",ui);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
		if(rs1.getString("status").equals("true"))
		{
			String utype=rs1.getString("usertype");
			if(utype.equals("nutritionist"))
			{
				response.sendRedirect("/ehealthcare/jsp/profile.jsp");
			}
			else if(utype.equals("dietitian"))
			{
				response.sendRedirect("/ehealthcare/jsp/profile.jsp");
			}
			else if(utype.equals("yoga expert"))
			{
				response.sendRedirect("/ehealthcare/jsp/profile.jsp");
			}
			else if(utype.equals("user"))
				response.sendRedirect("/ehealthcare/jsp/userprofile.jsp");
			else if(utype.equals("admin"))
				response.sendRedirect("/ehealthcare/jsp/admin.jsp");
		}
		else if(rs1.getString("status").equals("false"))
		{
		PrintWriter out=response.getWriter();
		out.println("status is false");
		}
		}
		else
		{ 
		response.sendRedirect("/ehealthcare/jsp/login.jsp?msg=invalid userid or password");
		}
		}//try close
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally
		{
			try
			{
				if(ps!=null)
				{
					ps.close();
					
				}
				if(rs!=null)
				{
					rs.close();
				}
				
		}catch(SQLException se)
			{
			System.out.println(se);
			}
		}
		
			}
}


