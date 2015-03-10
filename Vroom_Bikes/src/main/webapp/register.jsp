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
					required : true,
					minlength : 10,
					maxlength : 10,

				}
				 
				 

			},
			messages : {
				name : {
					required : "Name should not empty",
					minlength : "Name should be 3 words",
					maxlength : "Name should be only 15  charAteers"

				},

				email : {
					required : "Email is should not empty"

				},
				mobile : {
					required : "Mobile should not empty",
					minlength : "Mobile should be 10 numbers",
					maxlength : "Mobile should be 10 numbers"

				}
				 
			}

		});

	});
</script>

<script type="text/javascript">
	$(function() {
		$("#register").click(function() {
			var vlaue = $("#register").val();
			$.get("userservlet", {
				"value" : value
			}, show)

			function show(data) {
				$("#").html(data);
			}
		})
	})
</script>
<script type="text/javascript">
	function checkForm(form) {
		if (form.name.value == "") {
			alert("Error: Username cannot be blank!");
			form.name.focus();
			return false;
		}
		re = /^\w+$/;
		if (!re.test(form.name.value)) {
			alert("Error: Username must contain only letters, numbers and underscores!");
			form.name.focus();
			return false;
		}
		if (form.password.value != "" && form.password.value == form.cpassword.value) {
			if (form.password.value.length < 6) {
				alert("Error: Password must contain at least six characters!");
				form.password.focus();
				return false;
			}
			if (form.password.value == form.name.value) {
				alert("Error: Password must be different from Username!");
				form.password.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(form.password.value)) {
				alert("Error: password must contain at least one number (0-9)!");
				form.password.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.cpassword.value)) {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.password.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.password.value)) {
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.password.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.password.focus();
			return false;
		}
		alert("You entered a valid password: " + form.password.value);
		return true;
	}
</script>
<title>form</title>
<style type="text/css">
#body {
	min-height: 500px;
	width: 100%;
	background-color: #367;
}

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
	float: right;
	font-size: small;
	font-family: inherit;
}

em {
	color: red;
}
</style>







</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid" >
		<div class="container" id="body">
			<div class="row">
				<div class="col-md-6"></div>
				<div class="col-md-6 col-lg-8" >



					<form action="userservlet" id="form"  onsubmit="return checkForm(this);">
						<fieldset>
							<legend>Registration form</legend>
							<p>
								<label>USERNAME<em>*</em></label> <input type="text" id="name"
									name="name" class="name" placeholder="Enter your name"
									required="required">
							</p>
							<p>
								<label>EMAIL<em>*</em></label> <input type="email" id="email"
									name="email" class="email" placeholder="Enter your email"
									required="required">
							</p>
							<p>
								<label>PASSWORD<em>*</em></label> <input type="password"
									id="password" name="password" class="password"
									placeholder="Enter password" required="required">
							</p>
							<p>
								<label>CONFIRM PASSWORD<em>*</em></label> <input type="password"
									id="cpassword" name="cpassword" class="cpassword"
									placeholder="Confirm password" required="required">
							</p>

							Address:<br> <br>
							<p>
								<label>Street</label> <input type="text" id="street"
									name="street" class="street">
							</p>
							<p>
								<label>City</label> <input type="text" id="city" name="city"
									class="city">
							</p>
							<p>
								<label>State</label> <input type="text" id="state" name="state">
							</p>
							<p>
								<label>Pin</label><input type="number" id="pin" name="pin"
									class="pin">
							</p>
							<p>
								<label>Mobile<em>*</em></label> <input type="number" id="mobile"
									name="mobile" class="mobile" required="required">
							</p>
							<p style="text-align: center;">
								<button type="submit" class="btn btn-defalut btn-xs"
									id="register" name="register">Register</button>
								<input type="reset" id="reset" name="reset" value="cancle">

							</p>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>




</body>
</html>