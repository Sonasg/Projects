package ehealthcare.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.CrudOperation;

/**
 * Servlet implementation class CalcId
 */
@WebServlet("/CalcId")
public class CalcId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int val=1;
	private Connection con=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login="";
		CalcId i=new CalcId();
		String type=request.getParameter("type");
		//System.out.println(type);
		//System.out.println("no");
		String id="";
		PrintWriter p=response.getWriter();
		con=CrudOperation.establishConnection();
		if(type.equals("nutritionist")||type.equals("dietitian")||type.equals("yoga expert"))
		{
		login="select userid from experts";
		try
		{
			ps=con.prepareStatement(login);
			rs=ps.executeQuery();
			while(rs.next())
			{
				id=rs.getString("userid");
			}
			System.out.println(id);
			if(id.equals(""))
			{
				p.println("expert_"+""+"$"+type);
			}
			else
			{
				System.out.println("yes");
		     p.println(id+"$"+type);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		else
		{
		login="select userid from userdetails";
		try
		{
			ps=con.prepareStatement(login);
			rs=ps.executeQuery();
			while(rs.next())
			{
				id=rs.getString("userid");
			}
			if(id.equals(""))
			{
				System.out.println("op");
				p.println("user_"+"");
			}
			else
			{
				p.println(id);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
