package com.files.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.file.entities.user;
import com.files.dao.userDaoImpl;

/**
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String email=request .getParameter("email");
			String phone=request.getParameter("phone");
			String password=request.getParameter("password");
			
			user u=new user();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setPhone(phone);
			u.setPassword(password);
			
			HttpSession session=request.getSession();
			userDaoImpl dao=new userDaoImpl(DBconnect.getCon());
			boolean b = dao.checkpassword(password, id);
			
			if(b)
			{
				boolean c = dao.updateProfile(u);
				if(c)
				{
					session.setAttribute("succmsg", "User profile Update successfully");
					response.sendRedirect("EditProfile.jsp");
				}
				else
				{
					session.setAttribute("failedmsg", "Something wrong!!");
					response.sendRedirect("EditProfile.jsp");	
				}
			}else
			{
				session.setAttribute("failedmsg", "your password incorrect!!");
				response.sendRedirect("EditProfile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
