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
	</head>
	<%@ page import="java.sql.*" %>
	<body class="no-sidebar">
	<%
	String username= (String) session.getAttribute("thename");
	String team= (String) session.getAttribute("thehead");
	int idplayer= (int) session.getAttribute("theidplayer");
	String juga = "jugador"+idplayer;
	int pokeid=0;
	String pokename="";
	String poketype="";
	String pokelevel="";
	String pokeatt1="";
	String pokeatt2="";
	
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
								<li><a href="userinfo.html">Pokemons</a></li>
							</ul>
						</nav>

				</div>

<!-- Carousel -->
				<section class="carousel">
					<div class="reel">

					<%
					    Class.forName("com.mysql.jdbc.Driver");

    				Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/unpokemon","root","");

    				Statement instruccion = conexion.createStatement();		
					ResultSet pokeinfo = instruccion.executeQuery("select j.Attack1, j.Attack2, j.level, p.Type, p.Pokemon from jugador2 as j , pokedex as p where p.IDPokemon=j.IDpkcaught " );

		            while(pokeinfo.next()){	
		            //pokeid=pokeinfo.getInt("IDpkcaught");
					pokeatt1=pokeinfo.getString("Attack1");
		            pokeatt2=pokeinfo.getString("Attack2");
		            pokelevel=pokeinfo.getString("level");
		            pokename=pokeinfo.getString("Pokemon");
		            poketype=pokeinfo.getString("Type");
		            //ResultSet poked = instruccion.executeQuery("SELECT * FROM unpokemon.pokedex where IDPokemon='"+pokeid+"'"  );
		            //while(poked.next()){pokename=poked.getString("Pokemon");poketype=poked.getString("Type");}

		            String image="images/"+pokename+".gif";

					%>
						<article>
							<img src="<%= image%>" style="width:15% height:10%">
							<header>
								<h3>Nombre: <%= pokename%> <br> Lv: <%= pokelevel%> Tipo: <%= poketype%></h3>
							</header>
							<p>Ataques: <br> <%= pokeatt1%> <br> <%= pokeatt2%></p>
						</article>
					<%
					}

					%>

					</div>
				</section>

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

	</body>
</html>