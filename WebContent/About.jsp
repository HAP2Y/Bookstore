<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=ISO-8859-1" 
		pageEncoding="ISO-8859-1" session="false"/>
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<TITLE>About</TITLE>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/About.css"
	type="text/css" />
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
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/Bookcat.jsp">Books</a></li>
					
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>
					
			</ul>
		</div>
	</nav>

<div class="about-section" style="color: white; background-color: #757575;">
  <h1 style="color: white;">About Us Page</h1>
  <p>EECS4413 BookStore Project, York University.</p>
</div>

<h2 style="text-align:center; margin-top: 15px;">Our Team</h2>
<div class="row d-flex justify-content-center" style="text-align: center;">
  <div class="column">
    <div class="card">
      <div class="container">
        <h2>Dhruv Ukani</h2>
        <p class="title">216821902</p>
        <p>YorkU Student</p>
        <p>dhruv281@my.yorku.ca</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <div class="container">
        <h2>Happy Patel</h2>
        <p class="title">216829038</p>
        <p>YorkU Student.</p>
        <p>happyp10@my.yorku.ca</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
</jsp:root>