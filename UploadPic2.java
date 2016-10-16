package ehealthcare.ser;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UploadPic2
 */
@WebServlet("/UploadPic2")
public class UploadPic2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPic2() {
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
		String ui="admin";
		String pt=getServletContext().getRealPath("/");
		String newpath=pt+ui;
		File f=new File(newpath);
		if(!f.exists())
		{
			f.mkdir();
		}
		MultipartRequest mpt=new MultipartRequest(request,newpath,1024*1024*6);
		Enumeration e=mpt.getFileNames();
		while(e.hasMoreElements())
		{
			String ctrlname=(String)e.nextElement();
			fob=mpt.getFile(ctrlname);
		    filename=fob.getName();
		  
		}
		response.sendRedirect("/ehealthcare/jsp/dailynews.jsp?file="+filename);
	
	}

	}

