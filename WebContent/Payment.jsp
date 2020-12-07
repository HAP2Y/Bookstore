<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<% 

 int grandtotal = (Integer)session.getAttribute("grandtotal");

%>
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
		<h2 style="padding-left:50px"><u> Payment </u></h2>

		<div class = "registration-content">
			<form name="payment" action="PaymentSuccess.jsp" method= "post">
				<table >
					<tr>
						<td ><h3 style="padding-left:100px" class="info"> Credit Card Number </h3></td>
						<td><input id="creditcard" class="form-control login" name="creditcard" type="text" placeholder="Creditcard"> </input></td>
					</tr>
					<tr>
						<td><h3 style="padding-left:100px" class="info"> Enter your Address</h3></td>
						<td><input class="form-control login" name="address" type="text" placeholder="Address"> </input></td>
					</tr>
					<tr>
						<td><h3 style="padding-left:100px" class="info"> Grand Total</h3></td>
						<td><input class="form-control login" name="grandtotal" type="text" value="<%=grandtotal %>"> </input></td>
					</tr>
				
						</table>
					<tr>
						<td> <input onclick="return IsEmptycredit();" type="submit" value="Submit"></input></td>
					</tr>
		</form>	
		
		  <script language="Javascript">
		  function IsEmptycredit() {
			  if (document.forms['payment'].creditcard.value ==="") {
			    alert("Please enter a creditcard number");
			    return false;
			  }
			  if (document.forms['payment'].address.value ==="") {
				    alert("Please enter an address");
				    return false;
			  }
			  return true;
			}
  </script>

	</div>
</body>
</html>