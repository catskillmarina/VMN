<?php include 'vars.php'; ?>
<?php $new = shell_exec("./create-new-rss-listings.sh"); ?>
<?php include 'create-rss-head.php'; ?>
<?php echo $new; ?>
<?php include 'create-rss-footer.php';  ?>
