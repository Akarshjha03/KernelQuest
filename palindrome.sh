#!/bin/bash

# Function to check palindrome
is_palindrome() {
  local str="$1"
  # Convert the string to lowercase and remove non-alphanumeric characters
  local clean_str=$(echo "${str,,}" | tr -dc '[:alnum:]')

  # Reverse the cleaned string and compare with the original
  if [[ "$clean_str" == "$(rev <<< "$clean_str")" ]]; then
    echo "true"  # String is a palindrome
  else
    echo "false" # String is not a palindrome
  fi
}

# Get user input for the string
echo "Enter a string: "
read input_string

# Call the is_palindrome function and display the result
result=$(is_palindrome "$input_string")

if [[ "$result" == "true" ]]; then
  echo "The string '$input_string' is a palindrome."
else
  echo "The string '$input_string' is not a palindrome."
fi

