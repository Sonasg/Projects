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
 * Servlet implementation class DisplayNews
 */
@WebServlet("/DisplayNews")
public class DisplayNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private 	PreparedStatement ps=null;
	private	ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strsql="select * from dailynews where date=?";
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		con=CrudOperation.establishConnection();
		PrintWriter p=response.getWriter();
		String news="";
		try
		{
			ps=con.prepareStatement(strsql);
			ps.setDate(1,sd);
			rs=ps.executeQuery();
			while(rs.next())
			{
				news=news+rs.getString("name")+"#"+rs.getString("headline")+"^"+rs.getString("newsid")+"$";
			}
			p.println(news);
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
