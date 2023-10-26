package com.files.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.file.entities.Cart;
import com.file.entities.bookDetails;
import com.files.dao.bookDaoImpl;
import com.files.dao.cartDaoImpl;


public class cartServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
   
	
    public cartServlet() 
      {
    	
        super();   
      }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			int bid=Integer.parseInt(request.getParameter("bid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			bookDetails b = dao.getBookbyId(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookname(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalprice(Double.parseDouble(b.getPrice()));
			
			cartDaoImpl cdao=new cartDaoImpl(DBconnect.getCon());
			HttpSession session=request .getSession();
			
			boolean d = cdao.addcart(c);
			
			if(d)	
			{
				session.setAttribute("addcart","Book add to cart");
				response.sendRedirect("allNewBook.jsp");
				System.out.println("add  cart successfully");
				
			}else
			{
				session.setAttribute("failed", "something wrong");
				response.sendRedirect("allNewBook.jsp");
				System.out.println("something error!!!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
