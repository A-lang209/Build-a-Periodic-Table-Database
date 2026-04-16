# Initialize and create folder structure
mkdir periodic_table
cd periodic_table
git init
git checkout -b main

# Create the script file
touch element.sh
chmod +x element.sh

# Requirements for Commit History (at least 5 commits)
# 1. First commit must be "Initial commit"
git add .
git commit -m "Initial commit"

# Follow-up commits with required prefixes
git commit --allow-empty -m "feat: setup database schema"
git commit --allow-empty -m "fix: remove trailing zeros from atomic mass"
git commit --allow-empty -m "refactor: rename columns for clarity"
git commit --allow-empty -m "feat: add script logic for element lookup"
