#!/bin/bash

# Get Total CPU usage
echo "Total CPU Usage:"
mpstat | awk '$3 ~ /[0-9.]+/ { print 100 - $12 }'


# Get Total Memory usage
echo "Total Memory Usage:"
free -h | awk '/^Mem/ { printf "Used: %s, Free: %s, Total: %s\n", $3, $4, $2 }'

# Get Total Disk Usage (Free and Used including percentage)
echo "Total Disk Usage:"
df -h | awk '$NF=="/" { printf "Used: %s, Free: %s, Total: %s, Usage: %s\n", $3, $4, $2, $5 }'

# List Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# List Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Optional: Add more stats like OS version, uptime, load average, logged in users, failed login attempts, etc.
echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f2 | tr -d '"'

echo "Uptime:"
uptime | awk '{print $3, $4, $5}'

echo "Load Average:"
uptime | awk '{print $8, $9, $10}'

echo "Logged in Users:"
who | wc -l

echo "Failed Login Attempts:"
lastb | wc -l

# TODO 1. List the Total CPU Usage (DONE)
# TODO 2. List the Total Memory Usage (Free and Used including percentage) (DONE)
# TODO 3. List the Total Disk Usage (Free and Used including percentage) (DONE)
# TODO 4. List Top 5 Processes by CPU Usage (DONE)
# TODO 5. List Top 5 Processes by Memory Usage (DONE)
# TODO 6. Optional: Add more stats like OS version, uptime, load average, logged in users, failed login attempts, etc.