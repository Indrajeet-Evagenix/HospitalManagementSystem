<%@page import="com.db.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

<link href="../css/index.css" rel="stylesheet">
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${not empty errorMsg }">
							<p class="fs-4 text-center text-danger">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg }">
							<p class="fs-4 text-center text-success">${sucMsg }</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob Number</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor doctor = (Doctor) session.getAttribute("doctObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnect.getConnection());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(doctor.getId());
								for (Appointment ap : list) {
								%>

								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equalsIgnoreCase(ap.getStatus())) {
										%> <a class="btn btn-success btn-sm"
										href="comment.jsp?id=<%=ap.getId()%>">Comment</a> <%
 } else {
 %> <a class="btn btn-success btn-sm disabled"
										href="comment.jsp?id=<%=ap.getId()%>">Comment</a> <%
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
			</div>
		</div>
	</div>

</body>
</html>