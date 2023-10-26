<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
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
<h5 class="text-center text-primary"> Sell Old Book</h5>

	<c:if test="${not empty succmsg }">
	<p class="text-center text-success">${succmsg } </p>
	<c:remove var="succmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedmsg }">
	<p class="text-center text-success">${failedmsg } </p>
	<c:remove var="failedmsg" scope="session"/>
	</c:if>

<form action="AddOldBookServet" method ="post" 
	enctype="multipart/form-data">
	
	<input type="hidden" value="${userobj.email}" name="user">
	
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
			<label for="exampleInputcPassword"> <i class="fa-solid fa-upload"></i> Upload Photo</label>
			<input class="form-control"type="file" id="exampleInputPhoneI" name="upload">
		</div>
		
		<br>
		
		<div class="text-center">
		<button type="submit" class="btn btn-primary">Sell</button>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>