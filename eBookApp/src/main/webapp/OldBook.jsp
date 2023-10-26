<%@page import="com.file.entities.bookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.file.entities.user"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Old Book</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body>
<%@include file="allComponent/navbar.jsp" %>

<c:if test="${not empty succmsg }">
	<h4 class="text-center text-danger">${succmsg }</h4>
	<c:remove var="succmsg" scope="session"/> 
</c:if>

<div class="container p-5">
<table class="table table-striped">
  <thead class="bg-warning">
    <tr>
     
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  user u=(user)session.getAttribute("userobj");
  String email=u.getEmail();
  	bookDaoImpl dao=new bookDaoImpl(DBconnect.getCon());
  	List<bookDetails> list=  dao.getBookOldByUser(email, "Old");
 	for(bookDetails b:list)
 	{%>
 		<tr>
 		
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
    	<td><%=b.getBookCategory()%></td>
      <td>
      <a href="OldBookDelete?em=<%=b.getEmail() %>&&id=<%=b.getBookid() %>" class="btn btn-sm btn-danger">remove</a>
      </td>
    </tr>
 	<%}
  	%>
  
   
  </tbody>
</table>
</div>
</body>
</html>