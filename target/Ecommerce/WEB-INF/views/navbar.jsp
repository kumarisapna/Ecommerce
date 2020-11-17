<%@page import="com.entity.User"%>
<%
User user1 =(User)session.getAttribute("currentUser");

%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container">
	
		<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> -->
		<ul class="navbar-nav mx-lg-auto">
			
 			<form class="form-inline">
 			
 				<div class="input-group">
 				<a class="navbar-brand font-italic" href="index" style="font-size:30px;">Fashion</a>
 					<div>
   		 				<input class="form-control my-2" type="search" placeholder="Search your products..." aria-label="Search">
   		 			</div>
 						<button class="btn btn-warning my-2 mx-sm-0" type="submit"><i class="fa fa-search"></i></button>
 				</div>
 			
    		</form>
    		
    	</ul>
    	
    	<ul class="navbar-nav">
    		<li class="nav-item active"><a class="nav-link" href="#"data-toggle="modal"data-target="#cart"><i class = "fa fa-cart-plus" style="font-size:35px;color:#ff7961;"></i><span class="cart-items" style="font-size:23px;">(0)</span></a>
			
			</li>
    			<%
				
        		if(user1==null){
        			
        		%>
				<li class="nav-item active" style="font-size:25px;"><a class="nav-link" href="login">Login</a>
				</li>

				<li class="nav-item active" style="font-size:25px;"><a class="nav-link" href="register">Register</a>
				</li>
				<%
        		}else{
        	%>
				<li class="nav-item active"><a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin" : "normal" %>"><%=user1.getUserName() %></a>
				</li>

				<li class="nav-item active"><a class="nav-link" href="logout">Logout</a>
				</li>

				<%
        		}
        	%>
		</ul>
  	
  	</div>
</nav>


