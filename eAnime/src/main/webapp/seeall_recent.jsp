<%@page import="com.entity.User"%>
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
<body
	style="background-image: linear-gradient(to bottom, #61e7ff, #92ecfa, #b8f1f8, #d9f5f7, #f7f9f9);">

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
	<%@include file="AddCSS/navbar.jsp"%>


	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container m-2 mt-5 p-5">

		<div class="row">
			<%
			ItemDAOimpl dao2 = new ItemDAOimpl(DBconn.getConn());
			List<ADDitem> list2 = dao2.allRecentItem();
			for (ADDitem i : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem; height: 16rem;">
					<div class="card-body text-center">
						<div class="container-fluid">

							<a href="view_details.jsp?id=<%=i.getId()%>"><img alt=""
								src="ITEM/<%=i.getIphotos()%>"
								style="width: 160px; height: 200px;" class="img-thumblin p-2"></a>
							<a href="view_details.jsp?id=<%=i.getId()%>"><%=i.getIname()%></a>
							<br>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

	<%@include file="AddCSS/footer.jsp"%>







</body>
</html>