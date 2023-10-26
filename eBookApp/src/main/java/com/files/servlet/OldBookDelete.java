package com.files.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.files.dao.bookDaoImpl;

/**
 * Servlet implementation class OldBookDelete
 */
public class OldBookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OldBookDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("em");
			int id=Integer.parseInt(request.getParameter("id"));
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			boolean b = dao.OldBookDeleteByUser(email,"Old",id);
			
	          HttpSession session=request.getSession();
			
			if(b)
			{
				session.setAttribute("succmsg", "Old Book Remove successfully");
				response.sendRedirect("OldBook.jsp");
			}else
		  	{
				session.setAttribute("failedmsg","something Error");
				response.sendRedirect("OldBook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}


