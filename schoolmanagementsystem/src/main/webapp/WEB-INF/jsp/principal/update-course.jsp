<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Update Course</h3>
		<c:if test="${fail == true}">
			<div class="alert alert-danger col-6 mx-auto" role="alert">Course name already exist, please enter a different name!</div>
		</c:if>
		<form:form method="post" action="./update-course-submission" modelAttribute="course" class="needs-validation" novalidate="true">
			<form:hidden path="id" />
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="name" class="form-label fw-bolder">Name</label>
					<form:input path="name" class="form-control" id="name" maxlength="50" required="required"/>
					<div class="invalid-feedback">Please enter Course Name</div>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="detail" class="form-label fw-bolder">Detail</label>
					<form:textarea path="detail" class="form-control" id="detail" maxlength="300" required="required"/>
					<div class="invalid-feedback">Please enter Course Detail</div>
				</div>
			</div>
			<div class="row pt-5 pb-3 justify-content-center">
				<div class="col-6 d-flex justify-content-center">
					<button class="btn btn-primary col-2 me-2" type="submit">Update</button>
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