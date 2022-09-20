<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="carousel" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="<c:url value="/resources/images/image1.jpg" />"
				class="bd-placeholder-img" width="100%" height="100%" alt="Entrance">
		</div>
		<div class="carousel-item">
			<img src="<c:url value="/resources/images/image2.jpg" />"
				class="bd-placeholder-img" width="100%" height="100%" alt="Library">
		</div>
		<div class="carousel-item">
			<img src="<c:url value="/resources/images/image3.jpg" />"
				class="bd-placeholder-img" width="100%" height="100%" alt="Corridor">
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>
<div class="container">
	<div class="row py-5">
		<div class="col">
			<div class="card shadow-sm">
				<img src="<c:url value="/resources/images/event1.jpg" />" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Entrance">
				<div class="card-body">
					<p class="card-text">National Day is coming! In order to celebrate national day, we holding an event on 5th August 2022. Refreshments will be provided, come join us and have some fun!</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card shadow-sm">
				<img src="<c:url value="/resources/images/event2.jpg" />" class="bd-placeholder-img card-img-top" width="100%" height="225" alt="Entrance">
				<div class="card-body">
					<p class="card-text">Save the Earth! Let's join us and save the world from global warming. We are planting 200 plants on 30 August 2022. Come and join us, we are stronger together.</p>
				</div>
			</div>
		</div>
	</div>
</div>
</div>