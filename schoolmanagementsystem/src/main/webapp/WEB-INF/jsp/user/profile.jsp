<div class="container-fluid p-5" style="min-height:80vh; background-image:url('../resources/images/principal-background.jpg'); background-size:contain;">
	<div class="container p-5 bg-light" style="min-height:65vh;">
		<h3 class="text-center pt-3 pb-5">Profile</h3>
		<div class="row justify-content-center w-50 mx-auto">
			<table class="table">
				<tbody>
					<tr>
						<th class="col-4" scope="row">Name</th>
						<td>${user.getName()}</td>
					</tr>
					<tr>
						<th scope="row">Date of Birth</th>
						<td>${user.getDob()}</td>
					</tr>
					<tr>
						<th scope="row">Gender</th>
						<td>${user.getGender()}</td>
					</tr>
					<tr>
						<th scope="row">Email</th>
						<td>${user.getEmail()}</td>
					</tr>
					<tr>
						<th scope="row">Contact Number</th>
						<td>${user.getPhone()}</td>
					</tr>
					<tr>
						<th scope="row">Password</th>
						<td>${user.getPassword()}</td>
					</tr>
					<tr>
						<th scope="row">Address</th>
						<td>${user.getAddress()}</td>
					</tr>
				</tbody>
			</table>
			<a class="btn btn-primary btn-sm col-3 mx-auto my-3" href="./profile?action=update" role="button">Update Profile</a>
		</div>
	</div>
</div>