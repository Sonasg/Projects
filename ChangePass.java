package ehealthcare.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.CrudOperation;

/**
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection com=null;
    private PreparedStatement ps1=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
   int rs1=0;
    int flag=0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String up=request.getParameter("pass");
		PrintWriter out=response.getWriter();
		//System.out.print("pp");
		HttpSession hs=request.getSession(false);
		String info=(String)hs.getAttribute("detail");
		String [] info1=info.split(",");
		String uid=info1[0];
		String utype=info1[1];
		//System.out.print(uid);
		//System.out.print(up);
		String strsql="select * from logindetails where userid=? and userpass=?";
		com=CrudOperation.establishConnection();
		try
		{
			ps=com.prepareStatement(strsql);
			ps.setString(1,uid);
			ps.setString(2, up);
			rs=ps.executeQuery();
			//System.out.println(up);
			if(rs.next())
			{
				flag=0;
			}
			else
			{
				flag=1;
				out.print("wrong password entered");
		}
		}
		catch(SQLException se)
		{
			out.print(se);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession hs=request.getSession(false);
		String info=(String)hs.getAttribute("detail");
		String [] info1=info.split(",");
		String uid=info1[0];
		String utype=info1[1];
		if(flag==1)
		{
			response.sendRedirect("/ehealthcare/jsp/"+utype+".jsp?report=please try again!");
			//out.print("please try again");
		}
		else
		{
		String up=request.getParameter("txtpass");
		String up1=request.getParameter("txtpass1");
		
        String strsql="update logindetails set userpass=? where userid=?";
		com=CrudOperation.establishConnection();
		try
		{
			ps1=com.prepareStatement(strsql);
			com.setAutoCommit(false);
			ps1.setString(1,up1);
			ps1.setString(2, uid);
			rs1=ps1.executeUpdate();
			if(rs1>0)
			{
				com.commit();
				response.sendRedirect("/ehealthcare/jsp/"+utype+".jsp?report=Password changed successfully!");
			}
		}
		catch(SQLException se)
		{
			out.print(se);
		}
	}
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
}
