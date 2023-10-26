<%@page import="com.file.entities.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.BookOrderDaoImpl"%>
<%@page import="com.files.dao.bookDaoImpl"%>
<%@page import="com.file.entities.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<%@include file="allComponent/AllCss.jsp" %>
</head>
<body  style="background-color:#ffcdd2">

<c:if test="${empty userobj  }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="allComponent/navbar.jsp" %>

<div class="container p-2">
<h3 class="text-center text-primary">Your Order</h3>
<table class="table table-striped bg-white mt-3">
  <thead class="bg-warning">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      <th scope="col">Address</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  user u=(user) session.getAttribute("userobj");
  BookOrderDaoImpl dao=new BookOrderDaoImpl(DBconnect.getCon());
 List<BookOrder> blist=dao.getBook(u.getEmail());
  
 for(BookOrder b:blist)
 {%>
	 <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getName() %></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
      <td><%=b.getFulladd() %></td>
    </tr> 
	 
	 
<% }%>
   
  </tbody>
</table>

</div>

</body>
</html>