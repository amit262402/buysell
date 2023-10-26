<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body  style="background-color:#ffcdd2">

<c:if test="${empty userobj  }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="allComponent/navbar.jsp" %>

<div class="container">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary">Edit Profile</h5>

<c:if test="${not empty succmsg }">
	<h4 class="text-center text-danger">${succmsg }</h4>
	<c:remove var="succmsg" scope="session"/> 
</c:if>
<c:if test="${not empty failedmsg }">
	<h4 class="text-center text-danger">${failedmsg }</h4>
	<c:remove var="failedmsg" scope="session"/> 
</c:if>

<form action="EditProfileServlet" method ="post">
	
		<input type="hidden" value="${userobj.id }" name="id">
        <div class="form-group">  
			<label for="exampleInputNamel"> Name</label>
			<input type="text" class="form-control" id="exampleInputNameI"
			 aria-describedby="emailHelp" placeholder="Enter BookName" name="name" value="${userobj.name }">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail"> Email Address</label>
			<input type="email" class="form-control" id="exampleInputEmailI"
			 aria-describedby="emailHelp" placeholder="Enter Email" name="email" value="${userobj.email }">
		</div>
		<div class="form-group">
			<label for="exampleInputPhone">Phone</label>
			<input type="number" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter phone" name="phone" value="${userobj.phone }" >
		</div>
		<div class="form-group">
			<label for="exampleInputPhone">Password</label>
			<input type="password" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter password" name="password" value="${userobj.password }">
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
</body>
</html>


