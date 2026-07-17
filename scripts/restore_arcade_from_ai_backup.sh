#!/bin/zsh
set -euo pipefail

SOURCE_DIR="/Users/grantegglestone/Repos/copilot_ai_backup/.copilot-backup/arcadeclassics-live"
TARGET_DIR="/Users/grantegglestone/Repos/arcadeclassics"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Backup source not found: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$TARGET_DIR"

rsync -a --delete \
  --exclude='.git/' \
  --exclude='.godot/' \
  "$SOURCE_DIR/" "$TARGET_DIR/"

echo "Restore complete"
echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"
