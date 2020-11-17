<%-- <%@page import="com.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Product"%>
<%@page import="com.helper.Helper"%> --%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="./base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>

<body>

	<%@include file="./navbar.jsp"%>
	<%@include file="./List.jsp"%>
	<div class="container-fluid mt-1">
		<img class="ml-4" src="resources/images/sales.jpg"
			style="width: auto;">
	</div>

	<div class="container-fluid">
		<form name="form" method="get">
			<div class="row mt-2">
				<c:forEach items="${form.getProductList()}" var="pro">
					<div class="col-3">
						
							<div class="card product-card mt-2 mb-3">
								<div class="container text-center">
									<img class="card-img-top m-4"
										style="max-height:80px;width:auto;"
										src="data:image/jpg;base64,${pro.base64Image}"/>
								</div>
								
								<div class="card-body">
									<h5 class="card-title">${pro.getProdName()}</h5>
									<p class="card-text text-truncate">${pro.getProdDesc()}</p>
								</div>
								
								<div class="card-footer">
									<button class="btn custom text-white btn-block"
										onclick="add_to_cart(${pro.getProdId()},'${pro.getProdName()}',${pro.getProdPriceAfterDisc()})">ADD
										TO CART
									</button>
									
									<button class="btn btn-outline-success btn-block">
										&#x20B9; ${pro.getProdPriceAfterDisc()}/-<span
										class="text-dark discount-label">&#x20B9;${pro.getProdPrice()}</span><span
										class="text-info">${pro.getProdDiscount()}% off</span>
									</button>
								</div>  
							</div>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>

	


	<%@include file="./common_modal.jsp"%>
</body>
</html>
