<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Announcement Detail</h3>
		<form:form method="post" action="./add-announcement-submission" modelAttribute="announcement" class="needs-validation" novalidate="true">
			<form:hidden path="teacher.id" />
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="course" class="form-label fw-bolder">Course</label>
					<form:select class="form-select" path="course.id" required="required">
						<c:forEach var="course" items="${courseList}">
							<option value="${course.getId()}">${course.getName()}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="title" class="form-label fw-bolder">Title</label>
					<form:input path="title" class="form-control" id="title" maxlength="100" required="required"/>
					<div class="invalid-feedback">Please enter Announcement Title</div>
				</div>
			</div>
			<div class="row pb-3 justify-content-center">
				<div class="col-6">
					<label for="detail" class="form-label fw-bolder">Detail</label>
					<form:textarea path="detail" class="form-control" id="detail" rows="5" maxlength="300" required="required"/>
					<div class="invalid-feedback">Please enter Announcement Detail</div>
				</div>
			</div>
			<div class="d-grid col-2 mx-auto py-3 d-md-block">
				<button class="btn btn-primary" type="submit" name="submit">Post</button>
				<a class="btn btn-outline-primary" type="button" onclick="location.href='./announcements';">Cancel</a>
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