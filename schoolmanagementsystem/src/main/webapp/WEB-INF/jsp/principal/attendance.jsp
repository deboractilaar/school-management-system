<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Student Attendance</h3>
		<div class="w-75 mx-auto py-4">
			<table class="table py-2" id="dataTable">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Lesson Date</th>
						<th scope="col">Course Name</th>
						<th scope="col">Student Name</th>
						<th scope="col">Record</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
						<c:forEach var="lesson" items="${course.getLessons()}" varStatus="lessonLoop">
							<c:forEach var="attendance" items="${lesson.getAttendances()}" varStatus="attendanceLoop">
								<tr>
									<th scope="row">${attendanceLoop.index+1}</th>
									<td>${lesson.getDate()}</td>
									<td>${course.getName()}</td>
									<td>${attendance.getUser().getName()}</td>
									<td>${attendance.getValue()}</td>
								</tr>
								</c:forEach>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
$(document).ready(function () {
    $('#dataTable').DataTable();
});
</script>