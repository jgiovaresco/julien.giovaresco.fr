<!doctype html>
<html class="no-js" lang="fr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>CV Julien Giovaresco</title>
	<meta name="description" content="CV de Julien Giovaresco, Ingénieur Logiciel"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

	<link rel="shortcut icon" href="favicon.ico"/>
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/resume.css"/>
</head>
<body>
	<!--[if lt IE 8]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your
		browser</a> to improve your experience.</p>
	<![endif]-->

	<?php include("./layout/header.php") ?>

	<div class="container">
		<?php

		$xslFile = './xsl/resume-html.xsl';
		$resumeFile = 'https://raw.githubusercontent.com/jgiovaresco/my-resume/master/xml/resume_fr.xml';

		$xsl = new DOMDocument();
		$xsl->load($xslFile);

		$xslt = new XSLTProcessor();
		$xslt->importStylesheet($xsl);

		$xml = new DOMDocument();
		$xml->load($resumeFile);

		print $xslt->transformToXML($xml);

		?>
	</div>

	<?php include("./layout/footer.php") ?>
</body>
</html>
