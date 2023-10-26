<%@page import="com.file.entities.bookDetails"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ViewBook</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body style="background-color:#ffcdd2">
<%@include file="allComponent/navbar.jsp" %>

<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
	bookDetails b= dao.getBookbyId(bid);
%>

	<div class="container">
	<div class="row p-5">
	<div class="col-md-6 text-center p-5 border bg-white">
	<img src="bookname/<%=b.getPhoto() %>" style="height:150px;width:150px"><br>
	<h4 class="mt-3">Book Name:<span class="text-success"><%=b.getBookname() %></span></h4>
	<h4>Author Name:<span class="text-success"><%=b.getAuthor() %></span></h4>
	<h4> Category:<span class="text-success"><%=b.getBookCategory() %></span></h4>
	</div>
	<div class="col-md-6 text-center p-5 border bg-white">
	<h2><%=b.getBookname() %></h2>
	
	<%
	if("Old".equals(b.getBookCategory()))
	{%>
		<h5 class="text-primary">Contact to seller</h5>
		<h5 class="text-primary"><i class="fa-regular fa-envelope"></i>:<%=b.getEmail() %></h5>
	<%}
	
	%>
	
	<div class="row ">
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fa-solid fa-money-bill-wave fa-2x"></i>
	<p>Cash on Delivery</p>
	</div>
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fa-solid fa-rotate-left fa-2x"></i>
	<p>Return Available</p>
	</div>
	<div class="col-md-4 text-danger text-center p-2">
	<i class="fa-solid fa-truck fa-2x"></i>
	<p>Free Shipping</p>
	</div>
	</div>
	
	<%
	if("Old".equals(b.getBookCategory()))
	{%>
	<div class="text-center p-3">
	<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
	<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i>Continue shopping</a>
	<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>500</a>
	</div>
	<%}else
	{%>
		<div class="text-center p-3">
	<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
	<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>500</a>
	<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i>Continue shopping</a>
	</div>
	<%}
	
	%>
	
	
	
	</div>
	
	</div>
	</div>

</body>
</html>