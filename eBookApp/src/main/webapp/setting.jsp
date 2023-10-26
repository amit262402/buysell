<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting</title>
<%@include file="allComponent/AllCss.jsp" %>
<style type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover {
	text-decoration:none
}
</style>

</head>
<body style="background-color:#ffcdd2">

<c:if test="${empty userobj  }">
<c:redirect url="login.jsp"/>
</c:if>



<%@include file="allComponent/navbar.jsp" %>

<div class="container">

	<h3 class="text-center">Hello,${userobj.name }</h3>
<div class="row p-5 ">
<div class="col-md-4">
<a href="SellBook.jsp">
<div class="card">
<div class="card-body text-center">
	<div class="text-primary">
	<i class="fa-solid fa-book fa-2x"></i>
	</div>
	<h3>Sell Old Book</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="OldBook.jsp">
<div class="card">
<div class="card-body text-center">
	<div class="text-primary">
	<i class="fa-solid fa-book fa-2x"></i>
	</div>
	<h3>Old Book</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="EditProfile.jsp">
<div class="card">
<div class="card-body text-center">
	<div class="text-primary">
	<i class="fa-solid fa-pen-to-square fa-2x"></i>
	</div>
	<h3>Edit Profile</h3>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="Order.jsp">
<div class="card">
<div class="card-body text-center">
	<div class="text-primary">
	<i class="fa-solid fa-box-open fa-2x"></i>
	</div>
	<h3> My Order</h3>
	<h6>Track your Order</h6>
</div>
</div>
</a>
</div>
<div class="col-md-6 mt-3">
<a href="HelpLine.jsp">
<div class="card">
<div class="card-body text-center">
	<div class="text-primary">
	<i class="fa-solid fa-user fa-2x"></i>
	</div>
	<h3>Help Center</h3>
	<h6>24*7 Service</h6>
</div>
</div>
</a>
</div>

</div>
</div>

</body>
</html>