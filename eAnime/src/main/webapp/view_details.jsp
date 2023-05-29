<%@page import="com.entity.User"%>
<%@page import="com.entity.ADDitem"%>
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
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: red;
}
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: Yellow;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>
</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%-- 
	<c:if test="${not empty success}">
		<div id="toast">${success}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="success" scope="session"/>
	</c:if>
--%>
	<%@include file="AddCSS/navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
	ADDitem i = dao.getItembyId(id);
	%>

	<div class="container p-3 m-5">
		<div class="row">
			<div class="col-md-6 text-center p-5 border">

				<img alt="" src="images/0.jpg" style="width: 200px; height: 200px;"
					class="img-thumblin">

			</div>

			<div class="col-md-6 p-5 border ">

				<div class="row">
					<h4 class="mt-3"><%=i.getIname()%></h4>
					<h5 class="mt-1">
						<%=i.getIcompany()%>
					</h5>
				</div>

				<hr class="solid">

				<div class="row">
					<h4>
						<a href="" class="mt-3"><i
							class="fa-solid fa-indian-rupee-sign"> </i><%=i.getPrice()%></a>
					</h4>
				</div>
				<%
				if (u == null) {
				%>
				<a href="Login.jsp" class="btn btn-primary"> <span>Add to
						cart</span></a>
				<%
				} else {
				%>
				<a href="cart?tid=<%=i.getId()%>&&uid=<%=u.getId()%>"
					class="btn btn-primary"> <span>Add to cart</span>
				</a>
				<%
				}
				%>

				<hr class="solid">

				<div class="row">

					<div class="col-md -4 text-center">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free delivery</p>
					</div>

					<div class="col-md -4 text-center">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>10 days return/replacement</p>
					</div>
					<div class="col-md -4 text-center">
						<i class="fa-solid fa-star fa-2x"></i>
						<p>Top Brands</p>
					</div>

					<div class="col-md -4 text-center">
						<i class="fa-solid fa-shield fa-2x"></i>
						<p>1 year Warranty</p>
					</div>
					<div class="col-md -4 text-center">
						<i class="fa-solid fa-file-shield fa-2x"></i>
						<p>Secure Transaction</p>
					</div>
					<hr class="solid">

				</div>
			</div>
		</div>
	</div>

</body>
</html>