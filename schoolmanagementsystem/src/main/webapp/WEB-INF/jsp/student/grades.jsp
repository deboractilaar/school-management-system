<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/student-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">List of Grades</h3>
		<div class="w-50 mx-auto py-4">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">Course Name</th>
						<th scope="col">Mark</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="grade" items="${student.getGrades()}" varStatus="gradeLoop">
					<tr>
						<th scope="row">${gradeLoop.index+1}</th>
						<td>${grade.getCourse().getName()}</td>
						<td>${grade.getMark()}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>