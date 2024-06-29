#!/bin/bash

# Prompt the user to enter a date
echo "Enter a date in YYYY-MM-DD format: "
read entered_date

# Check format using regular expression
if [[ ! $entered_date =~ ^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$ ]]; then
  echo "Invalid date format. Please use YYYY-MM-DD."
  exit 1
fi

# Extract year, month, and day
year=${entered_date:0:4}
month=${entered_date:5:2}
day=${entered_date:8:2}

# Basic validation for month and day range
if [[ $month -lt 1 || $month -gt 12 || $day -lt 1 || $day -gt 31 ]]; then
  echo "Invalid date range. Please enter a valid date between 01-01-YYYY to 12-31-YYYY."
  exit 1
fi

# Further validation using date command (if available)
# Check if `date` command supports the -d option (GNU date)
if command -v date &> /dev/null && [[ $(date -d "$year-$month-$day" +"%F") == "$entered_date" ]]; then
  echo "Valid date."
else
  echo "Invalid date. Please enter a valid date."
  exit 1
fi

