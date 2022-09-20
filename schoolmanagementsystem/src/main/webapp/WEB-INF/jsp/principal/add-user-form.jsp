<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Add New User</h3>
		<form:form method="post" action="./add-user-submission" modelAttribute="user" class="needs-validation" novalidate="true">
		<div class="row pb-3 justify-content-center">
			<div class="col-4">
				<label for="name" class="form-label fw-bolder">Name</label>
				<form:input path="name" class="form-control" id="name" required="required"/>
				<div class="invalid-feedback">Please enter Full Name</div>
			</div>
			<div class="col-2">
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
			<div class="col-4">
				<label for="email" class="form-label fw-bolder">Email</label>
				<form:input path="email" class="form-control" id="email" required="required"/>
				<div class="invalid-feedback">Please enter Email Address</div>
			</div>
			<div class="col-2">
				<label for="dob" class="form-label fw-bolder">Date of Birth</label>
				<form:input path="dob" type="date" class="form-control" id="dob" required="required"/>
				<div class="invalid-feedback">Please enter Date of Birth</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-4">
				<label for="address" class="form-label fw-bolder">Address</label>
				<form:input path="address" class="form-control" id="address" required="required"/>
				<div class="invalid-feedback">Please enter Address Detail</div>
			</div>
			<div class="col-2">
				<label for="phone" class="form-label fw-bolder">Contact Number</label>
				<form:input path="phone" class="form-control" id="phone" required="required"/>
				<div class="invalid-feedback">Please enter Phone Number</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-4">
				<label for="password" class="form-label fw-bolder">Password</label>
				<form:input path="password" class="form-control" id="password" required="required"/>
				<div class="invalid-feedback">Please enter Password</div>
			</div>
			<div class="col-2">
				<label for="type" class="form-label fw-bolder">User Type</label>
				<form:select class="form-select" path="type" required="required">
					<option value="Principal">Principal</option>
					<option value="Teacher">Teacher</option>
					<option value="Student">Student</option>
				</form:select>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<div>
					<label for="course" class="form-label fw-bolder">Courses</label>
				</div>
				<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
					<div class="form-check form-check-inline col-3">
						<form:checkbox path="selectedCourseIds" class="form-check-input" value="${course.getId()}" id="flexCheck"/>
						<label class="form-check-label" for="flexCheck">${course.getName()}</label>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row pt-5 pb-3 justify-content-center">
			<div class="col-6 d-flex justify-content-center">
				<button class="btn btn-primary col-2 me-2" type="submit">Add</button>
				<a class="btn btn-outline-primary col-2 ms-2" type="button" onclick="location.href='./manage-users';">Cancel</a>
			</div>
		</div>
		</form:form>
	</div>
</div>

<script>
	var form = document.forms[0];
	form.addEventListener('submit', function (event) {
		window.temp = event;
		if (!form.checkValidity()) {
			event.preventDefault();
			event.stopPropagation();
		}
		form.classList.add('was-validated');
	}, false);
</script>