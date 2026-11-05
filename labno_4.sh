#!/bin/bash

# Prepare log file
cat > test1.txt <<EOL
log entry one
log entry two with error oops
log entry three
log entry four
EOL

COUNT=0

#Read the file
while read -r LINE; do
    if [[ "$LINE" == *"error"* ]]; then
        continue
    fi
    echo "Processing: $LINE"
    COUNT=$((COUNT + 1))
done < test1.txt

echo "Total lines processed: $COUNT"
