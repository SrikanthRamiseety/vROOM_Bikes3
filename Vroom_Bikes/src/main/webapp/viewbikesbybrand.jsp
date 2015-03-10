<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:out value="${brandName }"></c:out> Bikes</title>
</head>
<body>
	<%@ include file="header.jsp"%>


	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">
				<c:out value="${brandName }"></c:out>
				Bikes
			</h2>

			<c:forEach items="${bikesList }" var="bike">
				<div class="col-sm-4">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/${bike.getBikeName() }.jpg" alt="" />
								<h2>
									Rs.
									<c:out value="${bike.getPrice() }"></c:out>
								</h2>
								<p>
									<c:out value="${bike.getBikeName() }"></c:out>
								</p>
								<p>
									<c:out value="${bike.getCc() }"></c:out>
								</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>
							<div class="product-overlay">
								<div class="overlay-content">
									<h2>
										Rs.
										<c:out value="${bike.getPrice() }"></c:out>
									</h2>
									<p>
										<c:out value="${bike.getBikeName() }"></c:out>
									</p>
									<a href="cart/buybike?bikeId=${bike.getBikeId() }" class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Add to cart</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	<%@ include file="footer.jsp"%>
	</div>
	
	
</body>
</html>