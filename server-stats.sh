#!/bin/bash

# Get Total CPU usage
echo "Total CPU Usage:"
mpstat | awk '$3 ~ /[0-9.]+/ { print 100 - $12 }'


# Get Total Memory usage
echo "Total Memory Usage:"
free -h | awk '/^Mem/ { printf "Used: %s, Free: %s, Total: %s\n", $3, $4, $2 }'


# TODO 1. List the Total CPU Usage (DONE)
# TODO 2. List the Total Memory Usage (Free and Used including percentage) (DONE)
# TODO 3. List the Total Disk Usage (Free and Used including percentage)
# TODO 4. List Top 5 Processes by CPU Usage
# TODO 5. List Top 5 Processes by Memory Usage
# TODO 6. Optional: Add more stats like OS version, uptime, load average, logged in users, failed login attempts, etc.