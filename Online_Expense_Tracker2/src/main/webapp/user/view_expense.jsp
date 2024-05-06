<%@page import="com.entity.Expanse"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpanseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/ALL_CSS.jsp" %>
<style type="text/css">
.card{
box-shadow: 0 0 6px 0 rgba(0,0,0,0.3)

}
</style>
</head>
<body>

	<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

<%@include file="../component/NavBar.jsp" %>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">All Expanse</p>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						</c:if>
					</div>
					<div class="card-body">
					
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">Title</th>
						      <th scope="col">Description</th>
						      <th scope="col">Date</th>
						      <th scope="col">Time</th>
						      <th scope="col">Price</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody>
						  <%
						  User user=(User)session.getAttribute("loginUser");
						  ExpanseDao dao = new ExpanseDao(HibernateUtil.getSessionFactory());
						  List<Expanse> list = dao.getAllExpanseByUser(user);
						  for(Expanse ex : list){
						  %>
						  
						    <tr>
						      <th scope="row"><%=ex.getTitle() %></th>
						      <td><%=ex.getDescription() %></td>
						      <td><%=ex.getDate() %></td>
						      <td><%=ex.getTime() %></td>
						      <td><%=ex.getPrice() %></td>
						      <td><a href="edit_expanse.jsp?id=<%=ex.getId() %>" class="btn btn-sm btn-primary me-1">Edit</a>
						      		<a href="../deleteExpanse?id=<%=ex.getId() %>" class="btn btn-sm btn-danger me-1">Delete</a></td>
						    </tr>
							<%
						  	}
							%>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>