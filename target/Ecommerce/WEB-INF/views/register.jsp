<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="./base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
<style>
.backImage{
	background-image:url(resources/images/computer.jpg);
	background-size:cover;
	}


</style>
</head>
<body class="backImage">
	<%@include file="./navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-5 mb-5">
			<div class="col-md-4 offset-md-4">
			<div class="ml-5 alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong>${message}</strong>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
				<div class="card" style="width: 28rem;">
					<div class="card-body">

						
						<h3 class="text-center my-3">Sign Up Here!!</h3>

						<form action="processform" method="post">
							<div class="form-group">
								<label for="userName">User Name</label> <input type="text"
									class="form-control" id="userName" name="userName"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>

							<div class="form-group">
								<label for="userEmail">User Email</label> <input type="email"
									class="form-control" id="userEmail" name="userEmail"
									aria-describedby="emailHelp" placeholder="Enter Email">
							</div>

							<div class="form-group">
								<label for="userPassword">User Password</label> <input
									type="password" class="form-control" id="userPassword"
									name="userPassword" aria-describedby="emailHelp"
									placeholder="Enter Password">
							</div>

							<div class="form-group">
								<label for="userPhone">User Phone</label> <input type="number"
									class="form-control" id="userPhone" name="userPhone"
									aria-describedby="emailHelp" placeholder="Enter Phone Number">
							</div>

							<div class="form-group">
								<label for="userAddress">User Address</label>
								<textarea class="form-control" name="userAddress"
									placeholder="Enter Your Address" style="height: 200px;">
   			 	
   			 					</textarea>

							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>

								<button class="btn btn-outline-warning">Reset</button>
							</div>

						</form>

					</div>
				</div>

			</div>
		</div>

	</div>
</body>
</html>