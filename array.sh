#!/bin/bash

# Create an array with some elements
fruits=("apple" "banana" "cherry" "orange")

# Print elements using a for loop
echo "Printing elements using a for loop:"
for fruit in "${fruits[@]}"; do
  echo "$fruit"
done

# Print elements using a while loop (alternative)
echo "Printing elements using a while loop:"
index=0
while [[ $index -lt ${#fruits[@]} ]]; do
  echo "${fruits[$index]}"
  index=$((index + 1))
done

# Print elements on a single line (optional)
echo "Printing elements on a single line:"
echo "${fruits[@]}"

