package com.files.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try 
		{
			HttpSession session=request.getSession();
			session.removeAttribute("userobj");
			HttpSession session2=request.getSession();
			session2.setAttribute("succmsg", "logout successfully!!");
			response.sendRedirect("login.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

	

}
