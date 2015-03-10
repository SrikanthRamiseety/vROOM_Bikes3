<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bike</title>
<script src="js/jquery-1.10.2.js"></script>

<script type="text/javascript">
	$(function() {
		$("#brand").change(function() {
			$("#bikebrand").val($("#brand").val());
			$("#add_bike").css("display","block");
		});
	});
</script>

<style type="text/css">
#add_bike {
	display: none;
}

.body {
	height: auto;
	width: 50%;
}

label {
	margin-right: 4%;
	width: 200px;
	color: teal;
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

</head>
<body>
	<div class="panel panel-primary body" >
		<div class="panel-heading">
			<div class="panel-title">
				<h4>Select Brand</h4>
			</div>
		</div>

		<div class="panel-body">
			<div class="form-group">
				<select id="brand">
					<option selected="selected">--Select Brand--</option>
					<c:forEach items="${brandsList }" var="brand">
						<option value="${brand.getBrandName() }">
							<c:out value="${brand.getBrandName() }"></c:out>
						</option>
					</c:forEach>
					<option value="">
				</select>
			</div>
		</div>
	</div>

	<div class="panel panel-primary body" id="add_bike">
		<div class="panel-heading">
			<div class="panel-title">
				<h4>Add Bike</h4>
			</div>
		</div>

		<div class="panel-body">
			<form action="admin/addbike" method="post">
				<div class="form-group">
					<label class="col-sm-4 control-label">BIKE NAME</label>
					<div class="col-sm-8">
						<input type="text" id="bikename" name="bikename"
							required="required" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-8">
						<input type="hidden" id="bikebrand" name="bikebrand"
							required="required" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">BIKE PICE</label>
					<div class="col-sm-8">
						<input type="text" id="bikeprice" name="bikeprice"
							required="required" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">BIKE CC</label>
					<div class="col-sm-8">
						<input type="text" id="bikecc" name="bikecc" required="required"
							class="form-control">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-info btn-xs">ADD
							BIKE</button>
						<a href="adminhomepage.jsp" class="btn btn-defalut btn-xs">CANCEL</a>
					</div>
				</div>
			</form>
		</div>
	</div>


	<div class="container" id="dody"></div>
</body>
</html>