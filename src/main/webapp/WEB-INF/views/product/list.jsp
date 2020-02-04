<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<button>전체보기</button>
			<button id="product_1" value="2">주방용품</button>
			<button value="3">음식</button>
			<button value="4">가격순</button>
			<button value="5">주문순</button>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$('#product_1').on('click', function() {

			let num = $('#product_1').val();

			$.ajax({
				type : 'GET',
				url : '/practice/product_'+num,
				dataType : 'text'

			}).done(function(products) {

				$('#items').remove();

			}).fail(function(result) {
				alert('서버 오류');
			});
		});
	</script>
</body>
</html>