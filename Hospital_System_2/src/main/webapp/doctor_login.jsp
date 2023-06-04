<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login Page</title>
<%@include file="component/allcss.jsp"%>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>

						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session"></c:remove>
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session"></c:remove>
						</c:if>

						<form action="doctorLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									type="email" name="email" class="form-control"
									placeholder="Enter Email Address">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									type="password" name="password" class="form-control"
									placeholder="Enter Password">
							</div>
							<button type="submit"
								class="btn btn-success text-white col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>