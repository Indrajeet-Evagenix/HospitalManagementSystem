<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fas fa-clinic-medical"></i> Medi Home</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					href="index.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="patient.jsp">PATIENT</a></li>

			</ul>

			<form class="d-flex">
				<ul>
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle active" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-user"></i> ${doctObj.fullName }
					</a> <!-- <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Change Password</a></li>
							<li><a class="dropdown-item" href="#">Logout</a></li>

						</ul> --> <a class="text-white text-decoration-none" href="edit_profile.jsp">Edit-Profile</a>


						<a class="text-white text-decoration-none" href="../doctorLogout">Logout</a></li>
				</ul>

			</form>
		</div>
	</div>
</nav>