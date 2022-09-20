<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container pt-3 pb-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center py-5">List of Student Grades</h3>
		<div class="w-75 mx-auto py-4">
			<table class="table py-2" id="dataTable">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Course Name</th>
						<th scope="col">Student Name</th>
						<th scope="col">Mark</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="grade" items="${gradeList}" varStatus="gradeLoop">
					<tr>
						<th scope="row">${gradeLoop.index+1}</th>
						<td>${grade.getCourse().getName()}</td>
						<td>${grade.getUser().getName()}</td>
						<td>${grade.getMark()}</td>
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