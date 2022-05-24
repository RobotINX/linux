awk -F : '{print $1,$7}' /etc/passwd
awk -F ':' 'BEGIN {print "start1,start7"} {print $1 "," $7} END {print "end1,end7"}' /etc/passwd