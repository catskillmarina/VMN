<html>
<?php include 'vars.php'; ?>
<head>
<title><?php echo $title?></title>
</head>

<body>
<center><h1><?php echo $heading?></h1>
<img src="<?php echo $baseurl?><?php echo $image?>">
</center>
<hr/>

<A href="<?php echo $baseurl ?>"><?php echo $baseurl ?></a>

Subscribe at: <A href="<?php echo $baseurl?>/feed/podcast/"><?php echo $baseurl?>/feed/podcast/</a> 
<img src="./Rss.png" decoding="async" width="32" height="32" class="mw-file-element" data-file-width="32" data-file-height="32" /></a>

<?php $listings = shell_exec("./create-new-html-listings.sh"); ?>
<?php echo $listings; ?>

<hr/>
<p><br/>&nbsp;<br/></p>

</body>
</html>
