package ehealthcare.ser;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.CrudOperation;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UploadPic4
 */
@WebServlet("/UploadPic4")
public class UploadPic4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Connection con=null;
       private PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPic4() {
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
		String filename=null;
	    File fob=null;
		String ui=request.getParameter("uid");
		String type=request.getParameter("type");
		String pt=getServletContext().getRealPath("/");
		String newpath=pt+ui;
		File f=new File(newpath);
		if(!f.exists())
		{
			f.mkdir();
		}
		PrintWriter out=response.getWriter();
		MultipartRequest mpt=new MultipartRequest(request,newpath,1024*1024*6);
		Enumeration e=mpt.getFileNames();
		while(e.hasMoreElements())
		{
			String ctrlname=(String)e.nextElement();
			fob=mpt.getFile(ctrlname);
		    filename=fob.getName();
		}
		response.sendRedirect("/ehealthcare/jsp/register.jsp?type="+type+"&file="+filename);
/*	response.sendRedirect("/ehealthcare/jsp/register.jsp");*/
		/*con=CrudOperation.establishConnection();
		String strsql="insert into experts values(?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setString(1,ui);
			ps.setString(11,filename);
		int	rs=ps.executeUpdate();
		if(rs>0)
		{
			con.setAutoCommit(true);
		}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		}*/

}
}