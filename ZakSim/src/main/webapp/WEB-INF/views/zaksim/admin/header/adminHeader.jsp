<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZakSim admin</title>
<style>
@font-face {
	font-family: Dohyeon;
	src: url('/resources/fonts/BMDOHYEON_ttf.ttf');
}
@font-face {
	font-family: HannaAir;
	src: url('/resources/fonts/BMHANNAAir_ttf.ttf');
}
</style>

<style>
body {
/* 	font-family: "Lato", sans-serif; */
}

/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 250px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: white;
	overflow-x: hidden;
	padding-top: 20px;
	border-right: 2px solid #ccc;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-family: Dohyeon !important;
	font-size : 20px;
	font-weight: 300;
	color: #818181;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
	font-size: 20px;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #a81919;
}

.sidenav-a:hover {
	text-decoration: none;
}

.dropdown-container a:hover {
	text-decoration: none;
}

/* Main content */
.main {
	margin-left: 250px;
	margin-top: 120px;
/* 	font-size: 20px; /* Increased text to enable scrolling */ */
	padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
	color: #a81919;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: white;
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.sidenav-a {
	margin-bottom: 10px;
}
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://static.pingendo.com/bootstrap/bootstrap-4.1.3.css">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

</head>
<body>

<!-- navbar -->
	<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #8A0303;">
		<a href="" class="btn" style="font-size: xx-large; font-weight: bold; color: white;">ZakSim</a>
		<div class="collapse navbar-collapse justify-content-end">
			<a href="/zaksim/admin/logout" style="font-weight: bold; color: white;">LOGOUT</a>
		</div>
	</nav>
<!-- navbar -->
	
	


<!-- sidenav -->
	<div class="sidenav" style="margin-top: 50px;">
		<div class="row" style="margin-top: 50px;">
			<div class="col-2"></div>
				<div class="col-8">
					<img class="img-fluid d-block rounded-circle" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg" >
				</div>
				<div class="col-2"></div>		
		</div>
		<div class="row text-center" style="margin-top: 15px; margin-bottom: 80px;">
			<div class="col-12"><p>ADMIN</p></div>
		</div>
		<a class="sidenav-a" href="/zaksim/admin/member">회원 관리</a>
		<a class="sidenav-a" href="/zaksim/admin/payment">결제 관리</a>
		<button class="dropdown-btn">
			통계 / 그래프 <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-container">
			<a href="/zaksim/admin/mStatistics">회원</a>
			<a href="/zaksim/admin/cStatistics">도전</a>
			<a href="/zaksim/admin/pStatistics">기부금</a>
		</div>
	</div>
<!-- sidenav -->

	<script>

		/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>