<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://docs/docs/jquery_json/jquery-1.11.1.js"></script>
<script type="text/javascript" src="http://docs/docs/jquery.validate.js"></script>

<script type="text/javascript">
	$(function() {

		$("#form").validate({
			rules : {
				name : {
					required : true,
					minlength : 3,
					maxlength : 10
				},

				email : {

					required : true

				},
				mobile : {
					number : true,
					required : true,
					minlength : 10,
					maxlength : 10

				},
				pin : {
					number : true,
					minlength : 6,
					maxlength : 6
				}

			},
			messages : {
				name : {
					required : "*",
					minlength : "Name should be 3 words",
					maxlength : "Name should be only 15  charAteers"

				},

				email : {
					required : "*"

				},
				mobile : {
					number : "Mobile should be a number",
					required : "*",
					minlength : "Mobile should be 10 numbers",
					maxlength : "Mobile should be 10 numbers"

				},
				pin : {
					number : "Pin code must be a number",
					minlength : "Pin code must have 6 digits",
					maxlength : "Pin code must have 6 digits"
				}
			}

		});

	});
</script>

<script type="text/javascript">
	function checkForm(form) {
		re = /^\w+$/;
		if (!re.test(form.name.value)) {
			alert("Error: Username must contain only letters, numbers and underscores!");
			form.name.focus();
			return false;
		}
		if (form.password.value != ""
				&& form.password.value == form.cpassword.value) {
			if (form.password.value.length < 5) {
				alert("Error: Password must contain at least five characters!");
				form.password.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.password.focus();
			return false;
		}
		return true;
	}
</script>
<title>Sign Up | Vroom Bikes</title>
<style type="text/css">
</style>
</head>
<body id="main_body">



	<div class="col-sm-4" id="body">
		<div class="signup-form">
			<h2>New user Sign Up!</h2>
			<div id="error_message"></div>
			<form action="userservlet/Register" id="form"
				class="form-horizontal main_body" role="form"
				onsubmit="return checkForm(this);">
				<input type="text" id="name" name="name" class="form_input"
					placeholder="Name" required="required" /> <input type="email"
					id="email" name="email" class="form_input" placeholder="Email"
					required="required" /> <input type="password" id="password"
					name="password" class="form_input" placeholder="Password"
					required="required" /> <input type="password" id="cpassword"
					name="cpassword" class="form_input" placeholder="Confirm password"
					required="required" />
				<hr>
				Address:<br> <br> <input type="text" id="street"
					name="street" class="form_input" placeholder="Street" /> <input
					type="text" id="city" name="city" class="form_input"
					placeholder="City" /> <input type="text" id="state" name="state"
					placeholder="State" /> <input type="text" id="pin" name="pin"
					class="form_input" placeholder="Pin Code" maxlength="6" /> <input
					type="text" id="mobile" name="mobile" class="form_input"
					required="required" placeholder="Mobile" maxlength="10"
					width="10px" />
				<p>
					<button type="submit" class="btn btn-defalut btn-xs" id="register"
						name="register">Sign Up</button>

				</p>
			</form>
		</div>
	</div>





</body>
</html>