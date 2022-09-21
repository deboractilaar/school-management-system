<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Users</h3>
		<div class="d-flex justify-content-between border-bottom">
			<ul class="nav nav-tabs border-0" role="tablist">
				<c:forEach var="user" items="${userList}" varStatus="userLoop">
					<li class="nav-item" role="presentation">
						<button class="nav-link m-1 <c:if test = "${userLoop.index == 0}"> active</c:if>" id="${user.getKey()}-tab" data-bs-toggle="tab" data-bs-target="#${user.getKey()}" role="tab" aria-controls="${user.getKey()}" aria-selected="true" onclick="dataTable()">${user.getKey()}</button>
					</li>
				</c:forEach>
			</ul>
			<ul class="nav nav-tabs border-0">
				<li class="nav-item">
					<a class="btn btn-warning btn-sm" type="button" href="./add-user"><i class="bi-person-plus-fill" style="font-size:15px;"></i> Add New User</a>
				</li>
			</ul>
		</div>
		<div class="tab-content">
			<c:forEach var="user" items="${userList}" varStatus="userLoop">
				<div class="tab-pane fade <c:if test = "${userLoop.index == 0}"> show active</c:if> py-4" id="${user.getKey()}" role="tabpanel" aria-labelledby="${user.getKey()}-tab">
					<table class="table py-2" id="dataTable${userLoop.index+1}">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Date of Birth</th>
								<th scope="col">Address</th>
								<th scope="col">Email</th>
								<th scope="col">Phone</th>
								<th class="col-1" scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${user.getValue()}">
							<c:set var="userId" scope="page" value="${user.getId()}"/>
							<c:set var="userName" scope="page" value="${user.getName()}"/>
							<tr>
								<th scope="row">${user.getId()}</th>
								<td>${user.getName()}</td>
								<td>${user.getGender()}</td>
								<td>${user.getDob()}</td>
								<td>${user.getAddress()}</td>
								<td>${user.getEmail()}</td>
								<td>${user.getPhone()}</td>
								<td class="col-2">
									<a class="btn btn-primary btn-sm col-4" href="./update-user?userId=${user.getId()}" type="button">Update</a>
									<a class="btn btn-danger btn-sm col-4" data-bs-toggle="modal" data-bs-target="#modal"
									data-bs-title="Delete User" data-bs-message="Are you sure you want to delete ${user.getName()}?"
									data-bs-href="./delete-user?userId=${user.getId()}" data-bs-submit="Delete" role="button">Delete</a>
								</td>
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