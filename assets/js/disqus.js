document.addEventListener('DOMContentLoaded', function() {
	disqus_shortname = document.getElementById('disqus_shortname').value.trim();
	disqus_identifier = document.getElementById('disqus_identifier').value.trim();
	//disqus_developer = 0; // 1 for testing
	disqus_url = window.location.origin + window.location.pathname;
	var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
	dsq.src = '//'+disqus_shortname+'.disqus.com/embed.js';
	(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
}, false);