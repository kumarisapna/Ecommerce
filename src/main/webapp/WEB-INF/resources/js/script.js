

function add_to_cart(prodId,prodName,prodPrice)
	{
		
	//no cart is available
	
		let cart = localStorage.getItem("cart");
		if(cart==null){
			
			let products =[];
			let product = {
							productId :prodId,
							productName :prodName,
							productPrice :prodPrice,
							productQuantity :1
						  }
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			console.log("product is added first time");
			showToast("Item is added to cart")
		}
		
		else
		{
			// cart is already present
			
			let pcart = JSON.parse(cart);
			let oldProduct = pcart.find((item)=> item.productId == prodId)
			
			if(oldProduct){
				
				// only we have to increase quantity
				
				oldProduct.productQuantity= oldProduct.productQuantity + 1
				pcart.map((item)=>{
					if(item.productId == oldProduct.productId){
						item.productQuantity == oldProduct.productQuantity;
					}
				})
				localStorage.setItem("cart",JSON.stringify(pcart));
				//console.log("quantity of product is increased");
				showToast(oldProduct.productName + "Product Quantity is increased,Quantity="+oldProduct.productQuantity)
			}
			else{
				
				//we have to add the product
				
				let product = {
						productId :prodId,
						productName :prodName,
						productPrice :prodPrice,
						productQuantity :1
					  }
				
				pcart.push(product)
				localStorage.setItem("cart",JSON.stringify(pcart));
				//console.log("product is added");
				showToast("product is added to cart")
			}
		}
		update_card();
	}

//update card

function update_cart(){
	
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	
	if(cart==null|| cart.length==0){
		
		console.log("cart is empty !!");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart doesn't have any items</h3>");
		$(".checkout-btn").attr("disabled",true);
	}else{
		
		//There is something in cart to show
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
			
			<table class='table table-striped table-hover'>
				<thead class='bg-warning'>
					<tr>
						<th>Item Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
						
					</tr>
				
				
				</thead>
		`;
		
		let totalPrice = 0;
		cart.map((item)=>{
			
			table+=`
				<tr>
					<td> ${item.productName} </td>
					<td> ${item.productPrice} </td>
					<td> ${item.productQuantity} </td>
					<td> ${item.productQuantity * item.productPrice} </td>
					<td> <button onclick ="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm"> Remove </button> </td>
				</tr>
				`
				totalPrice+= item.productPrice * item.productQuantity;
		})
		
		table = table +`
		
		<tr> <td colspan ='5' class="text-right font-weight-bold text-success">Total Price : ${totalPrice}</td> </tr>
		 	</table>`
		
		$(".cart-body").html(table);
		$(".checkout-btn").attr("disabled",false);
	}
	
}

// delete Items 
	function deleteItemFromCart(prodId)
	
	{
		let cart = JSON.parse(localStorage.getItem("cart"));
		let newCart = cart.filter((item)=>item.productId!=prodId)
		localStorage.setItem("cart",JSON.stringify(newCart));
		update_cart()
		showToast("Item is removed from cart")
	}
	
	

	
	
	$(document).ready(function () {
	
	update_cart()
})


function showToast(content){
	
	$("#toast").addClass("display")
	$("#toast").html(content)
	setTimeout(()=>{
		$("#toast").removeClass("display");
	}, 2000)
}

	function goToCheckout(){
		
		window.location = "checkout";
	}
	
	