#!/bin/bash

# Adjust as needed.
TEXTFILE_COLLECTOR_DIR=/var/lib/node_exporter/textfile_collector/
# Note the start time of the script.
START="$(date +%s)"

# Your code goes here.
set=1
amtool silence query --output=extended > veera.txt

awk 'NR>1 {print $0}' veera.txt > vi.txt

cat /home/cloud_user/vi.txt | while read -r b;
do
                echo $b | awk '{split($0,a," "); print "alert_silence_inf0{Id="a[1]",""matcher="a[2]",""start_Date="a[3]",""start_time="a[4]",""end_Date="a[6]",""end_time="a[7]",""created_by="a[12]",""comment="a[13]"}"" " "1"}'
        done
sleep 10

# Write out metrics to a temporary file.
END="$(date +%s)"


echo "myscript_duration_seconds" $(($END - $START))

echo "myscript_last_run_seconds" $END
