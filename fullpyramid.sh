#!/bin/bash

# Read the number of rows from the user
echo "Enter the number of rows for the pyramid: "
read rows

# Function to print spaces
print_spaces() {
  local num_spaces=$1
  for ((i=1; i<=num_spaces; i++)); do
    echo -n " "
  done
}

# Function to print asterisks
print_asterisks() {
  local num_asterisks=$1
  for ((i=1; i<=num_asterisks; i++)); do
    echo -n "*"
  done
  echo
}

# Loop to print each row of the pyramid
for ((i=1; i<=rows; i++)); do
  # Print leading spaces for proper alignment
  num_spaces=$((rows - i))
  print_spaces $num_spaces

  # Print the current row's asterisks
  num_asterisks=$((2 * i - 1))
  print_asterisks $num_asterisks
done


