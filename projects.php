<!doctype html>
<html class="no-js" lang="fr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Mes projets</title>
	<meta name="description" content="Site personnel de Julien Giovaresco, Ingénieur Logiciel"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

	<link rel="shortcut icon" href="favicon.ico"/>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>
	<!--[if lt IE 8]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your
		browser</a> to improve your experience.</p>
	<![endif]-->

	<?php include("./layout/header.php") ?>

	<div class="container projects">
		<h1>Mes projets</h1>

		<p>
			Cette page recense les différents projets que j'ai pu créer pour mes propres besoins ou simplement pour
			pratiquer
			un nouveau framework.
		</p>

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Jehan</h3>
			</div>

			<div class="panel-body">
				<p>Application permettant de gérer les jobs de plusieurs serveurs Jenkins. Elle contient les fonctionnalités
					suivantes</p>
				<ul>
					<li>Une page d'accueil affichant les jobs KO de tous les serveurs Jenkins configurés</li>
					<li>Une page affichant les serveurs Jenkins configurés</li>
					<li>Une page affichant les jobs des serveurs Jenkins configurés</li>
				</ul>
				<p>Cette application m'a permis de pratiquer AngularJS</p>

				<p><strong>Technologies :</strong> AngularJS, Jersey, CSS3</p>

				<p>Les sources sont disponibles sur <a href="https://github.com/jgiovaresco/jehan">Github</a></p>
			</div>
		</div>

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Concours Flèches</h3>
			</div>
			<div class="panel-body">
				<p>Application permettant de gérer des concours de tir à l'arc</p>
				<ul>
					<li>Création du pas de tir</li>
					<li>Renseignement des résultats et calcul du classement</li>
					<li>Gestion des archers</li>
				</ul>
				<p><strong>Technologies :</strong> Java, Tapestry5</p>

				<p>Les sources sont disponibles sur <a href="https://github.com/jgiovaresco/concours-fleches">Github</a></p>
			</div>
		</div>
	</div>

	<?php include("./layout/footer.php") ?>
</body>
</html>
