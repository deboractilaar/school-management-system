<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Add New Lesson</h3>
		<c:if test="${fail == true}">
			<div class="alert alert-danger col-6 mx-auto" role="alert">Class room is not available on the selected time, please enter a different timing!</div>
		</c:if>
		<form:form method="post" action="./add-lesson-submission" modelAttribute="lesson" class="needs-validation" novalidate="true">
			<div class="row pb-3 justify-content-center">
				<div class="col-3">
					<label for="date" class="form-label fw-bolder">Date</label>
					<form:input path="date" type="date" class="form-control" id="date" required="required"/>
					<div class="invalid-feedback">Please enter Lesson Date</div>
				</div>
				<div class="col-3">
					<label for="classRoom" class="form-label fw-bolder">Class Room</label>
					<form:input path="classRoom" class="form-control" id="classRoom" maxlength="20" required="required"/>
					<div class="invalid-feedback">Please enter Class Room Detail</div>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-3">
					<label for="startTime" class="form-label fw-bolder">Start Time</label>
					<form:input path="startTime" type="time" step="1" class="form-control" name="startTime" required="required"/>
					<div class="invalid-feedback">Please enter Lesson Start Time</div>
				</div>
				<div class="col-3">
					<label for="endTime" class="form-label fw-bolder">End Time</label>
					<form:input path="endTime" type="time" step="1" class="form-control" name="endTime" required="required"/>
					<div class="invalid-feedback">Please enter Lesson End Time</div>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-3">
					<label for="course" class="form-label fw-bolder">Course</label>
					<form:select class="form-select" path="course.id" required="required">
						<c:forEach var="course" items="${courseList}">
							<option value="${course.getId()}">${course.getName()}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="row pt-5 pb-3 justify-content-center">
				<div class="col-6 d-flex justify-content-center">
					<button class="btn btn-primary col-2 me-2" type="submit">Add</button>
					<a class="btn btn-outline-primary col-2 ms-2" type="button" onclick="location.href='./lessons';">Cancel</a>
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