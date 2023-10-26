package com.files.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.files.dao.bookDaoImpl;

/**
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try 
		{
			int id=Integer.parseInt(request.getParameter("id"));
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			boolean b = dao.deletebook(id);
            HttpSession session=request.getSession();
			
			if(b)
			{
				session.setAttribute("succmsg","book delete successfully!!");
				response.sendRedirect("admin/allBooks.jsp");
			}
			else
			{
				session.setAttribute("failed", "some wrong !!");
				response.sendRedirect("admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
