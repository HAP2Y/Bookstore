<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="org.json.simple.parser.*,org.json.simple.*" 
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
				<c:choose>
					<c:when test="${loggedIn}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
  <br/>
  <br/>
<% 
String str1 = (String)request.getAttribute("bookdetails");
 
 
 JSONParser parser = new JSONParser();
 JSONObject json = (JSONObject) parser. parse(str1);


%>

	<h1 > <center> Book Details </center></h1>
	<br/>
	<br/>
	<br/>

	<div> <center>
	
			<table>
				<tr>
					<td><h3 class="info" style="padding-right: 50px"> Book Id </h3></td>
					<td><input style="width:200px" name="firstname" type="text" value=<%=json.get("bid")%>> </td>
				</tr>
				<tr>
					<td><h3 class="info" style="padding-right: 50px"> Book Title</h3></td>
					<td><input style="width:200px" name="firstname" type="text" value=<%=json.get("title")%>> </td>
				</tr>
				<tr>
					<td><h3 class="info" style="padding-right: 50px"> Book Category</h3></td>
					<td><input style="width:200px" name="firstname" type="text" value=<%=json.get("category")%>> </td>
				</tr>
				<tr>
					<td><h3 class="info" style="padding-right: 50px"> Book Price </h3></td>
					<td><input style="width:200px" name="firstname" type="text" value=<%=json.get("price")%>> </td>
				</tr>
		  </table>	
		  </center>	
	</div>
</body>
</html>

