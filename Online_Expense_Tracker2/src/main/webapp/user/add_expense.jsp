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
<body class="bg-light">
	
	<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="../component/NavBar.jsp" %>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Add Expense</p>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						</c:if>
						
						<form action="../saveExpanse" method="post">
							<div class="mb-3">
								<lable>Title</lable>
								<input type="text" name="title" class="form-control">
							</div>
							
							<div class="mb-3">
								<lable>Date</lable>
								<input type="date" name="date" class="form-control">
							</div>
							
							<div class="mb-3">
								<lable>Time</lable>
								<input type="time" name="time" class="form-control">
							</div>
							
							<div class="mb-3">
								<lable>Description</lable>
								<input type="text" name="description" class="form-control">
							</div>
							
							<div class="mb-3">
								<lable>Price</lable>
								<input type="text" name="price" class="form-control">
							</div>
							
							<button type="submit" class="btn btn-success col-md-12">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>