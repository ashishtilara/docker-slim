#!/usr/bin/sh
service httpd start

# Tail the log file
tail -f /opt/logs/error_log