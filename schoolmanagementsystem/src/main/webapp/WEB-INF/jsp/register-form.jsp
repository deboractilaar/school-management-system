<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container my-5 p-5 bg-light">
	<h3 class="text-center py-3">List of Student Attendance</h3>
	<div class="container my-5 p-5 bg-light">
		<ul class="nav nav-tabs" id="courseTab" role="tablist">
			<c:forEach var="lesson" items="${lessonList}" varStatus="loop">
			<li class="nav-item" role="presentation">
				<button
					class="nav-link<c:if test = "${loop.index == 0}"> active</c:if>"
					id="${lesson.getKey()}-tab" data-bs-toggle="tab"
					data-bs-target="#${lesson.getKey()}" type="button" role="tab"
					aria-controls="${lesson.getKey()}" aria-selected="true">${lesson.getKey()}</button>
			</li>
			</c:forEach>
		</ul>
		<div class="tab-content" id="courseTabContent">
			<c:forEach var="lesson" items="${lessonList}" varStatus="loop">
				<div
					class="tab-pane fade<c:if test = "${loop.index == 0}"> show active</c:if>"
					id="${lesson.getKey()}" role="tabpanel"
					aria-labelledby="${lesson.getKey()}-tab">
					<div class="container-fuild pt-4 bg-light">
						<ul class="nav nav-tabs" id="lessonTab" role="tablist">
							<c:forEach var="eachLesson" items="${lesson.getValue()}" varStatus="loop">
							<li class="nav-item" role="presentation">
								<button
									class="nav-link<c:if test = "${loop.index == 0}"> active</c:if>"
									id="${eachLesson.getId()}-tab" data-bs-toggle="tab"
									data-bs-target="#${eachLesson.getId()}" type="button" role="tab"
									aria-controls="${eachLesson.getId()}" aria-selected="true">Lesson ${eachLesson.getId()}</button>
							</li>
							</c:forEach>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="update-tab" data-bs-toggle="tab"
									data-bs-target="#update" type="button" role="tab" aria-controls="update"
									aria-selected="false">
									<i class="bi-plus-circle" style="font-size: 15px;"></i> Update Attendance
								</button>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<c:forEach var="eachLesson" items="${lesson.getValue()}" varStatus="loop">
								<div
									class="tab-pane fade<c:if test = "${loop.index == 0}"> show active</c:if>"
									id="${eachLesson.getId()}" role="tabpanel"
									aria-labelledby="${eachLesson.getId()}-tab">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Student ID</th>
												<th scope="col">Lesson ID</th>
												<th scope="col">Record</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="attendance" items="${attendanceList.get(eachLesson.getId())}">
												<tr>
													<th scope="row">${attendance.getId()}</th>
													<td>${attendance.getUser().getId()}</td>
													<td>${attendance.getLesson().getId()}</td>
													<td>${attendance.getValue()}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:forEach>
							<div class="tab-pane fade" id="update" role="tabpanel"
								aria-labelledby="update-tab">
								<div class="container">
									<div class="py-5 text-center">
										<h2>Attendance List</h2>
									</div>
									<form:form method="post" action="addAttendanceList" modelAttribute="newAttendance">
										<div class="row pb-4 justify-content-center">
											<div class="col-6">
												<label for="lesson" class="form-label fw-bolder">Lesson</label>
												<form:select class="form-select" path="lesson.id">
													<c:forEach var="showlLesson" items="${attendanceList.getKey()}">
														<option value="${showlLesson.getId()}">${showlLesson.getId()}</option>
													</c:forEach>
												</form:select>
											</div>
										</div>
										<div class="row pb-4 justify-content-center">
											<div class="col-6">
											<c:forEach var="student" items="${studentList.get(lesson.getKey()}">
												<c:forEach var="eachStudent" items="${student}">
													<label class="form-label fw-bolder">${eachStudent.getName()}</label>
													<div>
														<div class="form-check form-check-inline">
															<form:radiobutton class="form-check-input" path="value" value="present"/>
															<label class="form-check-label" for="present"></label>
														</div>
														<div class="form-check form-check-inline">
															<form:radiobutton class="form-check-input" path="value" value="absent"/>
															<label class="form-check-label" for="absent"></label>
														</div>
													</div>
												</c:forEach>
											</c:forEach>
											</div>
										</div>
										<div class="d-grid col-2 mx-auto py-3 d-md-block">
											<button class="btn btn-primary" type="submit" name="submit">Update</button>
											<button class="btn btn-outline-primary" type="submit" name="cancel">Cancel</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>