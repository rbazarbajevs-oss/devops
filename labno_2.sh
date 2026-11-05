#!/bin/bash

dir="${1:-}"; [ -z "$dir" ] && read -p "Directory: " dir
[ -d "$dir" ] || { echo "Error: Not found"; exit 1; }

c=0 s=0
for f in "$dir"/*; do
    # File check
    if [ -f "$f" ] && [ -r "$f" ]; then
        ((c++))
        s=$((s + $(wc -c < "$f")))
    fi
done

echo "Files: $c | Size: $s bytes"
