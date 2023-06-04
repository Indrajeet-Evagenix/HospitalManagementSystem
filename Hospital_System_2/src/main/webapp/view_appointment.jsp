<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<%@include file="component/allcss.jsp"%>
<link href="css/index.css" rel="stylesheet">
<style type="text/css">
.backImg {
	background: linear-gradiant(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("..img/hospital.png");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fw-bold fs-4 text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnect.getConnection());
								DoctorDao dao2 = new DoctorDao(DBConnect.getConnection());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>

								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("Pending".equalsIgnoreCase(ap.getStatus())) {
										%> <a class="btn btn-sm btn-warning" href="#">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%> <%
 }
 %>
									</td>
								</tr>

								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-3 p-3">
					<img alt="" src="img/doct1.png">
				</div>
			</div>
		</div>
	</div>

</body>
</html>