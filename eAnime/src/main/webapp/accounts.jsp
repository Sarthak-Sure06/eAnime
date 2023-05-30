<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="AddCSS/css.jsp"%>
<style type="text/css">
/* .b-img {
	background: url("images/0.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
} */
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body>


	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>


	<%@include file="AddCSS/navbar.jsp"%>


	<div class="container m-5 p-5">


		<h3 class="text-center">Hello ${userobj.name}</h3>
	
		
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<div class="col">
				<a href="">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-boxes-packing fa-2x"></i>
							</div>
							<h3>My Orders</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col">
				<a href="edit_profile.jsp">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-shield-halved fa-2x"></i></i>
							</div>
							<h3>Login & Security</h3>
							<p>Edit Profile</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col">
				<a href="user_addr.jsp">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-2x"></i>
							</div>
							<h3>Your Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col">
				<a href="">
					<div class="card">

						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-user fa-2x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>


</body>
</html>