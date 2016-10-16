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
 * Servlet implementation class ViewNut
 */
@WebServlet("/ViewNut")
public class ViewNut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con=null;
       private ResultSet rs=null;
       private PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewNut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id1=request.getParameter("view");
		System.out.println(id1);
		String id=request.getParameter("d");
		System.out.println(id);
		String strsql="select * from experts where userid=?";
		String value="";
		String pic="";
		String sql="select * from picdetail where userid=?";
		PrintWriter p=response.getWriter();
		con=CrudOperation.establishConnection();
		try
		{
			ps=con.prepareStatement(strsql);
			ps.setString(1,id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				value=value+rs.getString("Name")+","+rs.getString("skills");
			}
		}
			catch(SQLException se)
			{
				System.out.println(se);
			}
		try
		{
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				pic=pic+rs.getString("name");
			}
			value=value+"#"+pic;
			p.println(value);
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
