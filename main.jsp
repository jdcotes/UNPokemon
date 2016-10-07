<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Catch The Pokemon!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/mainn.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<style>
		#map{
			display: none;
		}    
        #map1 {
          height: 400px;
          width: 100%;
        }
    </style>
	</head>

	<body class="no-sidebar">
	<%
	String pokename= (String) session.getAttribute("Pokename");
	String poketype= (String) session.getAttribute("Tipo");
	String pokelevel= (String) session.getAttribute("theLevel");
	String image="images/"+pokename+".gif";
	String username= (String) session.getAttribute("thename");
	String team= (String) session.getAttribute("thehead");
	%>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="<%= team%>">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="index.html" id="logo"><%= username%></a></h1>
							</header>
						</div>

					<!-- Nav -->
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="regist.html">Registrarse</a></li>
								<li><a href="about.html">Sobre..</a></li>
								<li><a href="userinfo.jsp">Pokemons</a></li>
								<li><a href="main.jsp">Mapa</a></li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<article id="main" class="special">
							<header>
								<h2>Mapa</h2>
							</header>
							<center>
							    <div id="map1"></div>
   								<div id="map"></div>
							</center>
						</article>
					</div>
				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<div class="12u">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>¿Algun problema?</h3>
										</header>
										<p>Siguenos en redes:</p>
										<ul class="icons">
											<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.onvisible.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
		    <script async defer
		      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsFelqvBHeiBZ9KEmCJ31cVXQjdo0aASk&callback=initMap">
		    </script>
		    <script type="text/javascript">
		      var map2;

		      function initMap() {
		        map2 = new google.maps.Map(document.getElementById('map1'), {
		          center: {lat: 11.019195, lng: -74.850409},
		          zoom: 17
		        });
		      }
		      var auto_refresh = setInterval(function (){$('#map').load('pokemap.jsp').fadeIn("slow");}, 300000);
		      {$('#map').load('pokemap.jsp').fadeIn("slow");}

		    </script>
		    <input type= text value = "0"  id="control" style="display: none" />

	</body>
</html>