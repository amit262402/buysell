<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebook Login</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body style="background-color:#ffcdd2">
<%@include file="allComponent/navbar.jsp" %>
<div class="container p-4">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h3 class="text-center"><i class="fa-solid fa-right-to-bracket"></i> Login</h3>

<c:if test="${not empty failedmsg }">
	<h4 class="text-center text-success">${failedmsg }</h4>
	<c:remove var="failedmsg" scope="session"/> 
</c:if>
<c:if test="${not empty succmsg }">
	<h4 class="text-center text-danger">${succmsg }</h4>
	<c:remove var="succmsg" scope="session"/> 
</c:if>


	<form action="loginServlet" method ="post">
	
		<div class="form-group">
			<label for="exampleInputEmail"><i class="fa-solid fa-envelope"></i> Email</label>
			<input type="email" class="form-control" id="exampleInputEmailI"
			 aria-describedby="emailHelp" required name="email">
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword"><i class="fa-solid fa-lock"></i> Password</label>
			<input type="password" class="form-control" id="exampleInputPasswordlI"
			 aria-describedby="emailHelp"required name="password">
		</div>
		<div class="text-center p-2">
		<button type="submit" class="btn btn-primary">Login</button><br>
		<a href="register.jsp">create Account</a>
	    </div>
	</form>

</div>
</div>
</div>
</div>
</div><br><br><br><br><br>




<%@include file="allComponent/footer.jsp" %>
</body>
</html>