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
 * Servlet implementation class AdminConfirmRegis
 */
@WebServlet("/AdminConfirmRegis")
public class AdminConfirmRegis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con=null;
       private ResultSet rs=null;
       private PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminConfirmRegis() {
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
		String confirmarr[]=request.getParameterValues("chkconfirm");
		String strupdate="update logindetails set status=? where userid=?";
		con=CrudOperation.establishConnection();
		try
		{
		 ps=con.prepareStatement(strupdate);
		 con.setAutoCommit(false);
		for(int i=0;i<confirmarr.length;i++)
		{
			ps.setString(1,"true");
			ps.setString(2,confirmarr[i]);
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
			response.sendRedirect("/ehealthcare/jsp/admin.jsp");
		}
		
		
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
	}
	}


