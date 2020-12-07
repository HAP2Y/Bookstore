<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,bean.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <script src="https://kit.fontawesome.com/b2391d128c.js" crossorigin="anonymous"></script>

    <title>Checkout</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/"/>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.min.css"
	type="text/css" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/res/form-validation.css" rel="stylesheet"/>
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
							href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
				<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
				<li class="nav-item"><a class="nav-link" 
							href="${pageContext.request.contextPath}/Login.jsp" id="login">Login</a></li>
			</ul>
		</div>
	</nav>

    <div class="container">
      <div class="py-5 text-center">
        <h2>Checkout form</h2>
        <p class="lead">Please fill out the details to confirm the order!</p>
      </div>
	
      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
          </h4>
          <form action="UpdateTotals" action="POST">
          <ul class="list-group mb-3">
          <%
// Iterating through Cart List
 
  ArrayList<CartBook>  cart = (ArrayList<CartBook>)session.getAttribute("cart");
   int i=0;
   
   int grandtotal = (Integer)session.getAttribute("grandtotal");
   for(CartBook b1:cart){
	    
	  
 
	%>
	<li class="list-group-item d-flex justify-content-between align-items-center lh-condensed">
       <div>
           <h6 class="my-0"><%=b1.getTitle()%></h6>
           <small class="text-muted"><%=b1.getBid()%></small>
           <small class="text-muted"><%=b1.getCategory()%></small>
           </div>
           <div class="my-0">
           <div class="rl-auto">
           <small>QTY</small>
           <input class="login" type="number"  name="qty<%=i%>"  value="<%=b1.getQty()%>" min="1" max="9">
              </div>
              <span class="badge badge-secondary badge-pill">$<%=b1.getPrice()%></span>
              <a href="RemoveItem?id=<%= b1.getBid()%>"><i class="fas fa-trash"></i></a>
              <a href="BookDetails?id=<%= b1.getBid()%>"><i class="fas fa-info-circle"></i></a>
              </div>
            </li>
	<%
	i++;
     
}
%>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <span>Total (CAD)</span>
              <strong>$<%=grandtotal %></strong>
            </li>
          </ul>
          </form>

        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>
          <form class="needs-validation" name="payment" action="PaymentSuccess.jsp" method= "post">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required/>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last name</label>
                <input type="text" class="form-control" id="lastName" placeholder="" value="" required/>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">Username</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" id="username" placeholder="Username" required/>
                <div class="invalid-feedback" style="width: 100%;">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="email">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" required/>
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <input type="text" class="form-control" id="address" placeholder="1234 Main St" required/>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" />
            </div>

            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">Country</label>
                <select class="custom-select d-block w-100" id="country" required>
                  <option value="">Choose...</option>
                  <option>Canada</option>
                  <option>Other</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid country.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">State</label>
                <select class="custom-select d-block w-100" id="state" required>
                  <option value="">Choose...</option>
                  <OPTION value="other"></OPTION>
                  <option value="AB">Alberta - AB</option>
        			<option value="BC">British Columbia - BC</option>
        			<option value="MB">Manitoba - MB</option>
        			<option value="NB">New Brunswick - NB</option>
        			<option value="NL">Newfoundland and Labrador - NL</option>
        			<option value="NT">Northwest Territories - NT</option>
        			<option value="NS">Nova Scotia - NS</option>
        			<option value="NU">Nunavut - NU</option>
        			<option value="ON">Ontario - ON</option>
        			<option value="PE">Prince Edward Island - PE</option>
        			<option value="QC">Quebec - QC</option>
        			<option value="SK">Saskatchewan - SK</option>
        			<option value="YT">Yukon - YT</option>
                </select>
                <div class="invalid-feedback">
                  Please provide a valid state.
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" id="zip" placeholder="" required/>
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>

            <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input"  />
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input"/>
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required/>
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required/>
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-expiration">Expiration <span class="text-muted">(MMYY)</span></label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" maxlength="4" required />
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-expiration">CVV <span class="text-muted">(eg. 123)</span></label>
                <input type="text" class="form-control" id="cc-cvv" placeholder=""  maxlength="4" required/>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>
            <button href="${pageContext.request.contextPath}/PaymentSuccess.jsp" class="btn btn-primary btn-lg btn-block" onclick="function();">Continue to checkout</button>
			</form>
        </div>
      </div>
      </div>
      
      <footer style="margin: 10px;"></footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
</body>
</html>