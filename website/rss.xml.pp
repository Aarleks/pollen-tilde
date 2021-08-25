#lang pollen

<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/css" href="rss.css" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
	<title>Alex Norman</title>
	<description>Recent stuff at alexnorman.xyz</description>
	<language>en-au</language>
	<link>https://alexnorman.xyz/</link>
	<atom:link href="https://alexnorman.xyz/rss.xml" rel="self" type="application/rss+xml" />


◊(->html (post-list 'blog-list))

</channel>
</rss>
