<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body  style="background-color:#ffcdd2">
<%@include file="allComponent/navbar.jsp" %>

<div class="container">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h5 class="text-center text-primary"> User address</h5>
<form action="" method ="post">
	
       <div class="row">
	  <div class="col">
            <label for="inputPassword4">Address</label>
            <input type="text" class="form-control" id="inputPassword4" value="<%%>">
      </div>
      </div>
      <div class="row">
        <div class="col-md-6">
           <label for="inputEmail4">Landmark</label>
             <input type="text" class="form-control" id="inputEmail4" >
      </div>
      <div class="col-md-6">
            <label for="inputPassword4">City</label>
            <input type="text" class="form-control" id="inputPassword4">
      </div>
      </div>
      <div class="row">
        <div class="col-md-6">
           <label for="inputEmail4">State</label>
             <input type="text" class="form-control" id="inputEmail4">
      </div>
      <div class="col-md-6">
            <label for="inputPassword4">Pin code</label>
            <input type="number" class="form-control" id="inputPassword4" >
        </div>
		</div>
		
		<br>
		
		<div class="text-center">
		<button type="submit" class="btn btn-warning">Add Address</button>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>