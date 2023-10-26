package com.files.adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.file.DB.DBconnect;
import com.file.entities.bookDetails;
import com.files.dao.bookDaoImpl;

/**
 * Servlet implementation class editbooks
 */
public class editbooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editbooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			int id=Integer.parseInt(request.getParameter("id"));
			String bookname=request.getParameter("bookname") ;
			String author=request.getParameter("authorname");
			String price=request.getParameter("price");
			String category=request .getParameter("btype");
			String status=request.getParameter("bstatus");
			String email=request.getParameter("email");
			
			
			bookDetails b=new bookDetails();
			b.setBookid(id);
			b.setBookname(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setBookCategory(category);
			b.setEmail(email);
			b.setStatus(status);
			
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			boolean c = dao.updateEditBooks(b);
			
			HttpSession session=request.getSession();
			
			if(c)
			{
				session.setAttribute("succmsg","book update successfully!!");
				response.sendRedirect("admin/allBooks.jsp");
			}
			else
			{
				session.setAttribute("failed", "book does not save!!");
				response.sendRedirect("admin/allBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
