package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.model.Product;
import com.cos.springboot.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired // 주입(DI)

	private ProductRepository productRepository; // 변수 선언


	@GetMapping("/practice")
	public String main() {		

		return "product/main";
	}
	
	@GetMapping("/practice/product")
	public String product(Model model) {
		
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);

		return "product/list";
	}
	
	// 주방용품
	@GetMapping("/practice/product_{num}")
	public @ResponseBody List<Product> productList(@PathVariable int num, Model model) {
				
		
			List<Product> products = productRepository.findByType("주방용품");
			model.addAttribute("products", products);
			return products;
	
	

		
		
	}

	
	
}
