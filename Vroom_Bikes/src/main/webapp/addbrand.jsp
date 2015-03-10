<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD BRAND</title>
<style type="text/css">
#body {
	height: auto;
	width: 50%;
}

/* label {
	margin-right: 4%;
	width: 200px;
	color: teal;
} */
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
	<div class="panel panel-primary" id="body">
		<div class="panel-heading">
			<div class="panel-title">
				<h4>ADD BRAND</h4>
			</div>
		</div>
		<div class="panel-body">
			<form action="admin/addbrand" class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-4 control-label">BRAND ID</label> 
					<div class="col-sm-8">
					<input
						type="text" id="bid" name="bid" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">BRAND NAME</label> 
					<div class="col-sm-8">
					<input
						type="text" id="bname" name="bname" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
					<input type="submit" id="submit" name="submit"
						value="ADD NEW BRAND" class="btn btn-primary "> <input
						type="reset" id="reset" name="reset" value="CANCEL"
						class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>