<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Update Attendance Lesson - ${lesson.getDate()}</h3>
		<form:form method="post" action="./update-attendance-submission" modelAttribute="lesson">
			<div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Student ID</th>
							<th scope="col">Record</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="attendance" items="${lesson.attendanceList}" varStatus="loop">
					<tr>
						<th scope="row">${loop.index+1}</th>
						<td>${attendance.getUser().getName()}</td>
						<td>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="attendanceList[${loop.index}].value" id="persent" value="present"/>
								<label class="form-check-label" for="present">Present</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="attendanceList[${loop.index}].value" id="absent" value="absent"/>
								<label class="form-check-label" for="absent">Absent</label>
							</div>
						</div>
						<input type="hidden" name="attendanceList[${loop.index}].id" value="${attendance.getId()}" />
						<input type="hidden" name="attendanceList[${loop.index}].user.id" value="${attendance.getUser().getId()}" />
						<input type="hidden" name="attendanceList[${loop.index}].lesson.id" value="${attendance.getLesson().getId()}" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				<div class="d-grid col-2 mx-auto py-3 d-md-block">
					<button class="btn btn-primary" type="submit" name="submit">Update</button>
					<a class="btn btn-outline-primary" type="button" onclick="location.href='./lessons';">Cancel</a>
				</div>
			</div>
		</form:form>
	</div>
</div>