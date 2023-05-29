<%@page import="com.entity.ADDitem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.DB.DBconn"%>
<%@page import="com.DAO.ItemDAOimpl"%>
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
	<div class="container p-5 m-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Items</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
						ADDitem b = dao.getItembyId(id);
						%>

						<form action="../edititem" method="post">
						<input type="hidden" name="id" value="<%=b.getId()%>">
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Item
									Name </label> <input type="text" id="disabledTextInput"
									class="form-control" name="iname" value="<%=b.getIname()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Item
									company </label> <input type="text" id="disabledTextInput"
									class="form-control" name="icname" value="<%=b.getIcompany()%>">
							</div>
							<div class="mb-3">
								<label for="disabledTextInput" class="form-label">Price
								</label> <input type="text" id="disabledTextInput" class="form-control"
									name="iprice" value="<%=b.getPrice()%>">
							</div>
							<div class="mb-3">
								<label for="Select" class="form-label">Item Status </label> <select
									id="Select" name="istatus" class="form-select">
									<option selected>select</option>
									<%
									if ("Active".equals(b.getIstatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}

									else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								</select>
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