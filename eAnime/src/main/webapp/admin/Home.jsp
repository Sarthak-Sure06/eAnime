<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="css.jsp"%>
<style type="text/css">

a{
text-decoration: none;
color:black;
}
a:hover{
text-decoration:none;
color : pink;
}

</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row p-5 m-5">
			<div class="col-md-3">
				<a href="AddItems.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x"></i>
							<h4>Add Items</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="AllItems.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x"></i>
							<h4>All Items</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x"></i>
							<h4>Orders</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x"></i>
							<h4>Logout</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

</body>
</html>