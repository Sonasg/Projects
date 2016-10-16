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
 * Servlet implementation class User_CheckRegId
 */
@WebServlet("/User_CheckRegId")
public class User_CheckRegId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	int flag=0;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_CheckRegId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String u_id=request.getParameter("ui");
		String strsql="Select * from logindetails where userid=?";
		con=CrudOperation.establishConnection();
		try
		{
			ps=con.prepareStatement(strsql);
			ps.setString(1,u_id);
			rs=ps.executeQuery();
			if(!rs.next())
			{
				out.println("invalid user id");			}
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
