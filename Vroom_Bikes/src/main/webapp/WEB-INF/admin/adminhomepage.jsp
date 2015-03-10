<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMIN</title>
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
			$.post("admin/getbrands",show);
			function show(data) {
				$("#show").html(data);
			}
		});
		$("#viewbikes").click(function() {

			$.post("admin/viewbikes", show);
			function show(data) {
				$("#show").html(data);
			}
			
		});
		$("#addbrand").click(function() {
			$("#show").load("addbrand.jsp");
		});
		$("#vieworder").click(function() {
			$("#show").load("admin/vieworder");
		});
		$("#viewbrands").click(function() {
			$("#show").load("admin/viewbrands");
		});
	});
	
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
				<a class="navbar-brand" href="adminhomepage.jsp">Admin</a>

			</div>


			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">

				<a href="homepage" class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="images/find_user.png"
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
					<li>
						<button id="vieworder" class="btn btn-info admin_btn">
							<i class="fa fa-eye fa-2x"></i>&nbsp;View Orders
						</button>
					</li>
				</ul>


			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Admin Dashboard</h2>
						<h5>Welcome Manger of Vroom Bikes</h5>
					</div>

				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12" id="show"></div>
				</div>
			</div>

			<!-- /. PAGE WRAPPER  -->
		</div>
		<!-- /. WRAPPER  -->
		<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
		<!-- JQUERY SCRIPTS -->
		<script src="js/jquery-1.10.2.js"></script>
		<!-- BOOTSTRAP SCRIPTS -->
		<script src="js/bootstrap.min.js"></script>
		<!-- METISMENU SCRIPTS -->
		<script src="js/jquery.metisMenu.js"></script>
		<!-- MORRIS CHART SCRIPTS -->
		<script src="js/morris/raphael-2.1.0.min.js"></script>
		<script src="js/morris/morris.js"></script>
		<!-- CUSTOM SCRIPTS -->
		<script src="js/custom.js"></script>

	</div>
</body>
</html>
