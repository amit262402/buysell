<%@page import="java.util.List"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@page import="com.file.entities.bookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<%@include file="AllCss.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>

<!--without login not access  -->
<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
</c:if>

	<h3 class="text-center">Hello Admin</h3>
	
	<c:if test="${not empty succmsg }">
	<p class="text-center text-success">${succmsg } </p>
	<c:remove var="succmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedmsg }">
	<p class="text-center text-success">${failedmsg } </p>
	<c:remove var="failedmsg" scope="session"/>
	</c:if>
	
	<table class="table table-striped">
  <thead class="bg-info">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Email</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  		bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
  		List<bookDetails> list=dao.getallbook();
  		for(bookDetails b:list)
  		{%>
  	   <tr>
      <td ><%=b.getBookid() %></td>
      <td><img src="../bookname/<%=b.getPhoto() %>" style="width:50px;height:50px;"></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus() %></td>
      <td><%=b.getEmail() %></td>
       <td>
       <a href="editbook.jsp?id=<%=b.getBookid() %>" class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i>Edit</a>
       
      <a href="../delete?id=<%=b.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>Delete</a>
      </td>
    </tr>
  		<%}
  
  %>
  
  </tbody>
</table>
	<div style="margin-top:220px">
<%@include file="footer.jsp" %>
</div>

	
</body>
</html>