#!/bin/bash

# Check if the repository is already initialized
if [ ! -d ".git" ]; then
    # Initialize Git repository
    git init

    # Prompt for remote repository URL
    read -p "Enter the URL of the remote repository: " remote_url

    # Add remote repository
    git remote add origin "$remote_url"
fi

# Stage all changes
git add .

# Prompt for commit message
read -p "Enter the commit message: " commit_message

# Commit changes
git commit -m "$commit_message"

git branch -M main

# Push changes to the main branch
git push origin main

echo "Changes have been staged, committed, and pushed to the main branch."
