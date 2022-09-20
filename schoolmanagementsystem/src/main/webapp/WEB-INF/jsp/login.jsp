<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<div class="container d-flex" style="padding:150px 0; background-color: #f5f5f5;">
	<main class="form-signin w-100 m-auto" style="max-width: 330px;">
		<form:form method="post" action="login" modelAttribute="user" class="needs-validation" novalidate="true">
			<img class="mb-5" src="<c:url value="/resources/images/logo.png"/>" alt="Lokon Academy" width="250px">
			<c:if test="${fail == true}">
			<div class="alert alert-danger" role="alert">
			  Invalid Email and Password!
			</div>
		</c:if>
			<div class="form-floating">
				<form:input path="email" type="email" class="form-control" placeholder="Email Address" required="required"/>
				<label for="floatingInput">Email Address</label>
				<div class="invalid-feedback">Please enter your Email Address</div>
			</div>
			<div class="form-floating mt-3">
				<form:input path="password" type="password" class="form-control" placeholder="Password" required="required"/>
				<label for="floatingPassword">Password</label>
				<div class="invalid-feedback">Please enter your Password</div>
			</div>
			<button class="w-100 btn btn-lg btn-primary mt-5" type="submit">Login</button>
		</form:form>
	</main>
</div>

<script>
	var form = document.forms[0];
	form.addEventListener('submit', function (event) {
	    if (!form.checkValidity()) {
	      event.preventDefault();
	      event.stopPropagation();
	    }
	    form.classList.add('was-validated');
	}, false);
</script>