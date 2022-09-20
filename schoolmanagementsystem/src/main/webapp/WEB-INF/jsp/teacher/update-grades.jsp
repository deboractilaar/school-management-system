<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/teacher-background.jpg'); background-size:contain;">
		<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Update ${course.getName()} Grades</h3>
		<form:form method="post" action="./update-grades-submission" modelAttribute="course">
			<div>
				<div class="w-75 mx-auto">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Student ID</th>
								<th scope="col">Student Name</th>
								<th scope="col">Grade</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="student" items="${course.studentList}" varStatus="loop">
						<tr>
							<th scope="row">${student.getId()}</th>
							<td>${student.getName()}</td>
							<td>
							<input type="number" name="studentList[${loop.index}].grade.mark" value="${student.grade.getMark()}" />
							<input type="hidden" name="studentList[${loop.index}].grade.id" value="${student.grade.getId()}" />
							<input type="hidden" name="studentList[${loop.index}].grade.course.id" value="${student.grade.course.getId()}" />
							<input type="hidden" name="studentList[${loop.index}].grade.user.id" value="${student.grade.user.getId()}" />
							</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
				<div class="d-grid col-2 mx-auto py-3 d-md-block">
					<button class="btn btn-primary col-5" type="submit" name="submit">Update</button>
					<a class="btn btn-outline-primary col-5" type="button" onclick="location.href='./grades';">Cancel</a>
				</div>
			</div>
		</form:form>
	</div>
</div>