package ehealthcare.ser;
import com.db.CrudOperation;




import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckRegId
 */
@WebServlet("/CheckRegId")
public class CheckRegId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null,con1=null;
	private PreparedStatement ps=null,ps1=null;
	private ResultSet rs=null,rs1=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRegId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type="";
	    String strsql="";
		String sql="select usertype from logindetails where userid=?";
	    con=CrudOperation.establishConnection();
		String s_id=request.getParameter("sui");
		PrintWriter p=response.getWriter();
		String id[]=s_id.split(",");
		int i=0;
		try
		{
			ps=con.prepareStatement(sql);
			ps.setString(1,id[0]);
			rs=ps.executeQuery();
			if(rs.next())
			{
				type=type+rs.getString("usertype");
			}
		con1=CrudOperation.establishConnection();
		if(type.equals("user"))
		{
			strsql=strsql+"select * from experts where userid=?";	
			ps1=con1.prepareStatement(strsql);
			ps1.setString(1,id[1]);	
			rs1=ps1.executeQuery();
			
			}

		else
		{
			strsql=strsql+"Select * from logindetails where userid=? and status=?";
			ps1=con1.prepareStatement(strsql);
			ps1.setString(1,id[1]);
			ps1.setString(2,"true");
			}
		rs1=ps1.executeQuery();
		if(rs1.next())
		{
				i=1;
		}
		if(i==0)
		{
			p.println("invalid receiver id");
		}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
