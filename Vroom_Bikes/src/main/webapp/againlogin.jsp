<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://docs/docs/jquery_json/jquery-1.11.1.js"> </script>
	
<script type="text/javascript" src="http://docs/docs/jquery.validate.js"> </script>
<script type="text/javascript"
	src="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/js/bootstrap.min.js"> </script>
<link rel="stylesheet"
	href="http://docs/docs/References/08_Bootstrap/bootstrap-3.3.1-dist/dist/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	
	$("#ok").click(function(){
		var loginid=$("#email").val();
		var password=$("#password").val();
		$.post("userservlet",{
			"loginid":loginid,
			"password":password
		},show);
		function show(data){
			$("#result").html(data);
		}
		
	});

	



	$("#loginform").validate({
		rules : {
			email : {
				required : true,
			},
			
			password:{
				required : true,	
			}
			
		},
		messages : {
				email : {
					required : "*"
				},
				password:{
					
					required : "*"
				}
		}
		});
});


	function form(){
		document.getElementById("form").style.display="block";
	}
	
	function hideform() {
		document.getElementById("form").style.display="none";
	}
	
</script>
<style type="text/css">
#loginform{
	margin-left: 50px;
	margin-top: 50px;
}
label.error {
	color: red;
	float:none;
	font-size: large;
	font-family: inherit;
}

</style>
</head>
<body>

	<form action="userservlet/login" id="loginform" name="loginform" method="post">
	<fieldset>
		<legend align="left">Login</legend>
		<p>
			Login Id:<input type="email" id="email" name="email" placeholder="Enter your User Id" required>
		</p>
		<p>
			Password:<input type="password" id="password" name="password" placeholder="Enter password" required>
		</p>
		<p style="color: red">* Given Email or password is wrong</p>
		<p>
			<input type="submit" id="ok" name="ok" value="login">
		</p>
		<p>new user? <a onclick="form()">Sign Up</a></p>
		</fieldset>
	</form>
	
	<div id="result"> </div>

</body>
</html>