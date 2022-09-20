<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/student-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-5 pb-3">Course Materials</h3>
		<div class="accordion" id="course">
			<c:forEach var="course" items="${student.getCourses()}">
				<div class="accordion-item">
					<h2 class="accordion-header" id="heading-${course.getId()}">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${course.getId()}" aria-expanded="true" aria-controls="collapse-${course.getId()}">${course.getName()}</button>
					</h2>
					<div id="collapse-${course.getId()}" class="accordion-collapse collapse" aria-labelledby="heading-${course.getId()}" data-bs-parent="#course">
						<div class="accordion-body">
		      				<table class="table">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th class="col-8" scope="col">Materials</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="attachment" items="${course.getAttachments()}" varStatus="attachmentLoop">
									<tr>
										<td>${attachmentLoop.index+1}</td>
										<td>
											<a class="nav-link" href="<c:url value="/files/"/>${attachment.getId()}" download>${attachment.getFileName()}</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>