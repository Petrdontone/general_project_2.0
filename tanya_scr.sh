#!/bin/bash

current_year=$(date +'%Y')
new_year=$((current_year + 1))

new_year_date=$(date -d "$new_year-01-01 00:00:00" +%s)
current_date=$(date +%s)

time_left=$((new_year_date - current_date))

days_left=$((time_left / (60 * 60 * 24)))
hours_left=$((time_left / (60 * 60) % 24))
minutes_left=$((time_left / 60 % 60))
seconds_left=$((time_left % 60))

echo "Time left until New Year: $days_left days, $hours_left hours, $minutes_left minutes, $seconds_left seconds"
