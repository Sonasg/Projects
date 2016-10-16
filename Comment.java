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
 * Servlet implementation class Comment
 */
@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
    private PreparedStatement ps=null;
    private ResultSet rs1=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
	String strsql="update blog set blog=? where blogid=?";
	String strsql1="select * from blog where blogid=?";
	String blog=request.getParameter("txtblog");
	String id=request.getParameter("txtid");
	con=CrudOperation.establishConnection();
	String data="";
	try
	{
		ps=con.prepareStatement(strsql1);
		ps.setString(1,id);
		rs1=ps.executeQuery();
		if(rs1.next())
		{
		data=rs1.getString("blog");
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	String val=data+"#"+blog;
	try
	{
		con.setAutoCommit(false);
		ps=con.prepareStatement(strsql);
		ps.setString(1,val);
		ps.setString(2,id);
		int rs=ps.executeUpdate();
		if(rs>0)
		{
			con.setAutoCommit(true);
			response.sendRedirect("/ehealthcare/jsp/comment.jsp?blog="+id);
		}
	}
		catch(SQLException se)
	{
			System.out.println(se);
			
	}
	}

}
