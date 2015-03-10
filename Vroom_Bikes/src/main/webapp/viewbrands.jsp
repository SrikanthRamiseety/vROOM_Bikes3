<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view brands</title>
<style type="text/css">
.brand {
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
				 
		 <c:forEach items="${brands}" var="brand">
			<div  class="brand">
			<fieldset>

				<div class="image">
					<img alt="loading..." src="images/${brand.getBrandName()}.jpg"
						height="100px" width="100px">
				</div>
				<div class="data">
					<c:out value="${brand.getBrandId()  }"></c:out>
					<br>
					<c:out value="${ brand.getBrandName() }"></c:out>
				</div>

			</fieldset>
		</div>



	 
		 
		 
		 </c:forEach>





	</table>
</body>
</html>