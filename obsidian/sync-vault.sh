#!/data/data/com.termux/files/usr/bin/bash

# This script syncs the local vault (e.g. on my phone with the one on github)

# --- CONFIGURATION ---
# !!! IMPORTANT: Change this to the path of your vault !!!
VAULT_PATH="/data/data/com.termux/files/home/storage/shared/Documents/obsidian"
# ---------------------

echo " Obsidian Vault Sync Started "
echo "============================="

# Go to your vault directory
cd "$VAULT_PATH" || { echo "ERROR: Vault directory not found!"; sleep 3; exit 1; }

# 1. Pull latest changes to avoid conflicts
echo "-> Pulling remote changes..."
git pull

# 2. Add all local changes
echo "-> Staging local changes..."
git add .

# 3. Commit if there are changes to commit
if ! git diff-index --quiet HEAD --; then
  echo "-> Committing changes..."
  COMMIT_MESSAGE="Auto-sync from Android: $(date +'%Y-%m-%d %H:%M:%S')"
  git commit -m "$COMMIT_MESSAGE"

  # 4. Push your new commit
  echo "-> Pushing changes to remote..."
  git push
else
  echo "-> No local changes to commit."
fi

echo "============================="
echo " Sync complete! "
sleep 5 # Keep the window open for 3 seconds to see the result
