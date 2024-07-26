#!/bin/bash

# Function to generate the sidebar content
generate_sidebar() {
  local dir="$1"
  local indent="$2"
  
  for entry in "$dir"/*; do
    if [ -d "$entry" ]; then
      # If it's a directory, add it to the sidebar and recurse
      echo "${indent}* $(basename "$entry")" >> _Sidebar.md
      generate_sidebar "$entry" "  $indent"
    elif [ -f "$entry" ]; then
      # If it's a file, add it to the sidebar
      local filename=$(basename "$entry" .md)
      local title=$(head -n 1 "$entry" | sed 's/^# *//;s/ *$//')
      local relative_path=$(realpath --relative-to="docs" "$entry")
      local link=$(echo "$relative_path" | sed 's/ /-/g; s/%20/-/g; s/\.md$//; s/\//-/g')
      echo "${indent}* [${title}](https://github.com/MagaluCloud/mgccli/wiki/${link})" >> _Sidebar.md
    fi
  done
}

# Clear the existing _Sidebar.md
> _Sidebar.md

# Start generating the sidebar from the docs/ directory
generate_sidebar "docs" ""