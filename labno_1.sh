#!/bin/bash

echo "Free Disk Space Check"

df -P | awk 'NR>1 {
    for(i=1;i<=NF;i++) if($i~/%/) used=$i;
    gsub("%","",used);
    
    # Free space
    free = 100 - used;
    
    # Inverted thresholds:
    # > 30% free is OK, > 10% free is WARNING, otherwise CRITICAL
    s = (free > 30) ? "OK" : (free > 10) ? "WARNING" : "CRITICAL";
    
    print $NF" : "free"% free ["s"]"
}'
