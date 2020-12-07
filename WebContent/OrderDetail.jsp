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
String str1 = (String)request.getAttribute("orderdetails");
 
 
 JSONParser parser = new JSONParser();
 JSONObject json1 = (JSONObject) parser. parse(str1);

 JSONObject json = (JSONObject)json1.get("orderdetails");
 JSONArray recs = (JSONArray)json1.get("poitems");


%>
	<h1 > Order Details </h1>
	
	<br/>
		<br/>


	<div >
	
		<table cellspacing="10" cellpadding="10">

               <tr><th><h3>Order Id</h3></th><th><h3>First Name</h3></th><th><h3>Last Name</h3></th><th><h3>Status</h3></th><th><h3>Address</h3></th><th><h3>Total Cost</h3></th></tr>
				<tr style="color:blue">
					
					<td><h3><%=json.get("poid")%> </h3></td>
				
			
					<td><h3><%=json.get("firstname")%></h3> </td>
				
					<td><h3><%=json.get("lastname")%> </h3></td>
				
					<td><h3><%=json.get("status")%> </h3></td>
				
					<td><h3><%=json.get("address")%></h3> </td>
				
					<td><h3><%=json.get("grandtotal")%></h3> </td>
				</tr>
		  </table>		
	</div>
	
	<div >
	
			<table cellspacing="10" cellpadding="10">
			   <tr><th><h3>Book Id</h3></th><th><h3>Title</h3></th><th><h3>Quantity</h3></th><th><h3>Price</h3></th><th><h3>Total</h3></th></tr>
	<% 
	
	
	 for (Object o : recs) { 
		  JSONObject jsonLineItem = (JSONObject) o;
	 %>
		 
		 
				<tr style="color:blue">
					
					<td><h3><%=jsonLineItem.get("bid")  %></h3></td>
					<td><h3><%=jsonLineItem.get("title")  %></h3></td>
					<td><h3> <%=jsonLineItem.get("qty")  %></h3></td>
					<td><h3><%=jsonLineItem.get("price")  %></h3></td>
					<td><h3> <%=jsonLineItem.get("total")  %></h3></td>
					
				</tr>
				
					
				
		
	
        <%         
             }
	%>
	  </table>		
	</div>
</body>
</html>

