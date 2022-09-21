<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/student-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Attendance</h3>
		<div class="w-75 mx-auto">
			<ul class="nav nav-tabs" id="courseTab" role="tablist">
				<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
				<li class="nav-item" role="presentation">
					<button
						class="nav-link<c:if test = "${courseLoop.index == 0}"> active</c:if>"
						id="${course.getName()}-tab" data-bs-toggle="tab"
						data-bs-target="#${course.getName()}" type="button" role="tab"
						aria-controls="${course.getName()}" aria-selected="true">${course.getName()}</button>
				</li>
				</c:forEach>
			</ul>
			<div class="tab-content" id="courseTabContent">
				<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
					<div class="tab-pane fade<c:if test = "${courseLoop.index == 0}"> show active</c:if>" id="${course.getName()}" role="tabpanel" aria-labelledby="${course.getName()}-tab">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">Lesson Date</th>
									<th scope="col">Attendance</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lesson" items="${course.getLessons()}" varStatus="lessonLoop">
									<c:forEach var="attendance" items="${lesson.getAttendances()}" varStatus="attendanceLoop">
									<tr>
										<th scope="row">${lessonLoop.index+1}</th>
										<td>${lesson.getDate()}</td>
										<td>${attendance.getValue()}</td>
									</tr>
									</c:forEach>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>