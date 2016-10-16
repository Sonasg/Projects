package ehealthcare.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.CrudOperation;

/**
 * Servlet implementation class ComposeMail
 */
@WebServlet("/ComposeMail")
public class ComposeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Connection con=null;
     private PreparedStatement ps=null;
     private int val=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComposeMail() {
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
		String rid=request.getParameter("txtrec");
		String sid=request.getParameter("txtsen");
		String sub=request.getParameter("txtsub");
		String msg=request.getParameter("txtmsg");
		con=CrudOperation.establishConnection();
		String strsql="insert into message values(?,?,?,?,?,?,?,?)";
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setInt(1,val);
			ps.setString(2,sid);
			ps.setString(3,rid);
			ps.setString(5,msg);
			ps.setString(4,sub);
			ps.setDate(6,sd);
			ps.setString(7,"false");
			ps.setString(8,"false");
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ehealthcare/jsp/compose.jsp?userid="+sid);
			}
			
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
		
	}

}
