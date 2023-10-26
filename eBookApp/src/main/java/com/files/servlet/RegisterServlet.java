package com.files.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.file.entities.user;
import com.files.dao.userDaoImpl;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		try
		{
			String name=request.getParameter("name");
			String email=request .getParameter("email");
			String phone=request.getParameter("phone");
			String password=request.getParameter("password");
			String check=request.getParameter("check");
			//System.out.println(name+""+email+""+phone+""+password+""+check);
			 
			user u=new user();
			u.setName(name);
			u.setEmail(email);
			u.setPhone(phone);
			u.setPassword(password);
			
			HttpSession session=request.getSession();
			
			if(check!=null)
			{
				userDaoImpl dao=new userDaoImpl(DBconnect.getCon());
				
				boolean f2 = dao.checkUser(email);
				
				if(f2)
				{
					boolean b = dao.userRegister(u);
					if(b)
					{
						
						//System.out.println("user register successful");
						session.setAttribute("succmsg", "Registration successfully");
						response.sendRedirect("register.jsp");
					}
					else
					{
						//System.out.println("Something wrong on server");
						session.setAttribute("failedmsg", "something wrong on server..");
						response.sendRedirect("register.jsp");
					}
				
				}else
				{
					session.setAttribute("failedmsg", "user already exist try to another email id");
					response.sendRedirect("register.jsp");
				}
			}	
			else
			{
				session.setAttribute("check", "please check Agree & terms condition");
				response.sendRedirect("register.jsp");
			}
			
		
		} 
		catch (Exception e)
		{
			e.printStackTrace()	;
		}
		
		
	}

}
