<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1" session="false" />
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<link href="${pageContext.request.contextPath}/res/css/login.css"
	rel="stylesheet" />
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
					href="${pageContext.request.contextPath}/Bookcat.jsp">Books</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/AddToCart.jsp">Cart</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
			</ul>
		</div>
	</nav>
	<DIV class="signin">
		<form class="form-signin" name="login" action="verifyLogin" method="post">
			<h1 class="h3 mb-3 font-weight-normal" style="color: #212121;">Please sign in</h1>
			<label for="inputUsername" class="sr-only">Username</label> 
			<input type="text" id="inputUsername" class="form-control" name="username"
				placeholder="Enter your Username"></input>
				
			<label for="inputPassword"
				class="sr-only">Password</label> 
			<input type="password" name="password"
				id="inputPassword" class="form-control" placeholder="Enter your Password"></input>
				
			<button class="btn btn-lg btn-primary btn-block" type="submit" value="submit">Sign
				in</button>
		</form>
	</DIV>
</body>
	</html>
</jsp:root>