<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav
	class="navbar navbar-expand-lg bg-body-tertiary navbar-dark bg-dark fixed-top"
	data-bs-theme="dark">
	<div class="container-fluid" data-bs-theme="dark">
		<a class="navbar-brand " href="#" data-bs-theme="dark"> <i
			class="fa-solid fa-dragon"></i>Anime
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="Home.jsp">Home</a></li>
			</ul>
		</div>
		<div class="col-md-3">

			<c:if test="${not empty userobj}">
				<a class="btn btn-outline-success me-2"
					type="button"><i class="fa-solid fa-right-to-bracket"></i>${userobj.name}</a>
				<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					class="btn btn-outline-primary me-2" type="button"><i
					class="fa-solid fa-address-card"></i>Logout</a>>
				</c:if>

			<c:if test="${empty userobj}">
				<a href="Login.jsp" class="btn btn-outline-success me-2"
					type="button"><i class="fa-solid fa-right-to-bracket"></i>
					Login</a>
				<a href="Register.jsp" class="btn btn-outline-primary me-2"
					type="button"><i class="fa-solid fa-address-card"></i> Register</a>>
					</c:if>
		</div>
	</div>
</nav>
<!-- logout modal -->
			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">Logout</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">Do you Want to Logout</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<a href="../logout" type="button" class="btn btn-primary">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<!-- logout modal -->