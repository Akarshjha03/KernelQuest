#!/bin/bash

# Function to calculate factorial
factorial() {
  local n=$1
  if [[ $n -lt 0 ]]; then
    echo "Error: Factorial is not defined for negative numbers."
    exit 1
  fi
  if [[ $n -eq 0 ]]; then
    echo 1
  else
    fact=1
    for ((i=1; i <= n; i++)); do
      fact=$((fact * i))
    done
    echo $fact
  fi
}

# Get user input for the number
echo "Enter a non-negative number: "
read num

# Call the factorial function and display the result
result=$(factorial $num)
if [[ $? -eq 0 ]]; then
  echo "The factorial of $num is: $result"
else
  echo "An error occurred during calculation."
fi

