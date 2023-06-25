#!/bin/bash

# Extract the file name without extension
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Compile C/C++ file
if [[ "$extension" == "c" ]]; then
  gcc -o "$filename" "$1"
elif [[ "$extension" == "cpp" ]]; then
  g++ -o "$filename" "$1"
else
  echo "Unsupported file extension. Only .c and .cpp files are supported."
  exit 1
fi

# Check if compilation was successful
if [[ $? -eq 0 ]]; then
  echo "Compilation successful."

  # Run the compiled file
  "./$filename"
else
  echo "Compilation failed."
fi
