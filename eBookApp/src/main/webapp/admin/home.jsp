<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="AllCss.jsp" %>

<style type="text/css">
	a{
	
	text-decoration:none;
	color:black;
	}
	a:hover{
	
	text-decoration:none;
	color:black;
	}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<!--without login not access  -->
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
</c:if>

<div class ="container">
<div class="row">
	<div class="col-md-3">
	
	<a href="addBooks.jsp">
	<div class="card">
	 <div class="card-body">
		<i class="fa-solid fa-square-plus fa-2x"style="color: #1a20cb;"></i> <br>
		<h3>Add Books</h3>
		..............
	 </div>
	</div>
	</a>
	</div>
	
	<div class="col-md-3">
	<a href="allBooks.jsp">
	<div class="card">
	<div class="card-body">
		<i class="fa-solid fa-book fa-2x"style="color: #1a20cb;"></i> <br>
		<h3>All Books</h3>
		............
	</div>
	</div>
	</a>
	</div>
	
	<div class="col-md-3">
	<a href="orders.jsp">
	<div class="card">
	<div class="card-body">
		<i class="fa-solid fa-box-open fa-2x"style="color: #1a20cb;"></i></i> <br>
		<h3>Orders</h3>
		............
	</div>
	</div>
	</a>
	</div>
	<div class="col-md-3">
	<a data-toggle="modal" data-target="#exampleModalCenter">
	<div class="card">
	<div class="card-body">
		<i class="fa-solid fa-right-from-bracket fa-beat fa-2x" style="color: #1a20cb;"></i><br>
		<h3>Logout</h3>
		.............
	</div>
	</div>
	</a>
	</div>
</div>
</div>

<!-- logout modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
      	  <h4>do you want logout? </h4>
         <button type="button" class="btn btn-secondary" 
         data-dismiss="modal">Close</button>
        <a href="../LogoutServlet" type="button" class="btn btn-primary text-white">logout</a>
     
      </div>
       </div>
      <div class="modal-footer">
        </div>
    </div>
  </div>
</div>

<div style="margin-top:320px">
<%@include file="footer.jsp" %>
</div>

</body>
</html>