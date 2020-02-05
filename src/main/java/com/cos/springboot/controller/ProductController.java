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

import com.cos.springboot.dto.ResponseDto;
import com.cos.springboot.model.Product;
import com.cos.springboot.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired
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
	
	@GetMapping("/practice/product/list")
	public @ResponseBody List<Product> productList() {		
			List<Product> products = productRepository.findAll();
			return products;				
	}
	
	@GetMapping("/practice/product/kitchen")
	public @ResponseBody List<Product> productKitchen() {		
			List<Product> products = productRepository.findByType("주방용품");
			return products;				
	}
	
	@GetMapping("/practice/product/food")
	public @ResponseBody List<Product> productFood() {		
			List<Product> products = productRepository.findByType("음식");
			return products;				
	}
	
	@GetMapping("/practice/product/price/{num}")
	public ResponseEntity<?> productPrice(@PathVariable int num) {
		List<Product> products = null;
			if(num==1) {
				products = productRepository.findByPriceAll();
			}else if(num==2) {
				products = productRepository.findByPrice("주방용품");
			}else if(num==3) {
				products = productRepository.findByPrice("음식");
			}			
			return new ResponseEntity<List<Product>>(products, HttpStatus.OK);		
	}
	@GetMapping("/practice/product/order/{num}")
	public ResponseEntity<?> productOrder(@PathVariable int num) {	
		List<Product> products=null;
			if(num==1) {
				products = productRepository.findByOrderAll();
			}else if(num==2) {
				products = productRepository.findByOrder("주방용품");
			}else if(num==3) {
				products = productRepository.findByOrder("음식");
			}			
			return new ResponseEntity<List<Product>>(products, HttpStatus.OK);			
	}
	


}
