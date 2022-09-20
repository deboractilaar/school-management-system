<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-5 pb-3">List of Grades</h3>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<c:forEach var="course" items="${courseList}" varStatus="loop">
				<li class="nav-item" role="presentation">
					<button class="nav-link <c:if test = "${loop.index == 0}"> active</c:if>" id="${course.getName()}-tab" data-bs-toggle="tab" data-bs-target="#${course.getName()}" type="button" role="tab" aria-controls="${course.getName()}" aria-selected="true">${course.getName()}</button>
				</li>
			</c:forEach>
		</ul>
		<div class="tab-content" id="myTabContent">
			<c:forEach var="course" items="${courseList}" varStatus="loop">
				<div class="tab-pane fade <c:if test = "${loop.index == 0}"> show active</c:if>" id="${course.getName()}" role="tabpanel" aria-labelledby="${course.getName()}-tab">
					<div class="text-end mt-3"><a class="btn btn-warning btn-sm" type="button" href="./update-grades?courseId=${course.getId()}"><i class="bi-clipboard-data" style="font-size:15px;"></i> Update Grade List</a></div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Student Name</th>
								<th scope="col">Mark</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="grade" items="${course.getGrades()}" varStatus="gradeLoop">
								<tr>
									<th scope="row">${gradeLoop.index+1}</th>
									<td>${grade.getUser().getName()}</td>
									<td>${grade.getMark()}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
</div>