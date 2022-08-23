#!/bin/bash
key="$1"
> temp_file.json
 python3 get_metadata.py > temp_file.json
cat temp_file.json|jq .[].\"$key\"
