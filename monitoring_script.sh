#!/bin/bash

# Date and time
date_time=$(date +"date = %Y/%m/%d_%H:%M:%S")


# CPU Usage
cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{printf "Total CPU usage is = %.1f%%", 100 - $8}')

# Memory Usage
memory_usage=$(top -b -n1 | grep "MiB Mem" | awk '{printf "Total memory used = %.1f%%", ($8/$4) * 100}')


#Disk Usage 
disk_usage=$(df --block-size=1  | awk 'NR>1 {total_size+=$2; total_used+=$3} END {printf "Total disk usage = %.1f%%\n", (total_used / total_size) * 100}')


# sending data to monitoring file
echo "$date_time , $cpu_usage , $memory_usage , $disk_usage" > monitoring.txt

echo "Monitoring data added to monitoring.txt file"