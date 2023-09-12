#!/bin/bash

while true
do
    # Generate a random IP address
    ip=$(shuf -i 1-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 1-255 -n 1)

    # Generate a random date and time
    date_time=$(date +"%d/%b/%Y:%H:%M:%S %z")

    # Generate a random HTTP method
    methods=("GET" "POST" "PUT" "DELETE")
    method=${methods[$(shuf -i 0-3 -n 1)]}

    # Generate a random URL path
    paths=("/" "/page1" "/page2" "/page3")
    path=${paths[$(shuf -i 0-3 -n 1)]}

    # Generate a random HTTP status code
    status_codes=("200" "404" "502" "301")
    status_code=${status_codes[$(shuf -i 0-3 -n 1)]}

    # Generate a random user agent
    user_agents=("curl/7.88.1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "Wget/1.21.1")
    user_agent=${user_agents[$(shuf -i 0-2 -n 1)]}

    # Generate the log entry
    log_entry="$ip - - [$date_time] \"$method $path HTTP/1.1\" $status_code $(shuf -i 100-1000 -n 1) \"-\" \"$user_agent\" \"-\""

    # Append the log entry to the nginx access log file
    echo $log_entry >> /var/log/access.log

    # Generate the error log entry
    date_time_error=$(date +"%Y/%m/%d %H:%M:%S")
    log_levels=("notice" "warning" "error" "critical")
    messages=("Something went wrong" "Internal server error" "Resource not found")
    random_log_level=${log_levels[$(shuf -i 0-3 -n 1)]}
    random_message=${messages[$(shuf -i 0-2 -n 1)]}
    error_log_entry="$date_time_error [$random_log_level] 1#1: $random_message"

    # Append the error log entry to the nginx error log file
    echo $error_log_entry >> /var/log/error.log

    # Sleep for a random interval (e.g., 1-5 seconds) before generating the next log entry
    sleep $(shuf -i 1-5 -n 1)

    # Sleep for a random interval (e.g., 1-5 seconds) before generating the next log entry
    sleep $(shuf -i 1-5 -n 1)
done
