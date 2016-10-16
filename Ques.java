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

import com.db.CrudOperation;

/**
 * Servlet implementation class Ques
 */
@WebServlet("/Ques")
public class Ques extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement pslogin=null;
	private PreparedStatement psreg=null,ps=null;
	private Connection con=null;
	 private ResultSet rs=null;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ques() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strsql="select * from logindetails where userid=?";
		PrintWriter out=response.getWriter();
		String id=request.getParameter("id");
		String utype="";
		String userpass="";
		con=CrudOperation.establishConnection();
		try
		{
		ps=con.prepareStatement(strsql);
		ps.setString(1,id);
		rs=ps.executeQuery();
		if(rs.next())
		{
			utype=utype+rs.getString("usertype");
			userpass=userpass+rs.getString("userpass");
		}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
		
		
		if(utype.equals("user"))
			{ 
				String sql2="select * from userdetails where userid=?";
				String id1=request.getParameter("id");
				con=CrudOperation.establishConnection();
				try
				{ 
					ps=con.prepareStatement(sql2);
				    ps.setString(1,id1);
					rs=ps.executeQuery();
					if(rs.next())
					{
						out.println(rs.getString("ques")+"$"+rs.getString("ans")+"*"+userpass);
						
					}
				}
				catch(SQLException se)
				{
					System.out.println(se);
				}
			}
			else
			{
String sql="select * from experts where userid=?";
con=CrudOperation.establishConnection();
try
{
	ps=con.prepareStatement(sql);
    ps.setString(1,id);
	rs=ps.executeQuery();
	if(rs.next())
	{
		out.println(rs.getString("ques")+"$"+rs.getString("ans")+"*"+userpass);
	}
		
}
catch(SQLException se)
{
	System.out.println(se);
}	
			
		
			}}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
