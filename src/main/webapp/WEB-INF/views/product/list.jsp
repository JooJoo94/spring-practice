<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품</title>
</head>
<body>
	<table border="1">
		<tr>
			<button id="productlist" value="1">전체보기</button>
			<button id="productkitchen" value="2">주방용품</button>
			<button id="productfood" value="3">음식</button>
			<button id="productprice">가격순</button>
			<button id="productorder">주문순</button>
		</tr>
		<tr id="list">
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>orderCount</th>
			<th>type</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr class="items">
				<td>${product.id}</td>
				<td>${product.productname}</td>
				<td>${product.price}</td>
				<td>${product.orderCount}</td>
				<td>${product.type}</td>
			</tr>
		</c:forEach>
	</table>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var num;
		// list
		$('#productlist').on(
				'click',
				function() {
					num = $('#productlist').val();
					$.ajax({
						type : 'GET',
						url : '/practice/product/list',
						dataType : 'text'
					}).done(
							function(products) {
								$('.items').remove();
								let result = JSON.parse(products);
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='items'><td>"
											+ result[i].id + "</td><td>"
											+ result[i].productname
											+ "</td><td>" + result[i].price
											+ "</td><td>"
											+ result[i].orderCount
											+ "</td><td>" + result[i].type
											+ "</td></tr>"
									$('#list').after(item_list);
								}
								console.log(result);
							}).fail(function(result) {
						alert('서버 오류');
					});
				});
		// kitchen
		$('#productkitchen').on(
				'click',
				function() {
					num = $('#productkitchen').val();
					$.ajax({
						type : 'GET',
						url : '/practice/product/kitchen',
						dataType : 'text'
					}).done(
							function(products) {
								$('.items').remove();
								let result = JSON.parse(products);
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='items'><td>"
											+ result[i].id + "</td><td>"
											+ result[i].productname
											+ "</td><td>" + result[i].price
											+ "</td><td>"
											+ result[i].orderCount
											+ "</td><td>" + result[i].type
											+ "</td></tr>"
									$('#list').after(item_list);
								}
								console.log(num);
							}).fail(function(result) {
						alert('서버 오류');
					});
				});

		// food
		$('#productfood').on(
				'click',
				function() {
					num = $('#productfood').val();
					$.ajax({
						type : 'GET',
						url : '/practice/product/food',
						dataType : 'text'
					}).done(
							function(products) {
								$('.items').remove();
								let result = JSON.parse(products);
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='items'><td>"
											+ result[i].id + "</td><td>"
											+ result[i].productname
											+ "</td><td>" + result[i].price
											+ "</td><td>"
											+ result[i].orderCount
											+ "</td><td>" + result[i].type
											+ "</td></tr>"
									$('#list').after(item_list);
								}
								console.log(num);
							}).fail(function(result) {
						alert('서버 오류');
					});
				});

		// price
		$('#productprice').on(				
				'click',
				function() {
					$.ajax({
						type : 'GET',
						url : '/practice/product/price/'+num,
						dataType : 'text'
					}).done(
							function(products) {
								$('.items').remove();
								let result = JSON.parse(products);
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='items'><td>"
											+ result[i].id + "</td><td>"
											+ result[i].productname
											+ "</td><td>" + result[i].price
											+ "</td><td>"
											+ result[i].orderCount
											+ "</td><td>" + result[i].type
											+ "</td></tr>"
									$('#list').after(item_list);
								}
								console.log(num);
							}).fail(function(result) {
						alert('서버 오류');
					});
				});
		// order
		$('#productorder').on(
				'click',
				function() {
					$.ajax({
						type : 'GET',
						url : '/practice/product/order/'+num,
						dataType : 'text'
					}).done(
							function(products) {
								$('.items').remove();
								let result = JSON.parse(products);
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='items'><td>"
											+ result[i].id + "</td><td>"
											+ result[i].productname
											+ "</td><td>" + result[i].price
											+ "</td><td>"
											+ result[i].orderCount
											+ "</td><td>" + result[i].type
											+ "</td></tr>"
									$('#list').after(item_list);
								}
								console.log(num);
							}).fail(function(result) {
						alert('서버 오류');
					});
				});
	</script>
</body>
</html>