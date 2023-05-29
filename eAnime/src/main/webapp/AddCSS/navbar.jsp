<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav
	class="navbar navbar-expand-lg bg-body-tertiary navbar-dark bg-dark fixed-top"
	data-bs-theme="dark">
	<div class="container-fluid" data-bs-theme="dark">
		<a class="navbar-brand " href="#" data-bs-theme="dark"> <i
			class="fa-solid fa-dragon"></i>eStudios
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="index.jsp" class="nav-link active"
					aria-current="page" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Books</a></li>

				<li class="nav-item"><a class="nav-link">Anime</a></li>
			</ul>

			<div class="container-fluid">
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>

			<div class="col-md-3">



				<c:if test="${not empty userobj}">
					<a href="cart.jsp"><i class="fa-sharp fa-solid fa-cart-plus me-2"></i></a>
					<a href="Login.jsp" class="btn btn-outline-success me-2"
						type="button"><i class="fa-solid fa-right-to-bracket"></i>${userobj.name}</a>
					<a href="logout" class="btn btn-outline-primary me-2"
						type="button"><i class="fa-solid fa-address-card"></i>Logout</a>>
				</c:if>

				<c:if test="${empty userobj}">
					<a href="Login.jsp" class="btn btn-outline-success me-2"
						type="button"><i class="fa-solid fa-right-to-bracket"></i>
						Login</a>
					<a href="Register.jsp" class="btn btn-outline-primary me-2"
						type="button"><i class="fa-solid fa-address-card"></i>
						Register</a>>
					</c:if>
			</div>
		</div>
	</div>
</nav>