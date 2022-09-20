<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd; font-size:18px;">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarcol" aria-controls="navbarcol" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-md-center" id="navbarcol">
			<ul class="nav nav-pills">
				<li class="nav-item px-3"><a class="nav-link" href="<c:url value="/"/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="Lokon Academy" width="150px"></a></li>
				<li class="nav-item px-3"><a class="nav-link" href="study-at-lokon">Study at Lokon</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="about-us">About Us</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="contact-us">Contact Us</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="research">Research</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="awards">Awards</a></li>
				<li class="nav-item px-3"><a class="nav-link" href="login">Login</a></li>
			</ul>
		</div>
	</div>
</nav>