<%@page import="com.entity.Expanse"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpanseDao"%>
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
	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	ExpanseDao dao = new ExpanseDao(HibernateUtil.getSessionFactory());
	Expanse ex = dao.getExpanseById(id);
	%>
	
	<%@include file="../component/NavBar.jsp" %>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Edit Expense</p>
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg"/>
						</c:if>
						
						<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger">${errorMsg }</p>
						<c:remove var="errorMsg"/>
						</c:if>
						
						<form action="../updateExpanse" method="post">
							<div class="mb-3">
								<lable>Title</lable>
								<input type="text" name="title" class="form-control" value="<%=ex.getTitle()%>">
							</div>
							
							<div class="mb-3">
								<lable>Date</lable>
								<input type="date" name="date" class="form-control" value="<%=ex.getDate()%>">
							</div>
							
							<div class="mb-3">
								<lable>Time</lable>
								<input type="time" name="time" class="form-control" value="<%=ex.getTime()%>">
							</div>
							
							<div class="mb-3">
								<lable>Description</lable>
								<input type="text" name="description" class="form-control" value="<%=ex.getDescription()%>">
							</div>
							
							<div class="mb-3">
								<lable>Price</lable>
								<input type="text" name="price" class="form-control" value="<%=ex.getPrice()%>">
							</div>
							
							<input type="hidden" name="id" value="<%=ex.getId()%>">
							
							<button type="submit" class="btn btn-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>