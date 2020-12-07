<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
					
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Register.jspx">Register</a></li>
			</ul>
		</div>
	</nav>
  <br/>
  <br/>
<div class="body">
	
	<center><div class="container admin"><h1 style='color:green'>Please Enter Username and Password</h1></div></center>
		<center><form name="form" action="PaymentLogin" method="post" class="well form-horizontal">
		<br>
 <div class="form-group">
  <label class="col-md-4 control-label">Username</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input  name="username" placeholder="Username" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
  <input name="password"  placeholder="Password" class="form-control"  type="text">
    </div>
  </div>
</div>

	
		
		
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
				<input onclick="return IsEmpty();" type="submit" value="Login"></input>
    <br/>
        <br/>
    
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    
    Do not have a Login? <a href="${pageContext.request.contextPath}/Register.jspx" class="btn btn-primary">Signup</a>

  </div>
</div>

</form>
	<script language="Javascript">
		  function IsEmpty() {
			  if (document.forms['form'].username.value ==="") {
			    alert("Please enter a username");
			    return false;
			  }
			  if (document.forms['form'].password.value ==="") {
				    alert("Please enter a password");
				    return false;
			  }
			  return true;
			}
		  </script>
</center>
</div>
</body>