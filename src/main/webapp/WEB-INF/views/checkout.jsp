<%@page import="com.entity.User"%>

<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {

		session.setAttribute("msg", "You are not logged in!! Login First to access checkout page");
		response.sendRedirect("login");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="./base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout Panel</title>
</head>
<body>
<%@include file="./navbar.jsp"%>


<div class="jumbotron container-fluid">
	<div class="row">
		<div class="col md-6">
		
		
		<!-- 	cart -->
			<div class="card mt-3">
				<div class="card-body">
					<h3 class="text-center mb-4">Your Selected Items</h3>
					<div class="cart-body mt-2">
					
					</div>
				</div>
			</div>
			
		
		</div>
		
		<div class="col md-6">
		
		<!-- 	Form Details -->
		
		<div class="card mt-3">
				<div class="card-body">
					<h3 class="text-center mb-4">Your Details for Order</h3>
					
					<form action="">
						<div class="form-group">
    						<label for="exampleInputEmail1">Email address</label>
    						<input type="email"
    						 name="userEmail"
    						 value="<%= user.getUserEmail()%>"  
    						 class="form-control"
    					  	 id="exampleInputEmail1" 
    					 	 aria-describedby="emailHelp"
    					 	 placeholder="Enter your email...">
    					  	 <small id="emailHelp"
    						 class="form-text text-muted">
    						 We'll never share your email with anyone else.
    						 </small>
  						</div>
  						<div class="form-group">
							<input type="text"
							 class="form-control"
							 name="userName"
							 value="<%= user.getUserName() %>"
							 placeholder="Enter your name...">
						</div>
						
						
						<div class="form-group">
							<label for="userAddress">Your Shipping  Address</label>
							<textarea class="form-control" name="userAddress" value="<%= user.getUserAddress() %>"placeholder="Enter Your Address..." style="height: 200px;"></textarea>
						</div><br>
						
						<div class="form-group">
							<input type="number"
							 class="form-control"
							 name="phonenumber"
							 placeholder="Enter Your Mobile number...">
						</div><br>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Order now</button>
							<button class="btn btn-outline-primary">Continue Shopping</button>
						</div>
						
					</form>
					</div>
				</div>
			</div>
		
		</div>
	</div>
</div>


<%@include file="./common_modal.jsp" %>
</body>
</html>