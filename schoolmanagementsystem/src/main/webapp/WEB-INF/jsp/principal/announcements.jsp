<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Announcements</h3>
		<div class="py-4">
			<table class="table py-2" id="dataTable">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Course Name</th>
						<th scope="col">Posted by</th>
						<th scope="col">Title</th>
						<th scope="col">Detail</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="announcement" items="${announcementList}" varStatus="announcementLoop">
						<tr>
							<th scope="row">${announcementLoop.index+1}</th>
							<td>${announcement.getCourse().getName()}</td>
							<td>${announcement.getTeacher().getName()}</td>
							<td>${announcement.getTitle()}</td>
							<td>${announcement.getDetail()}</td>
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