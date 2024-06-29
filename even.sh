#!/bin/bash

# Prompt the user to enter a number
echo "Enter a number: "
read max_num

# Check if the input is a positive integer
if [[ ! $max_num =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Loop to print even numbers up to the input number
for ((i=0; i <= max_num; i+=2)); do
  echo "$i"
done


