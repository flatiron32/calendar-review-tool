#!/usr/bin/env bash
sleep 120 #Wait for network
bundle exec bin/calendar-review-tool list -d 7 | while read line; do due=$(echo $line | cut -d\| -f 1); name=$(echo $line | cut -d\| -f 2); rmilk -v add -l Meetings -d $due "$name ($due)"; done
