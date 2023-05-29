<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<h3 class="text-center p-3 m-5">All Items</h3>

	<table class="table table-success table-striped p-5">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone no.</th>
				<th scope="col">Item Name</th>
				<th scope="col">Item type</th>
				<th scope="col">Item Company</th>
				<th scope="col">Item Price</th>
				<th scope="col">Payment</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td>@mdo</td>
				<td><a class="btn btn-sm btn-primary">Edit</a> <a
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>