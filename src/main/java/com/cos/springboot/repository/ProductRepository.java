package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.model.Product;

public interface ProductRepository {
	
	// 전체보기
	List<Product> findAll();
	// type별 정렬
	List<Product> findByType(String type);
	// price별 정렬
	List<Product> findByPrice(String type);
	// order별 정렬
	List<Product> findByOrder(String type);

}
