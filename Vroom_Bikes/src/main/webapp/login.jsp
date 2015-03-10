<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://docs/docs/jquery_json/jquery-1.11.1.js">
	
</script>

<script type="text/javascript" src="http://docs/docs/jquery.validate.js">
	
</script>
<script type="text/javascript"
	src="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet"
	href="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login | Vroom Bikes</title>
<script type="text/javascript">
	$(function() {

		$("#ok").click(function() {
			var loginid = $("#email").val();
			var password = $("#password").val();
			$.post("userservlet", {
				"loginid" : loginid,
				"password" : password
			}, show);
			function show(data) {
				$("#result").html(data);
			}

		});

		$("#loginform").validate({
			rules : {
				email : {
					required : true,
				},

				password : {
					required : true,
				}

			},
			messages : {
				email : {
					required : "*"
				},
				password : {

					required : "*"
				}
			}
		});
	});
</script>
<style type="text/css">
#loginform {
	margin-top: 50px;
}

label.error {
	color: red;
	float: none;
	font-size: large;
	font-family: inherit;
}
</style>
</head>
<body>
	<%@ include file="header_min.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form">
					<h2>Login to your account</h2>
					<div id="error_message"></div>
					<form action="userservlet/login" id="loginform" name="loginform"
						method="post">
						<input type="email" id="email" name="email" placeholder="Email ID"
							required> <input type="password" id="password"
							name="password" placeholder="Password" required>


						<button type="submit" class="btn btn-default">Login</button>
					</form>
					<br>
					<!-- Don't have an account? <a
						href="form.jsp">Sign Up</a> -->
				</div>
			</div>
			<div class="col-sm-1">
				<h2 class="or">OR</h2>
			</div>
			<%@ include file="form.jsp" %>
		</div>
	</div>

	<div id="result"></div>

</body>
</html>