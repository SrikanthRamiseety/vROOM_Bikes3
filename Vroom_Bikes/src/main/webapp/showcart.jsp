<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Cart</title>
<script type="text/javascript"
	src="http://docs/docs/jquery_json/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/showcart.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<c:if test="${bikecart.size() == null }">
		<h1 style="color: red">Your cart is Empty.</h1>
		<a class="btn btn-default" href="homepage">Shop Now</a>
	</c:if>
	<c:if test="${bikecart.size() == 0 }">
		<h1 style="color: red">Your cart is Empty.</h1>
		<a class="btn btn-default" href="homepage">Shop Now</a>
	</c:if>
	<c:if test="${bikecart.size() > 0 }">
		<h1 style="color: green">Bike successfully added to the cart</h1>
		<a class="btn btn-default" href="homepage">Continue Shopping</a>
		<hr>
		<div >
			<table class="table">
				<tr>
					<th></th>
					<th>Bike</th>
					<th>Brand</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Total Price</th>
				</tr>

				<c:forEach items="${bikecart }" var="bike">
					<tr>
						<td><img alt="" src="images/${bike.bikeName }.jpg"
							height="100px" width="100px"></td>
						<td><c:out value="${bike.bikeName }"></c:out></td>
						<td><c:out value="${bike.bikeBrand }"></c:out></td>
						<td>Rs. <c:out value="${bike.price }"></c:out>
						</td>
						<td><c:out value="${bike.quantity }"></c:out></td>
						<td><c:out value="${bike.totalPrice } "></c:out></td>
						<td><a href="cart/removebike?bikeId=${bike.bikeId }"
							class="btn btn-danger btn-xs">Remove</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>Grand Total:</td>
					<td><c:out value="${grandTotal }"></c:out></td>
					<td><a href="login.jsp" class="btn btn-success btn-xs">Checkout</a></td>
				</tr>
			</table>

		</div>
	</c:if>
	<%@ include file="footer.jsp"%>
</body>
</html>