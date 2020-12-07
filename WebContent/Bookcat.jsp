<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,bean.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/Style.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/Login.js">
	;
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/mdb.min.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/jquery.min.js">
	;
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/bootstrap.min.js">
	;
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/mdb.min.js">
	;
</script>
</head>

<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
		<a class="navbar-brand" href="MainPage.jspx">BookStore</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample06" aria-controls="navbarsExample06"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample06">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">About<span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/AddToCart.jsp">Cart</a></li>
				
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
					
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>
					
			</ul>
		</div>
	</nav>

	<section class="mb-4"
		style="width: 70%;margin-left: 5%;margin-top: 5%;">
	<h2 class="h1-responsive font-weight-bold my-4" style="color: #838391;">Search
		Books by Category</h2>
	<div class="row">
		<div class="col-md-9 mb-md-0 mb-5">
			<form action="BookStore">
				<div class="form-row align-items-center">
					<div class="col-auto my-1">
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
						<select class="custom-select mr-sm-2 register" name="category" id="category">
							<option selected>Choose...</option>
							<option value="all">ALL BOOKS</option>
							<option value="science">Science</option>
							<option value="fiction">Fiction</option>
							<option value="engineering">Engineering</option>
						</select>
					</div>
					<div class="col-auto my-1">
						<button type="submit" class="btn btn-primary" name="submit"
								value="Submit">Submit</button>
					</div>
				</div>
			</form>
			<div class="status"></div>
		</div>
	</div>

	</section>
</body>
</html>
</body>
</html>