#!/bin/bash

# Prompt the user to enter two numbers
echo "Enter the first number: "
read num1

echo "Enter the second number: "
read num2

# Calculate the average using bc for floating-point division
average=$(echo "scale=2; ($num1 + $num2) / 2" | bc)

# Display the average with two decimal places
echo "The average of $num1 and $num2 is: $average"

