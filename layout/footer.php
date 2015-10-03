<footer>
	<div class="text-center">

		<a href="http://validator.w3.org/check?uri=referer">
			<img src="../images/html5.png" alt="Valid HTML!"/>
		</a>
		<a rel="license" href="http://creativecommons.org/licenses/by-nd/3.0/"
		   title="Cette création est mise à disposition sous un contrat Creative Commons.">
			<img src="http://i.creativecommons.org/l/by-nd/3.0/80x15.png" alt="Creative Commons License"/>
		</a>

		<p>CSS <a href="http://bootswatch.com/flatly/">Bootswatch Flatly</a></p>
	</div>
</footer>

<script>
	if (location.search) {
		param = location.search.split("param=")[1];
		// Verify the url is like http://example.com?param=true and then set exclude dimension
		if (param) {
			document.cookie = 'exclude_admin=true; expires=Fri, 01 Jan 2110 00:0:00 UTC; path=/'
		}
	}
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-64329016-2', 'auto');
	if (document.cookie.indexOf("exclude_admin") >= 0) {
		ga('set', 'dimension1', 'true');
	}	
	ga('send', 'pageview');

</script>