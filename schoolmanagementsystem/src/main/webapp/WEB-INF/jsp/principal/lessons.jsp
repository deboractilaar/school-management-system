<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Lessons</h3>
		<div class="text-end"><a class="btn btn-warning btn-sm" type="button" href="./add-lesson"><i class="bi-plus-circle" style="font-size:15px;"></i> Add New Lesson</a></div>
		<div class="py-4">
			<table class="table py-2" id="dataTable">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Date</th>
						<th scope="col">Course</th>
						<th scope="col">Start Time</th>
						<th scope="col">End Time</th>
						<th scope="col">Class Room</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lesson" items="${lessonList}" varStatus="lessonLoop">
					<tr>
						<th scope="row">${lessonLoop.index+1}</th>
						<td>${lesson.getDate()}</td>
						<td>${lesson.getCourse().getName()}</td>
						<td>${lesson.getStartTime()}</td>
						<td>${lesson.getEndTime()}</td>
						<td>${lesson.getClassRoom()}</td>
						<td class="col-2">
							<a class="btn btn-primary btn-sm col-4" href="./update-lesson?lessonId=${lesson.getId()}" role="button">Update</a>
							<a class="btn btn-danger btn-sm col-4" data-bs-toggle="modal" data-bs-target="#modal"
							data-bs-title="Delete Lesson" data-bs-message="Are you sure you want to delete lesson on ${lesson.getDate()}?"
							data-bs-href="./delete-lesson?lessonId=${lesson.getId()}" data-bs-submit="Delete" role="button">Delete</a>
						</td>
					</tr>
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