<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://docs/docs/jquery_json/jquery-1.11.1.js"></script>
<script type="text/javascript" src="http://docs/docs/jquery.validate.js"></script>
<script type="text/javascript"
	src="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/css/bootstrap.min.css">	
	
<style type="text/css">
/* #body {
	min-height: 500px;
	width: 100%;
	background-color: #eeefff;
} */

label {
	margin-right: 4%;
	width: 200px;
	color: teal;
}

fieldset {
	width: 50%;
}

label.error {
	color: red;
	float: none;
	font-size: small;
	font-family: inherit;
}

em {
	color: red;
}
</style>


<script type="text/javascript">
	$(function() {
		$("#form").validate({
			rules : {
				street : {
					required : true
				},
				city : {
					required : true
				},
				state : {
					required : true
				},
				pin : {
					number : true,
					required : true

				},
				mobile : {
					number : true,
					required : true
				}

			},
			messages : {

				street : {
					required : "*"
				},
				city : {
					required : "*"
				},
				state : {
					required : "*"
				},
				pin : {
					number : "Mobile should be a number",
					required : "*"

				},
				mobile : {
					number : "Pin code must be a number",
					required : "*"
				}
			}

		});

	});
</script>
</head>
<body>
	<%@ include file="header_min.jsp"%>
	<div class="col-sm-4 col-sm-offset-2" id="body">
		<div class="signup-form">
			<h2> Edit address</h2>
			<form action="userservlet/update" id="form" method="post">

				<p>
					<label>Street</label> <input type="text" id="street" name="street"
						class="street" value=${address.getStreet() }>
				</p>
				<p>
					<label>City</label> <input type="text" id="city" name="city"
						class="city" value=${address. getCity() }>
				</p>
				<p>
					<label>State</label> <input type="text" id="state" name="state"
						value=${address.getState() }>
				</p>
				<p>
					<label>Pin</label><input type="text" id="pin" name="pin"
						class="pin"value=${address.getPincode()  }>
				</p>
				<p>
					<label>Mobile</label> <input type="text" id="mobile"
						name="mobile" class="mobile" value=${address.getMobile() }>
				</p>
				<p style="text-align: center;">
					<button type="submit" class="btn btn-defalut btn-xs" id="register"
						name="register">uddate</button>
					
				</p>
			</form>
		</div>
	</div>
</body>
</html>