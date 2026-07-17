# AI Recovery Playbook

## Purpose

This repository keeps a fast-restore backup of:

- VS Code prompt instructions and custom AI files
- The full Arcade workspace content (excluding `.git` and `.godot`)

## Automatic Backup

A scheduled job runs `.vscode/auto_backup_push.sh`.

It mirrors:

- `~/Library/Application Support/Code/User/prompts` to `.copilot-backup/prompts`
- `~/Repos/arcadeclassics` to `.copilot-backup/arcadeclassics-live`

Then it commits and pushes to this repository.

## Quick Restore

Run:

```bash
/bin/zsh /Users/grantegglestone/Repos/copilot_ai_backup/scripts/restore_arcade_from_ai_backup.sh
```

This restores from `.copilot-backup/arcadeclassics-live` back into `~/Repos/arcadeclassics`.

## Safety Notes

- Restore uses `rsync --delete`, so files removed from backup will also be removed in target.
- Git history in the target repo is not copied or replaced.
- If you want a manual checkpoint before restore, create a temporary branch in `arcadeclassics` first.

## Agent Notes

When asked to recover work quickly:

1. Verify `copilot_ai_backup` is up to date on `main`.
2. Run the restore script.
3. Validate key files in the Arcade workspace.
4. Commit restored files in the Arcade repo if needed.
