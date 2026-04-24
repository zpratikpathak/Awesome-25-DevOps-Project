#!/bin/bash

echo "--- System Health Check ---"
date
echo ""

# 1. Check Disk Usage
echo "Disk Usage:"
df -h | grep '^/dev/' | awk '{ print $5 " " $1 }' | while read output;
do
  usage=$(echo $output | awk '{ print $1 }' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usage -ge 80 ]; then
    echo "  CRITICAL: $partition is at $usage%"
  else
    echo "  OK: $partition is at $usage%"
  fi
done

# 2. Check Memory Usage
echo ""
echo "Memory Usage:"
free -m | awk 'NR==2{printf "  Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

# 3. Check CPU Load
echo ""
echo "CPU Load:"
uptime | awk '{ print "  Load Average: " $10 $11 $12 }'

echo ""
echo "Health check complete."
