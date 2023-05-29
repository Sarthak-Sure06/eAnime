<%@page import="com.entity.ADDitem"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconn"%>
<%@page import="com.DAO.ItemDAOimpl"%>
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
<style type="text/css">
/* .b-img {
	background: url("images/0.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
} */
</style>

</head>
<body
	style="background-image: linear-gradient(to bottom, #61e7ff, #92ecfa, #b8f1f8, #d9f5f7, #f7f9f9);">

	<%@include file="AddCSS/navbar.jsp"%>
	<%@include file="AddCSS/caraousal.jsp"%>

	<div class="container m-5 p-5">

		<div class="row">


			<%
			ItemDAOimpl dao2 = new ItemDAOimpl(DBconn.getConn());
			List<ADDitem> list2 = dao2.getItems();
			for (ADDitem i : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 24rem; height: 27rem;">
					<div class="card-body text-center">
						+
						<div class="container-fluid">
							<h5 class="text-center">Our Recent Items</h5>
							<img alt="" src="ITEM/<%=i.getIphotos()%>"
								style="width: 200px; height: 200px;" class="img-thumblin">
							<p>.</p>
							<div class="d-grid gap-2 d-md-block"
								style="position: absolute; bottom: 2%; right: 75%;">
								<a href="seeall_recent.jsp"
									class="btn btn-outline-info btn-sm ml-5">see more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>


	<div class="container">
		<h2 class="text-center">Our Newest Items</h2>
		<div class="row">

			<%
			ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
			List<ADDitem> list = dao.getItems();
			for (ADDitem i : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h5>Upto 50% off on | One Piece Merchandise</h5>
						<img alt="" src="ITEM/<%=i.getIphotos()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p>.</p>
						<div class="d-grid gap-2 d-md-block">
							<a href="" class="btn btn-outline-info btn-sm ml-5">see more</a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>

	<div class="card-footer text-body-secondary text-center">2 days
		ago</div>


</body>
</html>