#!/bin/bash

# Read the number of rows from the user
echo "Enter the number of rows: "
read rows

# Function to print a single row with n stars
print_row() {
  local num_stars=$1
  for ((i=1; i<=num_stars; i++)); do
    echo -n "*"
  done
  echo
}

# Print the half pyramid
for ((i=1; i<=rows; i++)); do
  print_row $i
done

