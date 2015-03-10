<%@page import="com.spaneos.vb.pojo.Bike"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Bikes</title>
<script src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
		$(".page").click(function() {
			$.post("admin/viewbikes?pagenumber=" + $(this).val(), show);
			function show(data) {
				$("#show").html(data);
			}
			$(this).css("color","#303030");
		});
	});
</script>

<style type="text/css">
.bike {
	border-left-style: solid;
	border-left-width: thin;
	border-bottom-style: solid;
	border-bottom-width: 3px;
	border-bottom-color: silver;
	border-right-style: solid;
	border-right-width: 3px;
	border-right-color: silver;
	border-top-style: solid;
	border-top-width: thin;
	margin-top: 2px;
	width: 500px;
	margin-left: 150px;
	border-style: outset;
}

#pagination {
	margin-left: 280px;
	margin-top: 40px;
	
}

.page {
	text-decoration: underline;
	color: #337AB7;
	background-color: transparent;
	box-sizing: border-box;
	font-family: "Open Sans",sans-serif;
	font-size: 14px;
	line-height: 1.42857;
}

.image {
	float: left;
	width: 20%;
}

.data {
	float: right;
	width: 70%;
}
</style>
</head>
<body>

	<br>
	<br>
	<div class="container pull-center" id="bikes">
		<c:forEach begin="${(param.pagenumber - 1) * 10 }" end="${(param.pagenumber * 10) - 1 }" var="i">
			<div id="${bikes.get(i).getBikeName() }" class="bike">
				<fieldset>

					<div class="image">
						<img alt="loading..." src="images/${bikes.get(i).getBikeName() }.jpg"
							height="100px" width="100px">
					</div>
					<div class="data">
						<c:out value="${bikes.get(i).getBikeName() }"></c:out>
						<br> Rs.
						<c:out value="${bikes.get(i).getPrice() }"></c:out>
						<br>
						<c:out value="${bikes.get(i).getCc() }"></c:out>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="admin/editbike?bikeId=${bikes.get(i).getBikeId() }"
							class="btn btn-info btn-xs">EDIT </a> <a
							href="admin/removebike?bikeId=${bikes.get(i).getBikeId() }"
							class="btn btn-danger btn-xs">REMOVE </a>
					</div>

				</fieldset>
			</div>
			<%-- <c:out value="${bike.getBikeId() }"></c:out> --%>


		</c:forEach>
	</div>
	<ul class="pagination" id="pagination">
		<li><button value="1" class="btn btn-default btn-xs page">
				&laquo;</button></li>
		<li><button value="1" class="btn btn-default btn-xs page">
				1</button></li>
		<li><button value="2" class="btn btn-default btn-xs page">
				2</button></li>
		<li><button value="3" class="btn btn-default btn-xs page">
				3</button></li>
		<li><button value="4" class="btn btn-default btn-xs page">
				4</button></li>
		<li><button value="5" class="btn btn-default btn-xs page">
				5</button></li>
		<li><button value="6" class="btn btn-default btn-xs page">
				6</button></li>
		<li><button value="7" class="btn btn-default btn-xs page">
				7</button></li>
		<li><button value="8" class="btn btn-default btn-xs page">
				8</button></li>
		<li><button value="8" class="btn btn-default btn-xs page">
				&raquo;</button></li>
	</ul>

</body>
</html>