<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>야구 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>야구</h2>
		<table class="table table-bordered">
			<thead>
				<tr id="teamlist">
					<th>팀</th>
				</tr>
					<c:forEach var="team" items="${teams}">
						<tr class="teamitems">
							<td id="${team.id}" onclick="get_id(${team.id});">${team.teamname}</td>
						</tr>
					</c:forEach>
		</table>
		
		<table class="table table-bordered">
			<thead>
				<tr id="playerlist">
					<th>선수</th>
				</tr>
		</table>
		
		<table class="table table-bordered">
			<thead>
				<tr id="playerDetail">
					<th colspan="3">선수정보</th>
				</tr>
		</table>
		
		
		<br />
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

// team
		function get_id(teamid) {
					$.ajax({
						type : 'GET',
						url : '/practice/baseball/player/'+teamid,
						dataType : 'text'
					}).done(
							function(players) {
								let result = JSON.parse(players);
								$('.player_items').remove();
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='player_items'><td onclick=get_playerid("+result[i].id+");>"
											+ result[i].playername + "</td></tr>";
											$('#playerlist').after(item_list);
								}

								
							}).fail(function(result) {
						alert('서버 오류');
					});
				}

// player

	function get_playerid(playerid) {
					$.ajax({
						type : 'GET',
						url : '/practice/baseball/detail/'+playerid,
						dataType : 'text'
					}).done(
							function(playerDetail) {
								let result = JSON.parse(playerDetail);
								$('.detail_items').remove();
								for (var i=result.length-1; i >= 0 ; i--) {
									var item_list = "<tr class='detail_items'><td>"
											+ result[i].id + "</td>><td>"
											+ result[i].playername + "</td>><td>"
											+ result[i].teamId + "</td></tr>";
											$('#playerDetail').after(item_list);
								}								
							}).fail(function(result) {
						alert('서버 오류');
					});
				}

</script>
</body>
</html>