<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBookRegister</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body style="background-color:#ffcdd2 ">
<%@include file="allComponent/navbar.jsp" %>

<div class="container p-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h3 class="text-center"><i class="fa-solid fa-address-card"></i> Registration</h3>

	<c:if test="${not empty succmsg }">
		<p class="text-center text-success">${succmsg} </p>
		<c:remove var="succmsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedmsg }">
	<p class="text-center text-danger">${failedmsg } </p>
	<c:remove var="failedmsg" scope="session"/>
	</c:if>
	<form action="RegisterServlet" method ="post">
	
        <div class="form-group">  
			<label for="exampleInputNamel"><i class="fa-solid fa-user"></i> Name</label>
			<input type="text" class="form-control" id="exampleInputNameI"
			 aria-describedby="emailHelp" placeholder="Enter Name"required name="name">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail"><i class="fa-solid fa-envelope"></i> Email</label>
			<input type="email" class="form-control" id="exampleInputEmailI"
			 aria-describedby="emailHelp" placeholder="Enter email" required name="email">
		</div>
		<div>
			<label for="exampleInputPhone"><i class="fa-solid fa-phone"></i> Phone</label>
			<input type="number" class="form-control" id="exampleInputPhoneI"
			 aria-describedby="emailHelp" placeholder="Enter phone" required name="phone">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword"><i class="fa-solid fa-lock"></i> Password</label>
			<input type="password" class="form-control" id="exampleInputPasswordlI"
			 aria-describedby="emailHelp" placeholder="Enter password" required name="password">
		</div>
		<div class="form-group">
			<label for="exampleInputcPassword"> <i class="fa-solid fa-lock"></i> Confirm Password</label>
			<input type="password" class="form-control" id="exampleInputcPasswordlI"
			 aria-describedby="emailHelp" placeholder="Enter confirm password" required>
		</div>
		
		<div class="form-check" >
			<input type="checkbox" class="form-check-input" id="ExampleCheck1" required name="check">
			<label class="form-check-label" for="exampleCheck1">check me out</label>
		</div>
		<div class="text-center">
		<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>

</div>
</div>
</div>
</div>
</div>
<%@include file="allComponent/footer.jsp" %>
</body>
</html>