<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Update User</h3>
		<c:if test="${fail == true}">
			<div class="alert alert-danger col-6 mx-auto" role="alert">Email already exist, please enter a different email!</div>
		</c:if>
		<form:form method="post" action="./update-user-submission?action=update" modelAttribute="user" class="needs-validation" novalidate="true">
		<form:hidden path="id"/>
		<form:hidden path="password"/>
		<form:hidden path="type"/>
		<div class="row pb-3 justify-content-center">
			<div class="col-4">
				<label for="name" class="form-label fw-bolder">Name</label>
				<form:input path="name" class="form-control" id="name" maxlength="50" required="required"/>
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
				<form:input path="email" class="form-control" id="email" maxlength="60" required="required"/>
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
				<form:input path="address" class="form-control" id="address" maxlength="100" required="required"/>
				<div class="invalid-feedback">Please enter Address Detail</div>
			</div>
			<div class="col-2">
				<label for="phone" class="form-label fw-bolder">Phone</label>
				<form:input path="phone" class="form-control" id="phone" maxlength="20" required="required"/>
				<div class="invalid-feedback">Please enter Phone Number</div>
			</div>
		</div>
		<div class="row pb-3 justify-content-center">
			<div class="col-6">
				<div>
					<label for="course" class="form-label fw-bolder">Courses</label>
				</div>
				<c:forEach var="course" items="${courseList}" varStatus="loop">
					<div class="form-check form-check-inline col-3">
						<form:checkbox path="selectedCourseIds" class="form-check-input" value="${course.getId()}" id="flexCheck"/>
						<label class="form-check-label" for="flexCheck">${course.getName()}</label>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row pt-5 pb-3 justify-content-center">
			<div class="col-6 d-flex justify-content-center">
				<button class="btn btn-primary col-2 me-2" type="submit">Update</button>
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