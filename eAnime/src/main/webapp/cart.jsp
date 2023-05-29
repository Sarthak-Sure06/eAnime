<%@page import="java.util.List"%>
<%@page import="com.entity.cartitem"%>
<%@page import="com.DB.DBconn"%>
<%@page import="com.DAO.cartDAOimpl"%>
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
</head>
<body>
	<%@include file="AddCSS/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>

	


	<div class="container m-5 p-5">
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session"/>
	</c:if>
		<div class="row">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">YOUR CART</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Product name</th>
									<th scope="col">Company</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								cartDAOimpl dao = new cartDAOimpl(DBconn.getConn());
								List<cartitem> a = dao.getItembyUser(u.getId());
								double totalprice = 0;
								for (cartitem c : a) {
									totalprice = c.getTotal();
								%>
								<tr>
									<th scope="row"><%=c.getItem()%></th>
									<td><%=c.getCompany()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_cart?tid=<%=c.getTid()%> && uid=<%=c.getUid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalprice%></td>
								</tr>
								</tbody>
						</table>
					</div>
				</div>
			</div>




			<div class="col-md-6">

				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">YOUR DETAILS</h3>

						<form class="row g-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Name</label> <input
									type="text" class="form-control" id="inputEmail4" value="<%=u.getName()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputEmail4" value="<%=u.getEmail()%>" readonly="readonly">
							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>
							<div class="col-12">
								<label for="inputAddress2" class="form-label">Phone
									Number</label> <input type="text" class="form-control"
									id="inputAddress2" placeholder="mobile" value="<%= u.getPhone()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="inputCity" class="form-label">City</label> <input
									type="text" class="form-control" id="inputCity">
							</div>
							<div class="col-md-4">
								<label for="inputState" class="form-label">State</label> <select
									id="inputState" class="form-select">
									<option selected>Choose...</option>
									<option>...</option>
								</select>
							</div>
							<div class="col-md-2">
								<label for="inputZip" class="form-label">Zip</label> <input
									type="text" class="form-control" id="inputZip">
							</div>
							<div class="form-group">
								<label for="inputState" class="form-label">Payment Mode</label>
								<select id="inputState" class="form-control">
									<option selected>Choose...</option>
									<option>Cash on Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<a href="Login.jsp" class="btn btn-outline-warning me-2"
									type="button"><i class="fa-solid fa-right-to-bracket"></i>
									Order Now</a> <a href="Register.jsp"
									class="btn btn-outline-primary me-2" type="button"><i
									class="fa-solid fa-address-card"></i> Continue Shopping</a>
							</div>

						</form>


					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>