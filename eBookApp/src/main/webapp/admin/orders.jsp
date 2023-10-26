<%@page import="com.file.entities.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.file.DB.DBconnect"%>
<%@page import="com.files.dao.BookOrderDaoImpl"%>
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

<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped">
  <thead class="bg-info">
    <tr>
      <th scope="col">Order-id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Ph no.</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      
    </tr>
  </thead>

  <tbody>
  
    <%
  	BookOrderDaoImpl dao=new  BookOrderDaoImpl(DBconnect.getCon());
List<BookOrder> blist=  dao.allOrderBook();

for(BookOrder b:blist)
{%>
	<tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhone() %></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
      
    </tr>
	
<%}
  %>
  
  
  </tbody>
</table>
	
	<div style="margin-top:250px">
         <%@include file="footer.jsp" %>
   </div>
	
</body>
</html>