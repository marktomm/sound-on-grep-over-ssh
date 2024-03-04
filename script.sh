#!/bin/bash

remote_user="your_remote_user"
remote_host="your_remote_host"
log_file="/path/to/your/log/file.log"
pattern="your_specific_pattern"
beep_sound="/path/to/your/beep/sound.wav"

ssh "$remote_user@$remote_host" "tail -n0 -F $log_file | grep --line-buffered '$pattern'" | while read -r line; do
    echo "$line"  # Optionally, print the matched line to the local terminal
    paplay "$beep_sound" # ir use beep for PC speaker if available
done
