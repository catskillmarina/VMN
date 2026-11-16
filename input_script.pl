#!/usr/bin/perl

$DIRECTORY = "./WEBROOT/episodes";

if (! -d $DIRECTORY)
{
    die "$DIRECTORY does not exist";
}

while ($year !~ /^[1-2][0-9][0-9][0-9]$/)
{
    print "Enter date in 4 digit format - 2026 for example: ";
    $year = <STDIN>;
}
chomp $year;
while ($month !~ /^Jan$|^Feb$|^Mar$|^Apr$|^May$|^Jun$|^Jul$|^Aug$|^Sep$|^Oct$|^Nov$|^Dec$/)
{
    print "Enter month in 3 char format - Feb for example: ";
    $month = <STDIN>;
}
chomp $month;
while ($day !~ /^[0-3]\d$/)
{
    print "Enter day of month in 2 digit format - 04 for example: ";
    $day = <STDIN>;
}
chomp $day;
while ($time !~ /^\d{2}:\d{2}:\d{2}$/)
{
    print "Enter time in 24 hour  format - 04:04:46 for example: ";
    $time = <STDIN>;
    chomp $time;
}
chomp $time;
while ($timezone !~ /^[+-]\d{4}$/)
{
    print "Enter timezone : -0400 for example: ";
    $timezone = <STDIN>;
    chomp $timezone;
}
chomp $timezone;
while ($dayserial !~ /^[0-9][0-9]$/)
{
    print "Enter daily serial of podcast - almost always 00:  ";
    $dayserial = <STDIN>;
    chomp $dayserial;
}

$weekday = `date -d\'$month $day $year\' \'+%a\'`;
chomp $weekday;
$monthnumber = `date -d\'$month $day $year\' \'+%m\'`;
chomp $monthnumber;

$published_date = $weekday.", ".$day." ".$month." ".$year." ".$time." ".$timezone;

$proposed_directory="";
while(! -d $proposed_directory)
{
    $proposed_directory = $DIRECTORY."/".$year."-".$monthnumber."-".$day."-".$dayserial;
    if (-d $proposed_directory)
    {
        $proposed_directory="";
    }
    print "Create $proposed_directory y/n: ";
    $pprompt = <STDIN>;
    chomp $pprompt;
    if( $pprompt =~ /^y$/)
    {
        mkdir "$proposed_directory/";
        print "Created $proposed_directory/\n";
    }
    if( $pprompt =~ /^n$/)
    {
        $proposed_directory="";
    }
}


open(FH,">",$proposed_directory."/"."date.txt");
print FH $published_date;
close FH;

$titlefile = $proposed_directory."/"."title.txt";
print "$titlefile\n";
open(FH, ">", $titlefile) or die "Cannot open file '$titlefile' for reading: $!";
print "Enter title: ";
$line = <STDIN>;
chomp $line; # Removes the newline character
print FH "$line";
close FH;

print "Enter the description line by line. end with ^EOF$\n\n";
$line = "";
$description = "";
while ($line !~ /^EOF$/)
{
    $line = <STDIN>;
    if($line !~ /^EOF$/)
    {
        $description = $description . $line;
    }
}
open(FH,">",$proposed_directory."/"."description.txt");
print FH $description;
close FH;

$scheck = "";
$num_mp3s = 0;
while( ($scheck !~ /MPEG/) && 
       ($scheck !~ /Audio file/) && 
       ($scheck !~ /\.mp3/) &&
       ($num_mp3s != 1)
     )
{
    print "Please open another terminal and \n";
    print "move the podcast mp3 file into\n";
    print "$proposed_directory.\n\n";
    print "TOP: $num_mp3s\n";

    print "Press enter when this is done.";
    $foo = <STDIN>;


    opendir(DIR,"$proposed_directory") or die "no $proposed_directory\n";
    while ( $entry = readdir( DIR ) ) 
    {
        print "Entry $entry\n";
        if ($entry =~ /\.mp3/)
        {
            $scheck = `file $entry`;
            $num_mp3s ++;
            if( $num_mp3s != 1 )
            {
                print "Too many mp3 files !!\nThere are $num_mp3s. Select only one !!\n";
            }
        }
    }
    closedir(DIR) ;
}

    

print <<EOF;

Check that all files needed are in the directory.
If something is missing fix it before running
create-upload.sh .

EOF

