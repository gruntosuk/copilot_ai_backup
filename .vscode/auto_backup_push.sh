#!/bin/zsh
set -euo pipefail

REPO_DIR="/Users/grantegglestone/Repos/arcadeclassics"
REMOTE_NAME="copilot_ai_backup"
TARGET_BRANCH="main"
PROMPTS_DIR="/Users/grantegglestone/Library/Application Support/Code/User/prompts"
MIRROR_DIR="$REPO_DIR/.copilot-backup/prompts"

cd "$REPO_DIR"

# Mirror global prompt files into the repository backup area.
mkdir -p "$MIRROR_DIR"
rsync -a --delete "$PROMPTS_DIR/" "$MIRROR_DIR/"

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

# Keep backup branch aligned even when histories diverge.
GIT_TERMINAL_PROMPT=0 git fetch "$REMOTE_NAME" "$TARGET_BRANCH" >/dev/null 2>&1 || true
GIT_TERMINAL_PROMPT=0 git push --force-with-lease "$REMOTE_NAME" HEAD:"$TARGET_BRANCH"
