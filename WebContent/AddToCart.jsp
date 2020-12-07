<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*,bean.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Details</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/Style.css"
	type="text/css" />
<script src="https://kit.fontawesome.com/b2391d128c.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/Login.js">;</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/mdb.min.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/jquery.min.js">;</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/bootstrap.min.js">;</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/Javascript/mdb.min.js">;</script>
</head>
<body>
	<!-- Navbar -->
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
				href="${pageContext.request.contextPath}/Bookcat.jsp">Continue Shopping!!</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>

			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>

		</ul>
	</div>
	</nav>
	<br />
	<br />
	<section class="pt-5 pb-5">
	<form action="UpdateTotals" action="POST">
	<div class="container">
	
		<div class="row w-100">
			<div class="col-lg-12 col-md-12 col-12">
				<h3 class="display-5 mb-2 text-center">Shopping Cart</h3>
				<p class="mb-5 text-center">
					<i class="text-info font-weight-bold">Please click on the update totals after every change you make.</i>
				</p>
				
				<table id="shoppingCart"
					class="table table-condensed table-responsive">
					<thead>
						<tr>
							<th style="width: 60%">Product</th>
							<th style="width: 12%">Price</th>
							<th style="width: 10%">Quantity</th>
							<th style="width: 16%"></th>
						</tr>
					</thead>
<%
// Iterating through Cart List
 
  ArrayList<CartBook>  cart = (ArrayList<CartBook>)session.getAttribute("cart");
   int i=0;
   
   int grandtotal = (Integer)session.getAttribute("grandtotal");
   for(CartBook b1:cart){
	    
	  
 
%>
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-md-3 text-left mt-sm-2">
										<h4><%=b1.getTitle()%></h4>
										<p class="font-weight-light"><%=b1.getBid()%> | <%=b1.getCategory()%></p>
									</div>
								</div>
							</td>
							<td data-th="Price">C$ <%=b1.getPrice()%></td>
							<td data-th="Quantity"><input type="number" name="qty<%=i%>"
								class="form-control form-control-lg text-center" value="<%=b1.getQty()%>">
							</td>
							<td class="actions" data-th="">
								<div class="text-right">
									<a href="RemoveItem?id=<%= b1.getBid()%>"><i class="fas fa-trash"></i></a>
									<a href="BookDetails?id=<%= b1.getBid()%>"><i class="fas fa-info-circle"></i></a>
								</div>
							</td>
						</tr>
						
					</tbody>
					<%
	i++;
     
}
%>
				</table>
				
				<div class="float-right text-right">
					<h4>Subtotal:</h4>
					<h1 style="color: #212121;">C$ <%=grandtotal %></h1>
				</div>
				
			</div>
		</div>
		<div class="row mt-4 d-flex">
			<div class="col order-md-2 text-right">
				<button href="catalog.html" class="btn btn-primary mb-4 btn-lg pl-5 pr-5" type="submit" name="PAYMENT">Checkout</button>
			</div>
			<div >
			<button href="#" class="btn btn-primary mb-4 btn-lg pl-5 pr-5" type="submit" name="UPDATE">Update Totals</button>
			</div>
		</div>
		
	</div>
	</form>
	</section>
</body>
</html>