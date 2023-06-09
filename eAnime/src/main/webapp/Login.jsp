<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AddCSS/css.jsp"%>
</head>
<body>

	<%@include file="AddCSS/navbar.jsp"%>
	<div class="container p-5 m-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login</h4>
						
						<c:if test="${not empty failedMsg}">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I accept <a href="#"
									class="link-primary">terms & condition</a></label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="#" class="link-primary">create account</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>