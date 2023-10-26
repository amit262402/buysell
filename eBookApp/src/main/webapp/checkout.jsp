<%@page import="com.file.entities.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.file.entities.user"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.cartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body style="background-color:#ffcdd2">
<%@include file="allComponent/navbar.jsp" %>


<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succmsg }">
	<div class="alert alert-success" role="alert">
  ${succmsg }
</div>
<c:remove var="succmsg" scope="session" />
</c:if>

<c:if test="${not empty failedmsg }">
	<div class="alert alert-danger text-center" role="alert">
   ${failedmsg }
</div>
<c:remove var="failedmsg" scope="session" />
</c:if>

<div class="container">
<div class="row p-2">
<div class="col-md-6">


<div class="cart bg-white">
<h3 class="text-center text-success">Your select item</h3>
<div class="card-body">
	<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  user u=(user)session.getAttribute("userobj");
  cartDaoImpl dao1=new cartDaoImpl(DBconnect.getCon());
  List<Cart> cart= dao1.getBookByUser(u.getId());
 double totalPrice=0;
  for(Cart c: cart)
  {
  totalPrice=c.getTotalprice();
  %>
	 <tr>
      <th scope="row"><%=c.getBookname()%></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td>
      <a href="RemoveBookServlet?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid() %> " class="btn btn-sm btn-danger">Remove</a>
      </td>
      
    </tr>  
 <%}
  
  %>
  <tr>
      
      <td style="background-color:yellow">Total Price</td>
      <td></td>
      <td></td>
      <td ><%=totalPrice %></td>
    </tr>  
   
    
  </tbody>
</table>
</div>
</div>
</div>

<div class="col-md-6">
<div class="card">
<div class="card-body">
 
<h3 class="text-center text-success"> your Details Orders</h3>
<form action="orderServlet" method="post">
<input type="hidden" value="${userobj.id }" name="id">
	<div class="row">
        <div class="col">
           <label for="inputEmail4">Name</label>
             <input type="text" class="form-control" id="inputEmail4" value="<%=u.getName()%>" name="name" readonly="readonly" required="required">
       </div>
       <div class="col">
            <label for="inputPassword4">Email</label>
            <input type="email" class="form-control" id="inputPassword4" value="<%=u.getEmail()%>"name="email" readonly="readonly" required="required">
      </div>
      </div>
      <div class="row">
        <div class="col">
           <label for="inputEmail4">Mobile no.</label>
             <input type="number" class="form-control" id="inputEmail4" name="phone" value="<%=u.getPhone()%>"required="required" >
      </div>
      <div class="col">
            <label for="inputPassword4">Address</label>
            <input type="text" class="form-control" id="inputPassword4" name="address" required="required" >
      </div>
      </div>
      <div class="row">
        <div class="col-md-6">
           <label for="inputEmail4">Landmark</label>
             <input type="text" class="form-control" id="inputEmail4" name="landmark" required="required">
      </div>
      <div class="col-md-6">
            <label for="inputPassword4">City</label>
            <input type="text" class="form-control" id="inputPassword4" name="city" required="required">
      </div>
      </div>
      <div class="row">
        <div class="col-md-6">
           <label for="inputEmail4">State</label>
             <input type="text" class="form-control" id="inputEmail4" name="state" required="required">
      </div>
      <div class="col-md-6">
            <label for="inputPassword4">Pin code</label>
            <input type="text" class="form-control" id="inputPassword4" name="pincode" required="required">
      </div>
      </div>
      <div class="form-group">
      <label> Payment Mode</label>
      <select class="form-control" name="payment" required="required">
      <option value="noselect">---Select---</option>
      <option value="COD">cash on Delivery</option>
      	</select>
      </div>
      <br>
      <div class="text-center">
	 <button type="submit" class="btn btn-warning">Order Now</button>
	 <a href="index.jsp" class="btn btn-success">Continue Shopping..</a>
	</div>
</form>
</div>
</div>
</div>

</div>
</div>

</body>
</html>