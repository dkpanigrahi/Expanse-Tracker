<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/ALL_CSS.jsp" %>
<style type="text/css">
.card{
box-shadow: 0 0 6px 0 rgba(0,0,0,0.3)

}
</style>
</head>
<body class="bg-light">
<%@include file="component/NavBar.jsp" %>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Login Page</p>
						 
							<c:if test="${not empty msg }">
							<p class="text-center text-danger">${msg }</p>
							<c:remove var="msg"/>
							</c:if>
						 
						 
						 <form action="login" method="post">
						  
						  <div class="mb-3">
						    <label  class="form-label">Enter Email</label>
						    <input type="email" class="form-control"  name="email">
						   
						  </div>
						  
						  <div class="mb-3">
						    <label  class="form-label">Enter Password</label>
						    <input type="password" class="form-control"  name="password">
						   
						  </div>
						  
						  
						  <button type="submit" class="btn btn-success col-md-12">Login</button>
						  Don't have account<a href="register.jsp">Create One</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>