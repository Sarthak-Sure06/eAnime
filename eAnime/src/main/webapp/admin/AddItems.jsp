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
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>
	<div class="container p-5 m-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Items</h4>


						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../AddItems" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Item
									Name </label> <input type="text" id="disabledTextInput"
									class="form-control" name="iname">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Item
									company </label> <input type="text" id="disabledTextInput"
									class="form-control" name="icname">
							</div>
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Price
								</label> <input type="text" id="disabledTextInput" class="form-control"
									name="iprice">
							</div>
							<div class="mb-3">
								<label for="Select" class="form-label">Item Type</label> <select
									id="Select" name="itype" class="form-select">
									<option selected>select</option>
									<option value="Item1">Item1</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="Select" class="form-label">Item Status </label> <select
									id="Select" name="istatus" class="form-select">
									<option selected>select</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="formFileMultiple" class="form-label">Upload
									photos</label> <input class="form-control" type="file" name="ipic"
									id="formFileMultiple" multiple>
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>