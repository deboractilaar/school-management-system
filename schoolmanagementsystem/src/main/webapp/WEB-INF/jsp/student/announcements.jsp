<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/student-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Announcements</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Course Name</th>
					<th scope="col">Posted by</th>
					<th scope="col">Title</th>
					<th scope="col">Detail</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${courseList}" varStatus="courseLoop">
					<c:forEach var="announcement" items="${course.getAnnouncements()}" varStatus="announcementLoop">
					<tr>
						<td>${course.getName()}</td>
						<td>${announcement.getTeacher().getName()}</td>
						<td>${announcement.getTitle()}</td>
						<td>${announcement.getDetail()}</td>
					</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>