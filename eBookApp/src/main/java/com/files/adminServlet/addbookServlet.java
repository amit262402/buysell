package com.files.adminServlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.file.DB.DBconnect;
import com.file.entities.bookDetails;
import com.files.dao.bookDaoImpl;

/**
 * Servlet implementation class addbookServlet
 */
@MultipartConfig
public class addbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addbookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			String bookname=request.getParameter("bookname") ;
			String author=request.getParameter("authorname");
			String price=request.getParameter("price");
			String category=request .getParameter("btype");
			String status=request.getParameter("bstatus");
			String email=request.getParameter("email");
			Part part =(Part) request.getPart("upload");
			String filename=part.getSubmittedFileName();
			
			bookDetails b=new bookDetails(bookname,author,price,category,status,filename,email);
			
		   bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
		   
			boolean addbook = dao.addbook(b);
			
			HttpSession session= request.getSession();
			
			if(addbook)
			{
				 String path=getServletContext().getRealPath("")+"bookname";
				   File f=new File(path);
				   part.write(path + File.separator + filename);
				
				session.setAttribute("succmsg", "book add successfully!");
				response.sendRedirect("admin/addBooks.jsp");
				
			}
			else
			{
				session.setAttribute("failed", "something is wrong!");
				response.sendRedirect("admin/addBooks.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
