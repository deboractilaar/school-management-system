<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Add New Course</h3>
		<form:form method="post" action="./add-course-submission" modelAttribute="course" class="needs-validation" novalidate="true">
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="name" class="form-label fw-bolder">Name</label>
					<form:input path="name" class="form-control" id="name" required="required"/>
					<div class="invalid-feedback">Please enter Course Name</div>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="detail" class="form-label fw-bolder">Detail</label>
					<form:textarea path="detail" class="form-control" id="detail" required="required"/>
					<div class="invalid-feedback">Please enter Course Detail</div>
				</div>
			</div>
			<div class="row pt-5 pb-3 justify-content-center">
				<div class="col-6 d-flex justify-content-center">
					<button class="btn btn-primary col-2 me-2" type="submit">Add</button>
					<a class="btn btn-outline-primary col-2 ms-2" type="button" onclick="location.href='./courses';">Cancel</a>
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