<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

		
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle"></h5>
				</div>
				<div class="modal-body">
					<div id="modalMessage"></div>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-primary" data-bs-dismiss="modal" id="modalCancel">Cancel</a>
					<a type="button" class="btn btn-danger" id="modalSubmit"></a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		const modal = document.getElementById('modal')
		modal.addEventListener('show.bs.modal', event => {
			const element = event.relatedTarget;
			const title = element.getAttribute('data-bs-title');
			const message = element.getAttribute('data-bs-message');
			const href = element.getAttribute('data-bs-href');
			const submit = element.getAttribute('data-bs-submit');

			modal.querySelector('#modalTitle').textContent = title;
			modal.querySelector('#modalMessage').innerHTML = message;
			modal.querySelector('#modalSubmit').href = href;
			modal.querySelector('#modalSubmit').innerHTML = submit;
		})
	</script>
	
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<div>
		<tiles:insertAttribute name="body" />
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>