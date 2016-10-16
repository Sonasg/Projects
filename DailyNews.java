package ehealthcare.ser;

import java.io.IOException;
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

import com.db.CrudOperation;

/**
 * Servlet implementation class DailyNews
 */
@WebServlet("/DailyNews")
public class DailyNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       private int val=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyNews() {
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
		String strsql="insert into dailynews values(?,?,?,?,?)";
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		String news=request.getParameter("txtnews");
		String pic=request.getParameter("txtnm");
		String head=request.getParameter("txthead");
		con=CrudOperation.establishConnection();
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setString(1,news);
			ps.setInt(2,val);
			ps.setString(3,pic);
			ps.setDate(4,sd);
			ps.setString(5,head);
            int rs=ps.executeUpdate();
            if(rs>0)
            {
            	con.setAutoCommit(true);
            response.sendRedirect("/ehealthcare/jsp/dailynews.jsp");	
            }
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
		
	}

}
