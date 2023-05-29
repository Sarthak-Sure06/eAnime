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
<%@include file="css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center p-3 m-5">All Items</h3>

	<c:if test="${not empty successMsg}">
		<h5 class="text-center text-success">${successMsg}</h5>
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-success table-striped p-5">
		<thead class="bg-primary">
			<tr>
				<th scope="col">S.no</th>
				<th scope="col">Image</th>
				<th scope="col">Items</th>
				<th scope="col">Item company</th>
				<th scope="col">Price</th>
				<th scope="col">Item Type</th>
				<th scope="col">Item Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
			List<ADDitem> list = dao.getallitems();
			for (ADDitem i : list) {
			%>
			<tr>
				<td><%=i.getId()%></td>
				<td><img src="../ITEM/<%=i.getIphotos()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=i.getIname()%></td>
				<td><%=i.getIcompany()%></td>
				<td><%=i.getPrice()%></td>
				<td><%=i.getItype()%></td>
				<td><%=i.getIstatus()%></td>
				<td><a href="edit.jsp?id=<%=i.getId()%>"
					class="btn btn-sm btn-primary">Edit</a> <a
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>