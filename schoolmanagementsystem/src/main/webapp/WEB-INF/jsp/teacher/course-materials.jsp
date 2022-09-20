<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-5 pb-3">Course Materials</h3>
		<div class="d-flex justify-content-between border-bottom">
			<ul class="nav nav-tabs border-0" role="tablist">
				<c:forEach var="course" items="${courseList}" varStatus="loop">
				<li class="nav-item" role="presentation">
					<button class="nav-link <c:if test = "${loop.index == 0}"> active</c:if>" id="${course.getName()}-tab" data-bs-toggle="tab" data-bs-target="#${course.getName()}" type="button" role="tab" aria-controls="${course.getName()}" aria-selected="true">${course.getName()}</button>
				</li>
				</c:forEach>
			</ul>
			<ul class="nav nav-tabs border-0">
				<li class="nav-item">
					<a class="btn btn-warning btn-sm" type="button" href="./add-material"><i class="bi-person-plus-fill" style="font-size:15px;"></i> Add Material</a>
				</li>
			</ul>
		</div>
		<div class="tab-content" id="myTabContent">
			<c:forEach var="course" items="${courseList}" varStatus="loop">
				<div class="tab-pane fade <c:if test = "${loop.index == 0}"> show active</c:if>" id="${course.getName()}" role="tabpanel" aria-labelledby="${course.getName()}-tab">
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th class="col-8" scope="col">Materials</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="attachment" items="${course.getAttachments()}" varStatus="attachmentLoop">
							<tr>
								<td>${attachmentLoop.index+1}</td>
								<td>
									<a class="nav-link" href="<c:url value="/files/"/>${attachment.getId()}" download>${attachment.getFileName()}</a>
								</td>
								<td>
									<a class="btn btn-danger btn-sm col-4" data-bs-toggle="modal" data-bs-target="#modal"
									data-bs-title="Delete Course Material" data-bs-message="Are you sure you want to delete ${attachment.getFileName()}?"
									data-bs-href="./delete-material?attachmentId=${attachment.getId()}" data-bs-submit="Delete" role="button">Delete</a>
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