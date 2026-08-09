# AI Recovery Playbook

## Purpose

This repository keeps a fast-restore backup of:

- VS Code prompt instructions and custom AI agent files only

## Architecture

`~/Library/Application Support/Code/User/prompts` and `.../User/agents` are
symlinks pointing directly into this repo's `.ai-backup/prompts` and
`.ai-backup/agents` folders. This repo is the canonical copy — VS Code reads
and writes through the symlink. There is no mirroring step; editing either
"location" edits the same file.

## Automatic Backup

A scheduled job (launchd agent + cron, both running `.vscode/auto_backup_push.sh`)
commits and pushes any changes under `.ai-backup/` to this repository, roughly
every 30-60 seconds.

## Policy

This backup system is AI-only.

- Full project repositories must not be mirrored into this repository.
- Game source backups must stay in their own project git remotes.
- Only AI prompt/agent content is allowed here.

## Cross-Repo Standard

For every project repository that should reference AI backups:

1. Create a symlink in the project repo root:

	- `.ai-backup` -> `/Users/grantegglestone/Repos/ai_backup/.ai-backup`

2. Do not mirror any full project content into `ai_backup`.

3. Keep `.ai-backup` ignored in each project repo so it stays local-only.

This is the default pattern for all repos: AI files via symlink only.

## Quick Restore

If the VS Code symlinks are ever missing (fresh machine, reinstalled VS Code),
recreate them:

- `~/Library/Application Support/Code/User/prompts` -> `~/Repos/ai_backup/.ai-backup/prompts`
- `~/Library/Application Support/Code/User/agents` -> `~/Repos/ai_backup/.ai-backup/agents`

## Safety Notes

- Keep path-scoped credentials enabled (`credential.useHttpPath=true`) so tokens can be repo-specific.
- Validate remote URLs before pushing from SourceTree and terminal.

## Agent Notes

When asked to recover work quickly:

1. Verify `ai_backup` is up to date on `main`.
2. Recreate the VS Code symlinks from `.ai-backup/prompts` and `.ai-backup/agents` if missing.
3. Do not mirror or restore full non-AI repositories from this backup.
4. Re-apply the `.ai-backup` symlink pattern in target project repos if missing.
