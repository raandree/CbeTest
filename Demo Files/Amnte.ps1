$d | get-member -name addticks
$d.addticks(-$d.ticks)
$timespan = new-timespan -Seconds 600000
$d-$timespan
$d1 =get-date
$d2 =get-date -Date 1.1.2023
$d1
$d2-$d1
    
