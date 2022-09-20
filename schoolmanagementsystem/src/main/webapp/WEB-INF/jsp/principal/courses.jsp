<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Courses</h3>
		<div class="w-75 mx-auto">
			<div class="text-end"><a class="btn btn-warning btn-sm" type="button" href="./add-course"><i class="bi-plus-circle" style="font-size:15px;"></i> Add New Course</a></div>
			<div class="py-4">
				<table class="table py-2" id="dataTable">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Name</th>
							<th scope="col">Detail</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
						<tr>
							<th scope="row">${courseLoop.index+1}</th>
							<td>${course.getName()}</td>
							<td>${course.getDetail()}</td>
							<td class="col-3">
								<a class="btn btn-primary btn-sm col-4" href="./update-course?courseId=${course.getId()}" role="button">Update</a>
								<a class="btn btn-danger btn-sm col-4" data-bs-toggle="modal" data-bs-target="#modal"
								data-bs-title="Delete Course" data-bs-message="Are you sure you want to delete ${course.getName()}?"
								data-bs-href="./delete-course?courseId=${course.getId()}" data-bs-submit="Delete" role="button">Delete</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function () {
    $('#dataTable').DataTable();
});
</script>