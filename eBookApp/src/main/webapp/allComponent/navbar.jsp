<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height:10px;background-color:#ad1457"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
	
	<div class="col-md-3 text-success">
	<h3><i class="fa-solid fa-book-open-reader"></i> eBooksell</h3>
	</div>
	<div class="col-md-6">
	
    <form class="d-flex" role="search" action="searchBook.jsp" method="post">
      <input class="form-control me-3" type="search" name="ch" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
	</div>
	
	 
	<c:if test="${not empty userobj }">
  		<div class="col-md-3">
  		<a href="checkout.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i>Cart</a>
		<a href="login.jsp" class="btn btn-success "><i class="fa-solid fa-right-to-bracket"></i>${userobj.name }</a>
		<a href="LogoutServlet" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> logout</a>
	</div>
  	</c:if>
	
	<c:if test="${empty userobj }">
		<div class="col-md-3">
		<a href="login.jsp" class="btn btn-success "><i class="fa-solid fa-right-to-bracket"></i>login</a>
		<a href="register.jsp" class="btn btn-primary"><i class="fa-regular fa-id-card"></i> Register</a>
	</div>
	</c:if> 
	
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
    aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="allRecentBook.jsp"><i class="fa-solid fa-book"></i> Recent Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="allNewBook.jsp"><i class="fa-solid fa-book-open-reader"></i> New Book</a>
        </li>
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="allOldBook.jsp"><i class="fa-solid fa-book-open-reader"></i> Old Book</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <a href="setting.jsp" class="btn btn-light my-1 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Setting</a>
        <button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-address-book"></i> Contect us</button>
      </form>
    </div>
  </div>
</nav>