#!/bin/bash

# Define the lines to be added
lines_to_add='
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status"/>
<user username="deployer" password="deployer" roles="manager-script"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>
'

# File path
file_path="/opt/tomcat/conf/tomcat-users.xml"

# Use awk to add lines above the search pattern
awk -v lines_to_add="$lines_to_add" -v search_pattern="</tomcat-users>" '
{
  if (index($0, search_pattern) > 0) {
    print lines_to_add
  }
  print
}
' "$file_path" > temp_file

# Replace the original file with the modified temporary file
mv temp_file "$file_path"
