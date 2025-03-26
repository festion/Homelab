#!/bin/bash

# Navigate to your forked repository
cd /mnt/c/GIT/component-ab-gateway || { echo "Failed to navigate to repo directory"; exit 1; }

# Fetch latest changes from upstream
git fetch upstream

# Check out main branch
git checkout main

# Merge upstream changes (fast-forward, no merge commit if possible)
git merge --ff-only upstream/main

# Push updates to your fork (origin)
git push origin main

echo "✅ Successfully synced fork with upstream!"
