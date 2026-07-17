#!/bin/zsh
set -euo pipefail

# Auto-backup script for copilot AI files
# Syncs VS Code prompts to copilot_ai_backup repo (separate from arcadeclassics)

REPO_DIR="/Users/grantegglestone/Repos/copilot_ai_backup"
TARGET_BRANCH="main"
PROMPTS_DIR="/Users/grantegglestone/Library/Application Support/Code/User/prompts"
MIRROR_DIR="$REPO_DIR/.copilot-backup/prompts"

cd "$REPO_DIR"

# Mirror global prompt files into the backup repo
mkdir -p "$MIRROR_DIR"
rsync -a --delete "$PROMPTS_DIR/" "$MIRROR_DIR/"

# Skip while merge conflicts exist
if [[ -n "$(git diff --name-only --diff-filter=U)" ]]; then
  exit 0
fi

# Nothing to sync
if [[ -z "$(git status --porcelain)" ]]; then
  exit 0
fi

git add -A

# If add resolved everything to clean, stop
if [[ -z "$(git status --porcelain)" ]]; then
  exit 0
fi

commit_msg="auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_msg"

# Push to origin (copilot_ai_backup)
GIT_TERMINAL_PROMPT=0 git fetch origin "$TARGET_BRANCH" >/dev/null 2>&1 || true
GIT_TERMINAL_PROMPT=0 git push --force-with-lease origin HEAD:"$TARGET_BRANCH"
