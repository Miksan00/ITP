<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>
<style type="text/css">
body, html {
	height: 100%;
}

nav.sidebar {
	-webkit-transition: margin 200ms ease-out;
	-moz-transition: margin 200ms ease-out;
	-o-transition: margin 200ms ease-out;
	transition: margin 200ms ease-out;
}

.bkgnd {
	background-color: #d9edf7;
	color: #428bca;
}

.colsm12 {
	position: relative;
	min-height: 1px;
	width: 100%;
	float: left;
}

@media ( min-width : 320px) {
	nav.sidebar:hover+.main {
		margin-left: 200px;
	}
	nav.sidebar .navbar-brand, nav.sidebar .navbar-header {
		text-align: center;
		width: 100%;
		margin-left: 0px;
	}
	nav.sidebar a {
		padding-right: 13px;
	}
	.sideNav>li:first-child {
		border-top: 1px #e5e5e5 solid;
	}
	nav.sidebar .sideNav>li {
		border-bottom: 1px #e5e5e5 solid;
	}
	nav.sidebar .sideNav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: transparent;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	nav.sidebar, nav.sidebar .container-fluid {
		padding: 0 0px 0 0px;
	}
	.navbar-inverse .sideNav .open .dropdown-menu>li>a {
		color: #777;
	}
	nav.sidebar {
		width: 200px;
		height: 100%;
		margin-left: -160px;
		float: left;
		margin-bottom: 0px;
	}
	nav.sidebar li {
		width: 100%;
	}
	nav.sidebar:hover {
		margin-left: 0px;
	}
	.forAnimate {
		opacity: 0;
	}
}

@media ( min-width : 1330px) {
	nav.sidebar {
		margin-left: 0px;
		float: left;
	}
	nav.sidebar .forAnimate {
		opacity: 1;
	}
}

nav.sidebar .sideNav .open .dropdown-menu>li>a:hover, nav.sidebar .sideNav .open .dropdown-menu>li>a:focus
	{
	color: #CCC;
	background-color: transparent;
}

.sideNav>li:first-child {
	border-top: 1px #e5e5e5 solid;
}

nav:hover .forAnimate {
	opacity: 1;
}
</style>
</head>

<nav class="sidebar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header bkgnd">
			<h4>Records</h4>
		</div>
		<div class="colsm12" id="">
			<ul class="sideNav nav navbar">
				<li><a href="#">Home<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-home"></span></a></li>
				<li><a href="#">Inventory<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-th-list"></span></a></li>
				<li><a href="#">Employees<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-tags"></span></a></li>
				<li><a href="#">Veichles<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-th-list"></span></a></li>
				<li><a href="#">Rooms<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-tags"></span></a></li>
				<li><a href="#">BanquetHall<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-th-list"></span></a></li>
				<li><a href="#">Finance<span style="font-size: 16px;"
						class="pull-right showopacity glyphicon glyphicon-tags"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
<body>


</body>
</html>