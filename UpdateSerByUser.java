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
 * Servlet implementation class UpdateSerByUser
 */
@WebServlet("/UpdateSerByUser")
public class UpdateSerByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
    private PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSerByUser() {
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
		String ui=request.getParameter("txthidden");
		String email=request.getParameter("txtemail");
		long ph=Long.parseLong(request.getParameter("txtphone"));
		String address=request.getParameter("txtadd");
		String strupdate="update experts set email=?,PhoneNo=?,Address=? where userid=?";
		con=CrudOperation.establishConnection();
		try
		{
			ps=con.prepareStatement(strupdate);
		    ps.setString(1,email);	
		ps.setLong(2,ph);
		ps.setString(3,address);
		ps.setString(4,ui);
		int i=ps.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("/ehealthcare/jsp/profile.jsp");
		}
		}
		catch(SQLException se)
		{
			System.out.println(se);
	}

}}
