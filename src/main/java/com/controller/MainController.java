package com.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.EcommerceDao;
import com.dao.ProductDao;
import com.entity.Category;
import com.entity.Product;
import com.entity.User;
import com.form.CatPrdForm;
import com.form.IndexForm;
import com.util.Utilities;

@Controller
public class MainController {

	@Autowired
	EcommerceDao ecommerceDao;

	@Autowired
	ProductDao productDao;
	
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		IndexForm form = new IndexForm();
		
		List<Product> products = productDao.getProduct();

		for (Product product : products) {
			/*ByteArrayInputStream bis = new ByteArrayInputStream(product.getProdPic());
			BufferedImage bImage2;
			try {
				bImage2 = ImageIO.read(bis);
				ImageIO.write(bImage2, "jpg", new File(product.getProdName() + ".jpg"));
				System.out.println(product.getProdName() + "image created");
			} catch (IOException e) {
				e.printStackTrace();
			}*/

			String base64Image = Utilities.getImageString(product.getProdPic());

			//System.out.print(product.getProdName() + ":  " + base64Image);
			product.setBase64Image(base64Image);
			
			int discount = (int)((product.getProdDiscount()/100.0)*product.getProdPrice());
			product.setProdPriceAfterDisc(product.getProdPrice()-discount);
			
		}

		List<Category> categorys = ecommerceDao.getCategory();

	    form.setProductList(products);
		form.setCategoryList(categorys);
		
		
		mv.addObject("form", form);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/login")
	public String login() {
		return "login";

	}
	@RequestMapping("/checkout")
	public String checkout() {
		return "checkout";

	}

	// show register form
	@RequestMapping("register")
	public String showRegister() {
		// m.addAttribute("title","Add Product");

		return "register";

	}
	@RequestMapping("admin")
	public ModelAndView showAdmin() {
		
		IndexForm form1 = new IndexForm();
		ModelAndView mv = new ModelAndView();
		
		List<Category> category = ecommerceDao.getCategory();
		form1.setCategoryList(category);
		
		List<User> userList = ecommerceDao.getUsers();
		form1.setUserList(userList);
		
		List<Product> productList =productDao.getProduct() ;
		form1.setProductList(productList);;
		
		mv.addObject("categoryForm", form1);
		mv.addObject("productForm", form1);
		mv.addObject("userForm", form1);
		
		mv.setViewName("admin");
		return mv;
	}

	@RequestMapping("normal")
	public String showNormal() {
		// m.addAttribute("title","Add Product");

		return "normal";

	}

	@RequestMapping("logout")
	public String showLogout() {

		return "logout";
	}

	@RequestMapping(path = "/processform", method = RequestMethod.POST)
	public String handleForm(@ModelAttribute User user, Model model) {

		ecommerceDao.createUser(user);
		model.addAttribute("message", "Registered Successfully!!");

		return "register";

	}

	@RequestMapping(value = "/productOperation", method = RequestMethod.POST)
	public ModelAndView productOperation(@ModelAttribute CatPrdForm catForm) {
		ModelAndView mv = new ModelAndView();
		if ("add-category-modal".equals(catForm.getOperate())) {
			Category category = new Category();
			BeanUtils.copyProperties(catForm, category);

			ecommerceDao.createCategory(category);
			catForm.setMessage("category added!!");

}

		else {
			//Category category1 = ecommerceDao.getSingleCategory(form.getCategoryId());
			Product product = new Product();
			BeanUtils.copyProperties(catForm, product);
			if(catForm.getProdPic() != null)
				try {
					product.setProdPic(catForm.getProdPic().getBytes());
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			Category singleCategory = ecommerceDao.getSingleCategory(catForm.getCategoryId());
			product.setCategory(singleCategory);
			productDao.createProduct(product);

			catForm.setMessage("product added!!");

		}
		
		mv.addObject("form", catForm);
		mv.setViewName("admin");

		return mv;
	}

	@RequestMapping(value = "/loginform", method = RequestMethod.POST)
	public ModelAndView loginForm(@ModelAttribute User user, Model model, HttpServletResponse response,
			HttpSession httpSession) throws IOException {

		ModelAndView modelAndView = new ModelAndView();

		User users = ecommerceDao.getUserDetailsByEmailAndPassword(user.getUserEmail(), user.getUserPassword());
		if (users == null) {
			model.addAttribute("msg", "Invalid User or Password!!");
			response.sendRedirect("login");
		} else {
			httpSession.setAttribute("currentUser", users);

			if (users.getUserType().equals("admin")) {
				response.sendRedirect("admin");
			} else if (users.getUserType().equals("normal")){
				response.sendRedirect("normal");
			}

		}

		modelAndView.setViewName("index");
		return modelAndView;
	}

}
