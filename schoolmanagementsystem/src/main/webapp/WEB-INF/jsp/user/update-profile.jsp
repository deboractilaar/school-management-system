<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Update Profile</h3>
		<form:form method="post" action="./update-user-submission?action=profile" modelAttribute="user" class="needs-validation" novalidate="true">
		<form:hidden path="id"/>
		<form:hidden path="type"/>
		<form:hidden path="selectedCourseIds"/>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<label for="name" class="form-label fw-bolder">Name</label>
				<form:input path="name" class="form-control" id="name" required="required"/>
				<div class="invalid-feedback">Please enter Full Name</div>
			</div>
			<div class="col-3">
				<label class="form-label fw-bolder">Gender</label>
				<div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="gender"  name="gender" value="Male" required="required"/>
						<label class="form-check-label" for="male">Male</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton class="form-check-input" path="gender"  name="gender" value="Female" required="required"/>
						<label class="form-check-label" for="female">Female</label>
					</div>
					<div>
						<input class="d-none" type="radio" name="gender" value="">
						<div class="invalid-feedback">Please select Gender</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<label for="email" class="form-label fw-bolder">Email</label>
				<form:input path="email" class="form-control" id="email" required="required"/>
				<div class="invalid-feedback">Please enter Email Address</div>
			</div>
			<div class="col-3">
				<label for="dob" class="form-label fw-bolder">Date of Birth</label>
				<form:input path="dob" type="date" class="form-control" id="dob" required="required"/>
				<div class="invalid-feedback">Please enter Date of Birth</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<label for="address" class="form-label fw-bolder">Address</label>
				<form:input path="address" class="form-control" id="address" required="required"/>
				<div class="invalid-feedback">Please enter Address Detail</div>
			</div>
			<div class="col-3">
				<label for="phone" class="form-label fw-bolder">Contact Number</label>
				<form:input path="phone" class="form-control" id="phone" required="required"/>
				<div class="invalid-feedback">Please enter Phone Number</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<label for="password" class="form-label fw-bolder">Password</label>
				<form:input path="password" class="form-control" id="password" required="required"/>
				<div class="invalid-feedback">Please enter Password</div>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="d-grid col-2 mx-auto py-3 d-md-block">
			<button class="btn btn-primary col-5" type="submit" name="submit">Update</button>
			<a class="btn btn-outline-primary col-5" type="button" onclick="location.href='./profile?action=profile';">Cancel</a>
		</div>
		</form:form>
	</div>
</div>

<script>
	var form = document.forms[0];
	form.addEventListener('submit', function (event) {
		window.temp = event;
	    console.log(event);
	    console.log(event.target.name);
	    if (!form.checkValidity()) {
	      event.preventDefault();
	      event.stopPropagation();
	    }
	    form.classList.add('was-validated');
	}, false);
</script>