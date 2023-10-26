<%@page import="com.file.entities.user"%>
<%@page import="com.file.entities.bookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All recent book</title>
<%@include file="allComponent/AllCss.jsp" %>

<style type="text/css">

.crd-ho:hover
{
background-color: #f8bbd0;
}


</style>
</head>
<body>

<% 

user u=(user) session.getAttribute("userobj");
System.out.println(u);
%>

<%@include file="allComponent/navbar.jsp" %>

<div class="container-fluid">
<div class="row p-3">
	<%
		String ch=	request.getParameter("ch");
			bookDaoImpl dao2=new bookDaoImpl(DBconnect.getCon());
			List<bookDetails> list2 = dao2.getBookbySearch(ch);
		
			for(bookDetails b:list2)
	
			{%>
				<div class="col-md-3">
		   <div class="card crd-ho mt-2">
		       <div class="card-body text-center ">
			       <img alt="" src="bookname/<%=b.getPhoto() %>" style="width:100px;height:100px "class="img-thumblin" >
			       <p><%=b.getBookname() %></p>
			       <p>Author: <%=b.getAuthor() %></p>
			       <p>
			       <%
			       	if(b.getBookCategory().equals("Old"))
			       	{%>
			       		 Categories:<%=b.getBookCategory() %></p>
		           <div class="row">
			         
		              <a href="viewBook.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
		              <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> 299</a>
			       </div>
			       	<%}else
			       	{%>
			       		Categories:<%=b.getBookCategory() %></p>
		           <div class="row">
		           
			          <%
		            if(u==null)
		            {%>
		            	<a href="login.jsp" class="btn btn-danger btn-sm ml-2">
		            	<i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
		           <% }else
		           {%>
		        	   <a href="cartServlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">
		        	   <i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
		          <% }
		            %>
		              <a href="viewBook.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details</a>
		              <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> 299</a>
			       </div>
			       	<%}
			       
			       %>
			        
		         </div>
		      </div>
		</div>
				
			<% }
		%>
		

</div>
</div>


</body>
</html>