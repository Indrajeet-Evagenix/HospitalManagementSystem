<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<link href="css/index.css" rel="stylesheet">

<style type="text/css">
.backImg {
	background: linear-gradiant(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("img/hospital.png");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct1.png">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg }">
							<p class="text-center taxt-danger fs-4">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg }">
							<p class="text-center taxt-success fs-4">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<form action="addAppointment" class="row g-3" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" required class="form-control" name="fullname">
							</div>
							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="number" required class="form-control" name="age">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment</label>
								<input type="date" required class="form-control"
									name="appoin_date">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" required class="form-control" name="email">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone Number</label>
								<input type="number" required class="form-control" name="phno">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" required class="form-control" name="diseases">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label> <select
									class="form-control" name="doct" required>
									<option value="">--Select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConnection());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>

									<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpecialist()%>)
									</option>

									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label>Full Address</label>
								<textarea rows="3" cols="" name="address" required
									class="form-control"></textarea>
							</div>
							<c:if test="${empty userObj }">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>