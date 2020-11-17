<%@page import="com.entity.User"%>
<%@page import="com.dao.EcommerceDao"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>



<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {

		session.setAttribute("msg", "You are not logged in!! Login First");
		response.sendRedirect("login");
		return;
	} else {
		if (user.getUserType().equalsIgnoreCase("normal")) {
			session.setAttribute("msg", "You are not admin!! Do not access this page");
			response.sendRedirect("login");
			return;
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>
<style>
.back{
	background-image:url(resources/images/colours.jpg);
	background-size:cover;
	}


</style>
</head>
<body class="back">
	<%@include file="./navbar.jsp"%>
	<div class="container admin">
		<div class="mt-3 alert alert-success alert-dismissible fade show"
			 role="alert">
			<strong>${form.getMessage()}</strong>
			<button type="button" class="close" data-dismiss="alert"
				  aria-label="Close">
				 <span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle"
								src="resources/images/team.png" alt="user image"
								style="max-width: 50px;">
						</div>
						<h1>${userForm.getUserList().size()}</h1>
						<h1 class="text-uppsercase text-muted">Users</h1>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle"
								src="resources/images/lists.png" alt="user image"
								style="max-width: 50px;">
						</div>
						<h1>${categoryForm.getCategoryList().size()}</h1>
						<h1 class="text-uppsercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle"
								src="resources/images/shipping.png" alt="user image"
								style="max-width: 50px;">
						</div>
					<h1>${productForm.getProductList().size()}</h1>
						<h1 class="text-uppsercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>

		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle"
								src="resources/images/keys.png" alt="user image"
								style="max-width: 50px;">
						</div>
						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppsercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle"
								src="resources/images/plus.png" alt="user image"
								style="max-width: 50px;">
						</div>
						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppsercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>
		</div>

	</div>

	<form action="productOperation" name="form" method="post" enctype= multipart/form-data >
		<!-- <!-- add category modal -->



		<div class="modal fade" id="add-category-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
						<button type="button" 
								class="close" 
								data-dismiss="modal"
							    aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<!-- Add Category form -->
						
						 <input type="hidden" 
						 		name="operate"
								value="add-category-modal">

						<div class="form-group">
							<input type="text" 
								   class="form-control" 
								   name="cateTitle"
								   placeholder="Enter Category Title...">
						</div>


						<div class="form-group">
							<textarea class="form-control"
							          name="cateDesc"
								      style="height:250px;"
								      placeholder="Enter Category Description"></textarea>
						</div>


						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
						</div>




					</div>
					<div class="modal-footer">
						<button type="button" 
						        class="btn btn-outline-info"
							   data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>



		<!-- end add category modal -->

		<!-- add product modal -->


		<!-- Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					

						<!-- ADD PRODUCT FORM  -->


						<input type="hidden" name="operate" value="add-product-modal">

						<div class="form-group">
							 <input type="text"
							        class="form-control"
							        name="prodName"
								    placeholder="Enter Product Title...">
						</div>


						<div class="form-group">
							<textarea class="form-control"
							          name="prodDesc"
								      style="height: 250px;"
								      placeholder="Enter Product Description..."></textarea>
						</div>


						<div class="form-group">   
							 <input type="number"
							        class="form-control" 
							        name="prodPrice"
								    placeholder="Enter Product Price...">
						</div>


						<div class="form-group">
							<input type="number"
							       class="form-control"
								   name="prodDiscount"
								   placeholder="Enter Product Discount...">
						</div>


						<div class="form-group">
							<input type="number" 
							       class="form-control"
							       name="prodQty"
								   placeholder="Enter Product Quantity...">
						</div>

						<!--   product category -->


						<div class="form-group">
							<select name="categoryId" id="" class="form-control">

								<c:forEach items="${categoryForm.getCategoryList()}" var="cat">


									<option value="${cat.getCategoryId()}">${cat.getCateTitle()}</option>
								</c:forEach>
							</select>
						</div>
						<br>

						<!-- product file -->

						<div class="form-group">
							<label class="text-muted" 
							       for="pPic">Select Picture of Product
							 </label><br>
							 
							  <input type="file" 
							         name="prodPic"
							         id="pPic">
						</div>


						<div class="container text-center">
							<button class=" btn btn-outline-success">Add Product</button>
						</div>

					</div>
					
					
					<div class="modal-footer">
						<button type="button"
						       class="btn btn-outline-info"
							   data-dismiss="modal">Close
					    </button>

					</div>
				</div>
			</div>
		</div>


		<!-- end product category modal -->
	</form>
<%@include file="./common_modal.jsp" %>
</body>
</html>