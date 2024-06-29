#!/bin/bash

# Function to display usage message
display_usage() {
  echo "This script demonstrates basic Linux commands."
  echo "Usage: ./script_name.sh <command> [arguments]"
  echo "Available commands:"
  echo "  pwd - Print working directory"
  echo "  cd <dir> - Change directory"
  echo "  ls [options] - List directory contents"
  echo "  cat <file> - Display file contents"
  echo "  head <file> - Display the first few lines of a file"
  echo "  tail <file> - Display the last few lines of a file"
  echo "  mv <source> <destination> - Move or rename a file"
  echo "  mkdir <dir> - Create a new directory"
  echo "  rmdir <dir> - Remove an empty directory"
  echo "  clear - Clear the terminal screen"
  echo "  cp <source> <destination> - Copy a file"
  echo "  echo <text> - Print text to the terminal"
  echo "  whoami - Print the current user name"
  echo "  history - Display command history"
  echo "  wc <file> - Print word count, line count, and byte count"
  echo "  grep <pattern> <file> - Search for a pattern in a file"
  exit 1
}

# Check if a valid command is provided as the first argument
if [[ $# -eq 0 ]]; then
  display_usage
fi

# Extract the command and arguments
command="$1"
shift

# Use case statement to handle different commands
case "$command" in
  pwd)
    echo "** pwd **"
    pwd
    ;;
  cd)
    if [[ $# -eq 0 ]]; then
      echo "** cd [directory] **"
      display_usage
    else
      echo "** cd <span class="math-inline">1 \*\*"
cd "</span>@"
    fi
    ;;
  ls)
    echo "** ls <span class="math-inline">1 \*\*"
ls "</span>@"
    ;;
  cat)
    if [[ $# -eq 0 ]]; then
      echo "** cat <file> **"
      display_usage
    else
      echo "** cat <span class="math-inline">1 \*\*"
cat "</span>@"
    fi
    ;;
  head)
    if [[ $# -eq 0 ]]; then
      echo "** head <file> **"
      display_usage
    else
      echo "** head <span class="math-inline">1 \*\*"
head "</span>@"
    fi
    ;;
  tail)
    if [[ $# -eq 0 ]]; then
      echo "** tail <file> **"
      display_usage
    else
      echo "** tail <span class="math-inline">1 \*\*"
tail "</span>@"
    fi
    ;;
  mv)
    if [[ $# -lt 2 ]]; then
      echo "** mv <source> <destination> **"
      display_usage
    else
      echo "** mv $1 <span class="math-inline">2 \*\*"
mv "</span>@"
    fi
    ;;
  mkdir)
    if [[ $# -eq 0 ]]; then
      echo "** mkdir <directory> **"
      display_usage
    else
      echo "** mkdir <span class="math-inline">1 \*\*"
mkdir "</span>@"
    fi
    ;;
  rmdir)
    if [[ $# -eq 0 ]]; then
      echo "** rmdir <directory> **"
      display_usage
    else
      echo "** rmdir <span class="math-inline">1 \*\*"
rmdir "</span>@"
    fi
    ;;
  clear)
    echo "** clear **"
    clear
    ;;
  cp)
    if [[ $# -lt 2 ]]; then
      echo "** cp <source> <destination> **"
      display_usage
    else
      echo "** cp $1 <span class="math-inline">2 \*\*"
cp "</span>@"
    fi
    ;;
  echo)
    if [[ $# -eq 0 ]]; then
      echo "** echo <text> **"
    else
      echo "** echo <span class="math-inline">1 \*\*"
echo "</span>@"
    fi
    ;;
  whoami)
    echo "** whoami **"
    whoami
    ;;
  history)
    echo "** history **"
    history
    ;;
  wc)
    if [[ $# -eq 0 ]]; then
      echo "** wc <file> **"
      display_usage
    else
      echo "**

