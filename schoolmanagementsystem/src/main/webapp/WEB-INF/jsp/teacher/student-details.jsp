<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Students</h3>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<c:forEach var="course" items="${courseList}" varStatus="courseloop">
				<li class="nav-item" role="presentation">
					<button class="nav-link <c:if test = "${courseloop.index == 0}"> active</c:if>" id="${course.getName()}-tab" data-bs-toggle="tab" data-bs-target="#${course.getName()}" type="button" role="tab" aria-controls="${course.getName()}" aria-selected="true" onclick="dataTable()">${course.getName()}</button>
				</li>
			</c:forEach>
		</ul>
		<div class="tab-content" id="myTabContent">
			<c:forEach var="course" items="${courseList}" varStatus="courseloop">
				<div class="tab-pane fade <c:if test = "${courseloop.index == 0}"> show active</c:if> py-4" id="${course.getName()}" role="tabpanel" aria-labelledby="${course.getName()}-tab">
					<table class="table" id="dataTable${courseloop.index+1}">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Date of Birth</th>
								<th scope="col">Address</th>
								<th scope="col">Email</th>
								<th scope="col">Phone</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="student" items="${course.getUsers()}">
							<tr>
								<th scope="row">${student.getId()}</th>
								<td>${student.getName()}</td>
								<td>${student.getGender()}</td>
								<td>${student.getDob()}</td>
								<td>${student.getAddress()}</td>
								<td>${student.getEmail()}</td>
								<td>${student.getPhone()}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	$(document).ready(function () {
		$('#dataTable1').DataTable();
	});
	
	function dataTable() {
		$('#dataTable1').DataTable();
		$('#dataTable2').DataTable();
		$('#dataTable3').DataTable();
	}
</script>