<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Add New Material</h3>
		<form:form method="post" action="./add-material-submission" modelAttribute="attachment" enctype="multipart/form-data" class="needs-validation" novalidate="true">
			<table class="table">
				<tbody>
					<tr>
						<td>
							<label class="form-label fw-bolder">Course Name</label>
						</td>
						<td>
							<form:select class="form-select" path="course.id" required="required">
								<c:forEach var="course" items="${courseList}">
									<option value="${course.getId()}">${course.getName()}</option>
								</c:forEach>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>
							<label class="form-label fw-bolder">Material</label>
						</td>
						<td>
							<input name="file" type="file" required="required" multiple/>
							<div class="invalid-feedback">Please upload Course Material</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="d-grid col-2 mx-auto py-3 d-md-block">
				<button class="btn btn-primary" type="submit" name="submit">Add</button>
				<a class="btn btn-outline-primary" type="button" onclick="location.href='./course-materials';">Cancel</a>
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