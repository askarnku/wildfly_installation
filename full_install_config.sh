#!/bin/bash

# Make scripts executable
chmod +x java_installation.sh
chmod +x standalone_conf.sh
chmod +x wildfly_download.sh
chmod +x wildfly_service.sh

# Run the scripts in logical order
./java_installation.sh
if [ $? -ne 0 ]; then
  echo "Failed to run java_installation.sh"
  exit 1
fi

./wildfly_download.sh
if [ $? -ne 0 ]; then
  echo "Failed to run wildfly_download.sh"
  exit 1
fi

./standalone_conf.sh
if [ $? -ne 0 ]; then
  echo "Failed to run standalone_conf.sh"
  exit 1
fi

./wildfly_service.sh
if [ $? -ne 0 ]; then
  echo "Failed to run wildfly_service.sh"
  exit 1
fi

echo "All scripts ran successfully"
