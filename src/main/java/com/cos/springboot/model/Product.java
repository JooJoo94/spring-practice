package com.cos.springboot.model;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class Product {
	
	private int id;
	private String productname;
	private int price;
	private int orderCount;
	private String type;

}
