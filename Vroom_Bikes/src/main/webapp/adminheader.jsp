<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- BOOTSTRAP STYLES-->
<link href="css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script src="js/jquery-1.10.2.js"></script>	

<script type="text/javascript">
	$(function() {
		$("#addbike").click(function() {
			$("#show").load("addbike.jsp");
		});
		$("#viewbikes").click(function() {
			 
			$.post("admin/viewbikes",show);
			function show(data) {
				$("#show").html(data);
			}
		});
		$("#addbrand").click(function() {
			$("#show").load("addbrand.jsp");
		});
		$("#viewbrands").click(function() {
			$("#show").load("admin/viewbrands");
		});
	});
	/* function addbike() {
		alert("Hi");
	} */
</script>

</head>
<body>
<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="manger.html">Admin</a>

			</div>


			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">

				<a href="#" class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="img/find_user.png"
						class="user-image img-responsive" />
					<li>
						<button id="addbike" class="btn btn-info admin_btn">
							<i class="fa fa-plus fa-2x"></i>&nbsp;ADD NEW BIKES
						</button>
					</li>
					<li>
						<button id="viewbikes" class="btn btn-info admin_btn">
							<i class="fa fa-eye fa-2x"></i>&nbsp;VIEW ALL BIKES
						</button>
					</li>
					<li>
						<button id="addbrand" class="btn btn-info admin_btn">
							<i class="fa fa-plus fa-2x"></i>&nbsp;ADD NEW BRANDS
						</button>
					</li>
					<li>
						<button id="viewbrands" class="btn btn-info admin_btn">
							<i class="fa fa-eye fa-2x"></i>&nbsp;VIEW BRANDS
						</button>
					</li>
				</ul>


			</div>

		</nav>
		</div>
	

</body>
</html>