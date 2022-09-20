<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-5 pb-3">List of Lessons</h3>
		<div class="container my-5 p-5 bg-light">
			<ul class="nav nav-tabs" id="courseTab" role="tablist">
				<c:forEach var="course" items="${courseList}" varStatus="loop">
					<li class="nav-item" role="presentation">
						<button class="nav-link<c:if test = "${loop.index == 0}"> active</c:if>" id="${course.getName()}-tab" data-bs-toggle="tab" data-bs-target="#${course.getName()}" type="button" role="tab" aria-controls="${course.getName()}" aria-selected="true">${course.getName()}</button>
					</li>
				</c:forEach>
			</ul>
			<div class="tab-content" id="courseTabContent">
				<c:forEach var="course" items="${courseList}" varStatus="loop">
					<div class="tab-pane fade<c:if test = "${loop.index == 0}"> show active</c:if>" id="${course.getName()}" role="tabpanel" aria-labelledby="${course.getName()}-tab">
						<div class="accordion" id="lesson">
							<c:forEach var="lesson" items="${course.getLessons()}" varStatus="loop">
								<div class="accordion-item">
									<h2 class="accordion-header" id="heading-${lesson.getId()}">
										<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${lesson.getId()}" aria-expanded="true" aria-controls="collapse-${lesson.getId()}">
											Lesson - ${lesson.getDate()}
										</button>
									</h2>
									<div id="collapse-${lesson.getId()}" class="accordion-collapse collapse" aria-labelledby="heading-${lesson.getId()}" data-bs-parent="#lesson">
										<div class="accordion-body">
											<div class="text-end"><a class="btn btn-warning btn-sm" type="button" href="./update-attendance?lessonId=${lesson.getId()}"><i class="bi-clipboard-data" style="font-size:15px;"></i> Update Attendance List</a></div>
											<table class="table">
												<thead>
													<tr>
														<th scope="col">No</th>
														<th scope="col">Student Name</th>
														<th scope="col">Attendance</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="attendance" items="${lesson.getAttendances()}" varStatus="attendanceLoop">
														<tr>
															<th scope="row">${attendanceLoop.index+1}</th>
															<td>${attendance.getUser().getName()}</td>
															<td>${attendance.getValue()}</td>
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
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>

</script>