#!/bin/bash

# Function to generate the sidebar content
urlencode() {
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done
}

generate_sidebar() {
    local dir="$1"
    local indent="$2"

    for entry in "$dir"/*; do
        if [ -d "$entry" ]; then
            # If it's a directory, add it to the sidebar and recurse
            echo "${indent}* $(basename "$entry")" >>_Sidebar.md
            generate_sidebar "$entry" "  $indent"
        elif [ -f "$entry" ]; then
            # If it's a file, add it to the sidebar
            local title=$(head -n 1 "$entry" | sed 's/^# *//;s/ *$//')
            local encoded_title=$(urlencode "$title")
            echo "${indent}* [${title}](https://github.com/MagaluCloud/mgccli/wiki/${encoded_title})" >>_Sidebar.md
        fi
    done
}

# Clear the existing _Sidebar.md
>_Sidebar.md

# Start generating the sidebar from the docs/ directory
generate_sidebar "docs" ""
