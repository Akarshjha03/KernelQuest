#!/bin/bash

# Read the first number
echo "Enter the first number: "
read num1

# Read the second number
echo "Enter the second number: "
read num2

# Swap the numbers using arithmetic operations
num1=$((num1 + num2))
num2=$((num1 - num2))
num1=$((num1 - num2))

# Display the swapped numbers
echo "The swapped numbers are:"
echo "First number: $num1"
echo "Second number: $num2"















