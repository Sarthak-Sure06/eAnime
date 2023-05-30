<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit profile</title>
<%@include file="AddCSS/css.jsp"%>
</head>
<body>



	<%@include file="AddCSS/navbar.jsp"%>
	<div class="container p-5 m-5">
		<div class="row g-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
						
						<c:if test="${not empty failedMsg}">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="updateprofile" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Enter
									Full Name </label> <input type="text" id="disabledTextInput"
									class="form-control" name="name" value="${userobj.name }">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email" value="${userobj.email }">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Mobile
									No. </label> <input type="text" id="disabledTextInput"
									class="form-control" name="phone" value="${userobj.phone }">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="password">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>