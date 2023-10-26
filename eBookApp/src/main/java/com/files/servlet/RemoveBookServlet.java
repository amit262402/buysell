package com.files.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.file.DB.DBconnect;
import com.files.dao.cartDaoImpl;

/**
 * Servlet implementation class RemoveBookServlet
 */
public class RemoveBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		cartDaoImpl dao=new cartDaoImpl(DBconnect.getCon());
		boolean b = dao.RemoveBook(bid,uid,cid);
		
		HttpSession session=request.getSession();
		
		if(b)
		{
			session.setAttribute("succmsg", "Book Remove from cart");
			response.sendRedirect("checkout.jsp");
		}else
	  	{
			session.setAttribute("failedmsg","something Error");
			response.sendRedirect("checkout.jsp");
		}
	}

	

}
