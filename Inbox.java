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
 * Servlet implementation class Inbox
 */
@WebServlet("/Inbox")
public class Inbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inbox() {
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
		String delarr[]=request.getParameterValues("chkdelete");
		String strdelete="update message set rstatus=? where messageid=?";
		String id=request.getParameter("txthidden");
		con=CrudOperation.establishConnection();
		try
		{
		 ps=con.prepareStatement(strdelete);
		 con.setAutoCommit(false);
		for(int i=0;i<delarr.length;i++)
		{
			ps.setString(1,"true");
			ps.setString(2,delarr[i]);
			ps.addBatch();
		}
		int rows[]= ps.executeBatch();
		int flag=0;
		for(int j=0;j<rows.length;j++)
		{
			if(rows[j]<0)
			{
				flag=1;
				break;
			}
		}
		if(flag!=1)
		{
			con.setAutoCommit(true);
			response.sendRedirect("/ehealthcare/jsp/inbox.jsp?userid="+id);
		}
		
		
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
	}
	

}
