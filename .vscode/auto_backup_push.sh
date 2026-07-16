#!/bin/zsh
set -euo pipefail

REPO_DIR="/Users/grantegglestone/Repos/arcadeclassics"
REMOTE_NAME="copilot_ai_backup"
TARGET_BRANCH="main"

cd "$REPO_DIR"

# Skip while merge conflicts exist.
if [[ -n "$(git diff --name-only --diff-filter=U)" ]]; then
  exit 0
fi

# Nothing to sync.
if [[ -z "$(git status --porcelain)" ]]; then
  exit 0
fi

git add -A

# If add resolved everything to clean, stop.
if [[ -z "$(git status --porcelain)" ]]; then
  exit 0
fi

commit_msg="auto-backup: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_msg"
git push "$REMOTE_NAME" HEAD:"$TARGET_BRANCH"
