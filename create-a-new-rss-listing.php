<?php include 'vars.php'; ?>
<?php
$soundfile = shell_exec("ls $argv[1]*.mp3");
$title = shell_exec("cat $argv[1]title.txt");
$description = shell_exec("cat $argv[1]description.txt");
$basedir = $argv[1];
$duration = shell_exec("cat $argv[1]duration.txt");

$len = shell_exec("./get_len.sh $soundfile");
$date = shell_exec("./get_date.sh $argv[1]date.txt");
$length = preg_replace("/\r\n|\r|\n/", '', $len);

$weburl = preg_replace('/WEBROOT/', '' , $soundfile);
?>
        <item>
                <title><?php echo $title?></title>
                <link><?php echo $baseurl?><?php echo $weburl ?></link>
                <pubDate><?php echo $date?></pubDate>
                <guid isPermaLink="false"><?php echo $baseurl?><?php echo $weburl ?></guid>
                <description><![CDATA[
<?php echo $description ?>]]></description>
                <enclosure url="<?php echo $baseurl?><?php echo $weburl ?>" length="<?php echo $length ?>" type="audio/mpeg" />
                <itunes:author>Vermont Movement News</itunes:author>
                <itunes:episodeType>full</itunes:episodeType>
                <itunes:explicit>false</itunes:explicit>
                <itunes:duration><?php echo $duration+1 ?></itunes:duration>
        </item>
