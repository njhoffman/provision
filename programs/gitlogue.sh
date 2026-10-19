#!/bin/bash

# Start the cinematic screensaver
gitlogue

# View a specific commit
gitlogue --commit abc123

# Replay a range of commits
gitlogue --commit HEAD~5..HEAD

# Replay commits in chronological order (oldest first)
gitlogue --order asc

# Loop a specific commit continuously
gitlogue --commit abc123 --loop

# Loop through a commit range
gitlogue --commit HEAD~10..HEAD --loop

# View staged changes (default)
gitlogue diff

# View unstaged changes instead
gitlogue diff --unstaged

# Filter commits by author or email (case-insensitive partial match)
gitlogue --author "john"

# Filter commits by date
gitlogue --after "2024-01-01"
gitlogue --before "1 week ago"
gitlogue --after "2024-06-01" --before "2024-07-01"

# Use a different theme
gitlogue --theme dracula

# Adjust typing speed (ms per character)
gitlogue --speed 20

# Set different speeds for different file types
gitlogue --speed-rule "*.java:50" --speed-rule "*.xml:5"

# Ignore specific file patterns (e.g., notebooks, lock files)
gitlogue --ignore "*.ipynb" --ignore "poetry.lock"

# Use an ignore file
gitlogue --ignore-file .gitlogue-ignore

# List available themes
gitlogue theme list

# Set default theme
gitlogue theme set dracula

# Combine options
gitlogue --commit HEAD~5 --author "john" --theme nord --speed 15 --ignore "*.ipynb"
