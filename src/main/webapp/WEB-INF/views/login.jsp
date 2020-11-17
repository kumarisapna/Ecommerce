<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
<%@include file="./base.jsp"%>
<style>
.loginBackImg{
	background-image:url(resources/images/lightBlue.jpg);
	background-size:cover;
	}


</style>
</head>
<body class="loginBackImg">
	<%@include file="./navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="alert alert-danger alert-dismissible fade show mt-5"
					 role="alert">
					 <strong>${msg}</strong>
					 <button type="button"
					 		 class="close" 
					  		data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="card">
					<h3 class="text-dark text-center mt-3">Login Here!</h3>
					<div class="mt-2">
						<form action="loginform" method="post">
							<div class="form-group text-dark ml-4">
								<i class="fa fa-envelope icon"></i>
								<label for="exampleInputEmail1">Email address</label>
								 <input type="email" 
								 		class="form-control" 
								 		id="exampleInputEmail1"
								 		name="userEmail"
								 		aria-describedby="emailHelp"
										 placeholder="Enter email"
										 style="border-radius:1px;width:80%;"> 
								 <small id="emailHelp"
								 		class="form-text text-muted text-dark">
								  		We'll never share your email with anyone else.
								 </small>
							</div>

							<div class="form-group text-dark ml-4">
								<i class="fa fa-lock icon"></i>
								<label for="exampleInputPassword1">Password</label> 
								<input type="password" 
								 	   class="form-control"
									   id="exampleInputPassword1"
								       name="userPassword"
								       placeholder="Password"
								       style="border-radius:1px;width:80%;">
							</div>
							
							<p class="text-black d-block mb-2  text-center text-dark">
								Not a member?<a href="register.jsp">Sign up now</a>
							</p>

							<div class="container text-center">
								<button type="submit" 
										class=" mb-5 mt-2 btn btn-primary border-0">Submit</button>
										
								<button type="reset"
										class="mb-5 mt-2 btn btn-primary border-0">Reset</button>
							</div>

						</form>

					</div>


				</div>
			</div>

		</div>

	</div>
</body>
</html>