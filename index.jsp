
<%@page import="com.file.entities.user"%>
<%@page import="com.file.entities.bookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@page import="com.file.DB.DBconnect"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Index</title>
<%@include file="allComponent/AllCss.jsp" %>
<style type="text/css">
.back-img{
background:url("bookimg/b1.webp");
height:50vh;
width:100%;
backgroung-repeat:no-repeat;
background-size: cover; 
}
.crd-ho:hover
{
background-color: #f8bbd0;
}


</style>
</head>
<body  style="background-color:#c2185b;">

<% 

user u=(user) session.getAttribute("userobj");
System.out.println(u);
%>


	<%@include file="allComponent/navbar.jsp" %>
	
	<div class="container-fluid back-img">
		<h1 class="text-center text-white"><i class="fa-solid fa-book-open-reader"></i> eBooksell</h1>
		
	</div>
	
	
	
	<!-- Start Recent Book -->
	
	<div class="container">
		<h3 class="text-center" style="color:white">Recent Books</h3>
		<div class="row">
		<%
			bookDaoImpl dao2=new bookDaoImpl(DBconnect.getCon());
			List<bookDetails> list2 = dao2.getRecentBook();
		
			for(bookDetails b:list2)
	
			{%>
				<div class="col-md-3">
		   <div class="card crd-ho">
		       <div class="card-body text-center">
			       <img alt="" src="bookname/<%=b.getPhoto() %>" style="width:150px;height:100px "class="img-thumblin">
			       <p><%=b.getBookname() %></p>
			       <p> <%=b.getAuthor() %></p>
			       <p>
			       <%
			       	if(b.getBookCategory().equals("Old"))
			       	{%>
			       		 Categories:<%=b.getBookCategory() %></p>
		           <div class="row">
			          <a  class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
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
		<div class="text-center mt-1 p-2">
		<a href="allRecentBook.jsp" class="btn btn-danger btn-sm">view all</a>
		</div>
	</div>
	<!-- End Recent Book -->
	
	<!-- Start new Book -->
	
	<div class="container">
		<h3 class="text-center" style="color:white">New Books</h3>
		<div class="row">
		
		
		<%
			bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
			List<bookDetails> list= dao.getNewBook();
			
	
			for(bookDetails b:list)
			{%>
				<div class="col-md-3">
			<div class="card crd-ho">
		       <div class="card-body text-center">
			      <img alt="" src="bookname/<%=b.getPhoto() %>" style="width:150px;height:100px "class="img-thumblin">
			       <p> <%=b.getBookname() %></p>
			       <p><%=b.getAuthor() %></p>
			       <p> Categories:<%=b.getBookCategory() %></p>
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
		              <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice() %></a>
			       </div>
		         </div>
		      </div>
		</div>	
				
			<% }
		%>
		
		   
	
		</div>
		<div class="text-center mt-1 p-2">
		<a href="allNewBook.jsp" class="btn btn-danger btn-sm">view all</a>
		</div>
	</div>
	<!-- End new Book -->
	
	<!-- Start old Book -->
	
	
	<div class="container">
		<h3 class="text-center" style="color:white">Old Books</h3>
		<div class="row">
		
		
		<%
			bookDaoImpl dao3=new bookDaoImpl(DBconnect.getCon());
			List<bookDetails> list3= dao3.getOldBook();
			
	
			for(bookDetails b:list3)
			{%>
				<div class="col-md-3">
			<div class="card crd-ho">
		       <div class="card-body text-center">
			      <img alt="" src="bookname/<%=b.getPhoto() %>" style="width:150px;height:100px "class="img-thumblin">
			       <p> <%=b.getBookname() %></p>
			       <p><%=b.getAuthor() %></p>
			       <p> Categories:<%=b.getBookCategory() %></p>
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
		              <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice() %></a>
			       </div>
		         </div>
		      </div>
		</div>	
				
			<% }
		%>
		
		   
	
		</div>
		<div class="text-center mt-1 p-2">
		<a href="allOldBook.jsp" class="btn btn-danger btn-sm">view all</a>
		</div>
	</div>
	<!-- End old Book -->
	
	
	
	<%@include file="allComponent/footer.jsp" %>
</body>
</html>