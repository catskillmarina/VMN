<?php include 'vars.php'; ?>
<?php
$soundfile = shell_exec("ls $argv[1]*.mp3");
$title = shell_exec("cat $argv[1]title.txt");
$description = shell_exec("cat $argv[1]description.txt");
# Duration not needed for HTML
# $duration = shell_exec("./get_duration.sh $soundfile");
# len not needed for HTML
# $len = shell_exec("./get_len.sh $soundfile");
$date = shell_exec("./get_date.sh $argv[1]date.txt");
# $length = preg_replace("/\r\n|\r|\n/", '', $len);
$weburl = preg_replace('/WEBROOT/', '' , $soundfile);
?>
        <p>
        <hr/>
                <h1><?php echo $title?></h1>
                <br/>
                <A HREF="<?php echo $baseurl?><?php echo $weburl ?>">
                   <?php echo $baseurl?><?php echo $weburl ?>
                </A>
                <br/>&nbsp;<br/>
                Published: <?php echo $date?>
                <br/>&nbsp;<br/>
                Description: <?php echo $description ?>
        </p>
