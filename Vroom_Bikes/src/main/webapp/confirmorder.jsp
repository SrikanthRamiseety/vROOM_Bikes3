<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confirm Order</title>
</head>
<body>
	<%@ include file="header_min.jsp"%>
	<c:if test="${bikecart.size() > 0 }">

		<table class="table table-bordered">
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

				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Grand Total=</td>
				<td><c:out value="${grandTotal }"></c:out></td>
			</tr>
		</table>

		</div>
		<div class="container">
			<h4>Your Order will be delivered here</h4>
			<br>
			<address>
				<strong><c:out value="${user.userName }"></c:out> </strong><br>
				<c:out value="${address2.street }"></c:out>
				<br>
				<c:out value="${address2.city }"></c:out>
				<br> <abbr title="Phone">Ph: </abbr>
				<c:out value="${address2.mobile }"></c:out>
				<br>
			</address>
		</div>

		<div class="container">
			<a href="userservlet/orderplaced" class="btn btn-success btn-xs">Confirm
				Order</a>
		</div>
	</c:if>
</body>
</html>