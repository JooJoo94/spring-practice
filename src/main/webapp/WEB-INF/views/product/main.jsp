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
	<div>
		<button onclick="product_list()">상품보기</button>
		<button onclick="baseball_list()">야구보기</button>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		function product_list() {
			location.href = '/practice/product';
		}
		function baseball_list() {
			location.href = '/practice/baseball';
		}
	</script>

</body>
</html>