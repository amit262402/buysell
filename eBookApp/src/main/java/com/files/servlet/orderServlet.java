package com.files.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.file.entities.BookOrder;
import com.file.entities.Cart;
import com.files.dao.BookOrderDaoImpl;
import com.files.dao.cartDaoImpl;

/**
 * Servlet implementation class orderServlet
 */
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try 
		{
			HttpSession session=request.getSession();
			
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String address=request.getParameter("address");
			String landmark=request.getParameter("landmark");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String paymentType=request.getParameter("payment");
			
			String fulladd=address+","+landmark+","+city+","+state+","+pincode;
			
			
			cartDaoImpl dao=new cartDaoImpl(DBconnect.getCon());
			
			List<Cart> blist = dao.getBookByUser(id);
			if(blist.isEmpty())
			{
				session.setAttribute("failedmsg","Add item");
				response.sendRedirect("checkout.jsp");
			}else
			{

				BookOrderDaoImpl dao1=new BookOrderDaoImpl(DBconnect.getCon());
				int i = dao1.getOrderNo();
				
				BookOrder o=null;
				
				ArrayList<BookOrder> order=new ArrayList<BookOrder>();
				for(Cart c:blist)
				{
					o=new BookOrder();
					
					o.setOrderid("Book-Order-no"+i);
					o.setName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFulladd(fulladd);
					o.setBookname(c.getBookname());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					order.add(o);
					i++;
					
				}
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedmsg","choose payment method");
					response.sendRedirect("checkout.jsp");
				}
				else
				{
					boolean saveOrder = dao1.saveOrder(order);
					
					if(saveOrder)
					{
						response.sendRedirect("orderSuccess.jsp");
						
					}else
					{
						session.setAttribute("failedmsg","your order failed!!");
						response.sendRedirect("checkout.jsp");
					}
				
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
