<?php include 'vars.php'; ?>
<?php $date = shell_exec("./get_date2.sh"); ?>
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wfw="http://wellformedweb.org/CommentAPI/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
	xmlns:slash="http://purl.org/rss/1.0/modules/slash/"
	xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
xmlns:podcast="https://podcastindex.org/namespace/1.0"
xmlns:rawvoice="https://we-wont-promote-this/developer/rawvoice-rss/"
>
<channel>
	<title>Vermont Movement News</title>
	<atom:link href="<?php echo $baseurl?>/feed/podcast/" rel="self" type="application/rss+xml" />
	<link><?php echo $baseurl?></link>
	<description>News and Analysis</description>
	<lastBuildDate><?php echo $date; ?></lastBuildDate>
	<language>en-US</language>
	<sy:updatePeriod>hourly</sy:updatePeriod>
	<sy:updateFrequency>1</sy:updateFrequency>
		<generator>Custom Script</generator>
	<atom:link rel="hub" href="https://pubsubhubbub.appspot.com/" />
	<itunes:author>Vermont Movement News</itunes:author>
	<itunes:explicit>true</itunes:explicit>
	<itunes:image href="<?php echo $baseurl?>/wp-content/uploads/2019/07/vermontmovementnews-cover-art.png" />
	<itunes:type>episodic</itunes:type>
	<itunes:owner>
		<itunes:name>Vermont Movement News</itunes:name>
		<itunes:email>catskillmarina@gmail.com</itunes:email>
	</itunes:owner>
	<podcast:medium>podcast</podcast:medium>
	<image>
		<title>Vermont Movement News</title>
		<url><?php echo $baseurl?>/wp-content/uploads/2019/07/vermontmovementnews-cover-art.png</url>
		<link><?php echo $baseurl?></link>
	</image>
	<rawvoice:location>NDakina</rawvoice:location>
	<podcast:location rel="subject">NDakina</podcast:location>
	<podcast:podping usesPodping="true" />
	<podcast:guid>2f488c99-28a1-5eb4-a3cd-e00f3d414249</podcast:guid>
