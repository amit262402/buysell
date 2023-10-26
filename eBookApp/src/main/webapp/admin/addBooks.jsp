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

<!--without login not access  -->
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
</c:if>

<div class="container">
<div class="row">
	<div class="col-md-4 offset-md-4" >
	<div class="card">
	<div class="card-body">
	
	<h3 class="text-center"> Add Books</h3>
	
	<c:if test="${not empty succmsg }">
	<p class="text-center text-success">${succmsg } </p>
	<c:remove var="succmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedmsg }">
	<p class="text-center text-success">${failedmsg } </p>
	<c:remove var="failedmsg" scope="session"/>
	</c:if>
	
	<form action="../addbookServlet" method ="post" 
	enctype="multipart/form-data">
	
        <div class="form-group">  
			<label for="exampleInputNamel"><i class="fa-solid fa-book"></i> Book Name</label>
			<input type="text" class="form-control" id="exampleInputNameI"
			 aria-describedby="emailHelp" placeholder="Enter BookName" name="bookname"required >
		</div>
		<div class="form-group">
			<label for="exampleInputEmail"><i class="fa-regular fa-user"></i> Author Name</label>
			<input type="text" class="form-control" id="exampleInputEmailI"
			 aria-describedby="emailHelp" placeholder="Enter author" name="authorname" required >
		</div>
		<div class="form-group">
			<label for="exampleInputPhone"><i class="fa-solid fa-rupee-sign"></i> Price</label>
			<input type="number" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter price" name="price"required >
		</div>
		<div class="form-group">
			<label for="exampleInputPassword"> Book Categories</label>
			<select class="form-control" id="inputstate"
			  name="btype">
			  <option selected>---select---</option>
			  <option value="New">New Book</option>
			  <option value="Old">Old Book</option>
			  </select>
		</div>
		<div class="form-group">
			<label for="exampleInputcPassword"> Book Status</label>
			<select class="form-control" id="inputstate" name="bstatus">
			 <option selected>---select---</option>
			 <option value="Active"> Active</option>
			  <option value="Inactive"> Inactive</option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="exampleInputcPassword"> <i class="fa-solid fa-upload"></i> Upload Photo</label>
			<input class="form-control"type="file" id="exampleInputPhoneI"
			 name="upload">
		</div>
		<div class="form-group">
			<label for="exampleInputPhone"> Email</label>
			<input type="email" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter Email"name="email" required >
		</div>
		<br>
		
		<div class="text-center">
		<button type="submit" class="btn btn-primary">Add</button>
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