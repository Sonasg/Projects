package ehealthcare.ser;

import java.io.IOException;
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
 * Servlet implementation class CreateTips
 */
@WebServlet("/CreateTips")
public class CreateTips extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con=null;
       private PreparedStatement ps=null;
       private int val=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTips() {
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
		String id=request.getParameter("txtid");
		String tip=request.getParameter("txttip");
		String file=request.getParameter("txtnm");
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		con=CrudOperation.establishConnection();
		String strsql="insert into tips values(?,?,?,?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setString(1,id);
			ps.setDate(2,sd);
			ps.setString(3,tip);
			ps.setInt(4,val);
			ps.setString(5,file);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ehealthcare/jsp/createtips.jsp?userid="+id);
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
	}

}
