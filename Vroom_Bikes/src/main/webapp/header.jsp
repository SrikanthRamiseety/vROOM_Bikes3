<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
<script src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#search").keyup(function() {
			$.post("cart/search?searchStr="+$("#search").val(),show);
			function show(data) {
				$("#search_result").html(data);
			}
		});
	});
</script>
<style type="text/css">
	#search_result {
		/* display: none; */
	}
</style>
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

							<li><a href="userservlet/checkout"><i class="fa fa-crosshairs"></i>
									Checkout</a></li>
							<li><a href="showcart.jsp"><i class="fa fa-shopping-cart"></i>
									Cart</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left"></div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<input type="text" id="search" placeholder="Search" />
					</div>
					<div class="pull-right" id="search_result"></div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom-->

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#sportswear"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Sports Bike
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="viewbikes?brandName=Aprilia">Aprilia</a></li>
											<li><a href="viewbikes?brandName=BMW">BMW</a></li>
											<li><a href="viewbikes?brandName=KTM">KTM</a></li>
											<li><a href="viewbikes?brandName=DSK Benelli">DSK
													Benelli</a></li>
											<li><a href="viewbikes?brandName=Ducati">Ducati</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#mens"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Foreign Brands
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="viewbikes?brandName=BMW">BMW</a></li>
											<li><a href="viewbikes?brandName=Aprilia">Aprilia</a></li>
											<li><a href="viewbikes?brandName=Kawasaki">Kawasaki</a></li>
											<li><a href="viewbikes?brandName=KTM">KTM</a></li>
											<li><a href="viewbikes?brandName=Triumph">Triumph</a></li>
											<li><a href="viewbikes?brandName=DSK Benelli">DSK
													Benelli</a></li>
											<li><a href="viewbikes?brandName=Ducati">Ducati</a></li>
											<li><a href="viewbikes?brandName=Harley Davidson">Harley
													Davidson</a></li>
											<li><a href="viewbikes?brandName=Hyosung">Hyosung</a></li>
											<li><a href="viewbikes?brandName=Moto Guzzi">Moto
													Guzzi</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian"
											href="#womens"> <span class="badge pull-right"><i
												class="fa fa-plus"></i></span> Indian Brands
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="viewbikes?brandName=Hero Moto Corp">Hero
													Moto Corp</a></li>
											<li><a href="viewbikes?brandName=Honda">Honda</a></li>
											<li><a href="viewbikes?brandName=TVS">TVS</a></li>
											<li><a href="viewbikes?brandName=Yamaha">Yamaha</a></li>
											<li><a href="viewbikes?brandName=Suzuki">Suzuki</a></li>
										</ul>
									</div>
								</div>
							</div>


						</div>
						<!--/category-products-->



						<div class="price-range">
							<!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								<input type="text" class="span2" value=""
									data-slider-min="44800" data-slider-max="3000000"
									data-slider-step="5" data-slider-value="[44800,2950000]"
									id="sl2"><br /> <b class="pull-left">Rs. 44K</b> <b
									class="pull-right">Rs. 30L</b>
							</div>
						</div>
						<!--/price-range-->

						<div class="shipping text-center">
							<!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div>
						<!--/shipping-->

					</div>
				</div>
</body>
</html>