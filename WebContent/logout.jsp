<!-- This page simply removes session attributes -->
<%
session.invalidate();
%>

<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/Style.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/res/Javascript/Login.js">;</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/mdb.min.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/res/Javascript/jquery.min.js">;</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/Javascript/bootstrap.min.js">;</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/Javascript/mdb.min.js">;</script>
</head>

<body>
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark"> <a
		class="navbar-brand" href="MainPage.jspx">BookStore</a>
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
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>
		</ul>
	</div>
	</nav>
  <br/>
  <br/>
    <br/>
  <br/>
  
<h1> <center> You have successfully logged out </center></h1>

</body>