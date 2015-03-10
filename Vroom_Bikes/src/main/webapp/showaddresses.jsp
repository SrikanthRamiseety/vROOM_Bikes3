<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Management</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="homepage"><img src="images/logo_1293352_web.jpg"
							alt="" /></a>
					</div>

				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">

							<li><a href="userservlet/logout"><i class="fa fa-crosshairs"></i>
									Logout</a></li>


						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="container" id="user_details">
		<h3>
			Welcome
			<c:out value="${user.userName }"></c:out>
		</h3>
	</div>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">Addresses</h2>

			<c:forEach items="${addressList }" var="address">
				<div class="col-sm-4">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<address>
									<strong><c:out value="${user.userName }"></c:out> </strong><br>
									<c:out value="${address.street }"></c:out>
									 
									<br>
									<c:out value="${address.city }"></c:out>
									<br>
									<c:out value="${address.state }"></c:out>
									-
									<c:out value="${address.pincode }"></c:out>
									<br> <abbr title="Phone">Ph: </abbr>
									<c:out value="${address.mobile }"></c:out>
									<br>
								</address>
								<a href="userservlet/confirmorder?st=${address.street }&cy=${address.city }&mob=${address.mobile }&state=${address.state }" class="btn btn-default add-to-cart"><i
									class="fa fa-edit"></i>Deliver here</a>
									<a href="userservlet/editaddress?email=${user.email }" class="btn btn-default edit btn-xs"><i class="fa fa-edit"></i>Edit</a>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="col-sm-9 padding-right">
		<a class="title text-center btn btn-primary" href="addaddress.jsp">
			Add New Addresses </a>
	</div>
</body>
</html>