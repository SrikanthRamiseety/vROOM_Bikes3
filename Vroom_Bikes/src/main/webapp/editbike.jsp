<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EdIT</title>
 <style type="text/css">
  
 
 
 </style>
 
</head>
<body>

	 
<%@ include file="adminheader.jsp" %>
	 <div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12" id="show">
						 
		<form action="admin/updatebike" method="post">
			<fieldset>

				<legend>UPDATE BIKE</legend>
				<p>
					<label>BIKE ID</label> <input type="text" id="bikeid" name="bikeid"
					 
						value="${bikes.getBikeId()}" readonly="readonly"> <input
						type="hidden" id="bikeid" name="bikeid"
						value="${bikes.getBikeId()}">
				</p>
				<p>
					<label>BIKE NAME</label> <input type="text" id="bikename"
						name="bikename" value="${bikes.getBikeName()}">
				</p>
				<p>
					<label>BIKE BRAND</label> <input type="text" id="bikebrand"
						name="bikebrand" value="${bikes.getBikeBrand() }">
				</p>
				<p>
					<label>BIKE PICE</label> <input type="text" id="bikeprice"
						name="bikeprice" value="${bikes. getPrice() }">
				</p>
				<p>
					<label>BIKE CC</label> <input type="text" id="bikecc" name="bikecc"
						value="${bikes. getCc() }">
				</p>
				<p>
					<button type="submit" class="btn btn-info btn-xs">UPDATE
						BIKE</button>
					<button type="reset" class="btn btn-defalut btn-xs">CANCLE</button>

				</p>
			</fieldset>
		</form>
</div>
</div>
</div>
 </div>

	 

</body>
</html>