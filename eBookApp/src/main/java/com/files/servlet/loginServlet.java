package com.files.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

import com.file.DB.DBconnect;
import com.file.entities.user;
import com.files.dao.userDaoImpl;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		try 
		{
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			userDaoImpl ud=new userDaoImpl(DBconnect.getCon());
			
			HttpSession session=request.getSession();
			
			if("admin@gmail.com".equals(email) && "admin".equals(password))
			{
				user u=new user();
				u.setName("Admin");
				session.setAttribute("userobj",u );
				
				
				response.sendRedirect("admin/home.jsp");
			}
			else
			{
				user us = ud.userlogin(email, password);
				
				if(us!=null)
				{
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				}else
				{
					session.setAttribute("failedmsg", "user and password invailed");
				}
				
				response.sendRedirect("login.jsp");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		} 
	
	}

}
