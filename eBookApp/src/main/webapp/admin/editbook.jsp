<%@page import="com.file.entities.bookDetails"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Add Books</title>
<%@include file="AllCss.jsp" %>
</head>
<body style="background-color:#E6E6FA">
<%@include file="navbar.jsp" %>

<div class="container">
<div class="row">
	<div class="col-md-4 offset-md-4" >
	<div class="card">
	<div class="card-body">
	
	<h3 class="text-center"> Add Books</h3>
	
	<%
		int id=Integer.parseInt(request.getParameter("id"));
		bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
		bookDetails b=dao.getBookbyId(id);
	%>
	
	
	<form action="../editbooks" method ="post">
	
	<input type="hidden" name="id" value="<%=b.getBookid()%>">
		
        <div class="form-group">  
			<label for="exampleInputNamel"><i class="fa-solid fa-book"></i> Book Name</label>
			<input type="text" class="form-control" id="exampleInputNameI"
			 aria-describedby="emailHelp" placeholder="Enter BookName" name="bookname" value="<%=b.getBookname() %>" required >
		</div>
		<div class="form-group">
			<label for="exampleInputEmail"><i class="fa-regular fa-user"></i> Author Name</label>
			<input type="text" class="form-control" id="exampleInputEmailI"
			 aria-describedby="emailHelp" placeholder="Enter author" name="authorname" value="<%=b.getAuthor() %>"required >
		</div>
		<div class="form-group">
			<label for="exampleInputPhone"><i class="fa-solid fa-rupee-sign"></i> Price</label>
			<input type="number" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter price" name="price" value="<%=b.getPrice() %>"required >
		</div>
		<div class="form-group">
			<label for="exampleInputPassword"> Book Categories</label>
			<select class="form-control" id="inputstate" 
			  name="btype">
			  <%if("New".equals(b.getBookCategory()))
			 {%>
			 <option value="New">New Book</option>
				  
			<% 
			}else
			{%>
				<option value="Old">Old Book</option>
			<%}
			%>
			 
			  </select>
		</div>
		<div class="form-group">
			<label for="exampleInputcPassword"> Book Status</label>
			<select class="form-control" id="inputstate" name="bstatus" >
			 <%if("Active".equals(b.getStatus()))
			 {%>
			 
				<option value="Active"> Active</option>  
			<% 
			}else
			{%>
				<option value="Inactive"> Inactive</option>
			<%}
			%>
			</select>
		</div>
		
		<div class="form-group">
			<label for="exampleInputPhone"> Email</label>
			<input type="email" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter Email"name="email" value="<%=b.getEmail() %>" required >
		</div>
		<br>
		
		<div class="text-center">
		<button type="submit" class="btn btn-primary">Update</button>
		</div>
	</form>
	
	</div>
	</div>
	</div>
</div>
</div>

<div style="margin-top:10px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>