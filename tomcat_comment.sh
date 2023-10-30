#!/bin/bash

# Array of files to process
files=(
  "./webapps/examples/META-INF/context.xml"
  "./webapps/host-manager/META-INF/context.xml"
  "./webapps/manager/META-INF/context.xml"
)

# The Valve tag to search for
valve_tag='<Valve className="org.apache.catalina.valves.RemoteAddrValve"'

# Line number to start commenting from
start_line=0

# Loop through each file
for file in "${files[@]}"; do
  # Check if the file exists
  if [ -f "$file" ]; then
    # Use grep to find the line numbers containing the Valve tag
    line_numbers=$(grep -n "$valve_tag" "$file" | cut -d: -f1)

    if [ -n "$line_numbers" ]; then
      # Loop through the line numbers
      for line_number in $line_numbers; do
        if [ "$line_number" -ge "$start_line" ]; then
          # Comment out the lines starting from the current line to the next line
          sed -i "${line_number}s|^|<!--|; $(($line_number + 1))s|$|-->|" "$file"
          echo "Commented out Valve tag in $file starting from line $line_number"
        fi
      done
    else
      echo "Valve tag not found in $file"
    fi
  else
    echo "File not found: $file"
  fi
done
