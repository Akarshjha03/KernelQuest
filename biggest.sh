#!/bin/bash

# Read the first number
echo "Enter the first number: "
read num1

# Read the second number
echo "Enter the second number: "
read num2

# Read the third number
echo "Enter the third number: "
read num3

# Find the biggest number using chained comparisons
largest=$num1

if [[ $num2 -gt $largest ]]; then
  largest=$num2
fi

if [[ $num3 -gt $largest ]]; then
  largest=$num3
fi

# Display the biggest number
echo "The biggest number is: $largest"

