<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view orders</title>
<style type="text/css">
.bike {
	border-left-style: solid;
	border-left-width: thin;
	border-bottom-style: solid;
	border-bottom-width: 3px;
	border-bottom-color: silver;
	border-right-style: solid;
	border-right-width: 3px;
	border-right-color: silver;
	border-top-style: solid;
	border-top-width: thin;
	margin-top: 2px;
	width: 500px;
	margin-left: 150px;
	border-style: outset;
}

.image{
	float: left;
	width: 20%;
}

.data {
	float: right;
	width: 70%;
}
</style>
</head>
<body>
 <br><br>
				<h2 style="color:#F00; margin-left: 25%"> <--Orders Placed--> </h2>
		 <c:forEach items="${order}" var="order">
			<div id="${bike.getBikeName() }" class="bike">
			<fieldset>

				<div class="image">
					<img alt="loading..." src="images/${order.getBikename()  }.jpg"
						height="100px" width="100px">
				</div>
				<div class="data">
				<strong>BIKENAME:</strong>	<strong></strong><c:out value="${ order.getBikename() }"></c:out>
					<br> 
					<strong>PRICE</strong>:Rs.<c:out value="${order. getPrice() }"></c:out>
					<br>
					<strong>QUANTIY:</strong> <c:out value="${ order.getQuantiy()  }"></c:out>
					 <br>
				
					 
					<strong>NAME:</strong> <c:out value="${ order.getName() }"></c:out>
					 <br>
					<strong>ADDRESS</strong>  <c:out value="${ order.getPlace() }"></c:out>
					<br>
					<strong>Mobile:</strong>  <c:out value="${ order. getMobile() }"></c:out>
					<br>
					<strong>TOTALPRICE:</strong>	<c:out value="${ order.getTotalprice()  }"></c:out>
					 
				</div>

			</fieldset>
		</div>



		<%-- <c:out value="${bike.getBikeId() }"></c:out> --%>
		 
		 
		 </c:forEach>





	</table>
</body>
</html>