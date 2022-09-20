<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd; font-size:18px;">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarcol" aria-controls="navbarcol" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-md-center" id="navbarcol">
			<ul class="nav nav-pills">
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/homepage'/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="Lokon Academy" width="150px"></a></li>
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/student-details'/>">Student Details</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/course-materials'/>">Course Materials</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/lessons'/>">Lessons</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/grades'/>">Grades</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value='/teacher/announcements'/>">Announcements</a></li>
				<li class="nav-item px-3 dropdown">
					<button class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi-person-circle" style="font-size:25px;"></i></button>
					<ul class="dropdown-menu" style="background-color: #e3f2fd;">
						<li><a class="dropdown-item" href="<c:url value='/teacher/profile?action=profile'/>">Profile</a></li>
						<li><a class="dropdown-item" href="<c:url value='/'/>">Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>