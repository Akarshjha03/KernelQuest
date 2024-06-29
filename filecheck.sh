#!/bin/bash

# Get the filename from the user (optional)
# Uncomment the following line and modify the prompt if desired
# echo "Enter the filename: "
# read filename

# Set the filename (replace 'path/to/your/file' with the actual file path)
filename="path/to/your/file"

# Check if the file exists using the test command
if [[ -f "$filename" ]]; then
  echo "The file '$filename' exists."
else
  echo "The file '$filename' does not exist."
fi

