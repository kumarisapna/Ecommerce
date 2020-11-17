<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>


<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	<div class="container">
		<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
 -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item active" style="font-size:23px;">
				<a class="nav-link" href="index">Home</a>
				</li>

				<li class="nav-item dropdown " style="font-size:23px;">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-toggle="dropdown" role="button"  aria-haspopup="true"aria-expanded="false"> Categories </a>
					
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">
						
							<c:forEach items="${form.getCategoryList()}" var="cats">
						
							<a class="dropdown-item" href="index?category=${cats.getCategoryId()}">${cats.getCateTitle()}</a>
							
							</c:forEach>
							
						</a>

					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>

</body>
</html>