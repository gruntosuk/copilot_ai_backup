# AI Recovery Playbook

## Purpose

This repository keeps a fast-restore backup of:

- VS Code prompt instructions and custom AI files only

## Automatic Backup

A scheduled job runs `.vscode/auto_backup_push.sh`.

It mirrors:

- `~/Library/Application Support/Code/User/prompts` to `.copilot-backup/prompts`

Then it commits and pushes to this repository.

## Policy

This backup system is AI-only.

- Full project repositories must not be mirrored into this repository.
- Game source backups must stay in their own project git remotes.
- Only AI branch backup content is allowed here.

## Quick Restore

Restore AI customisation files by copying from `.copilot-backup/prompts` back to:

- `~/Library/Application Support/Code/User/prompts`

## Safety Notes

- Keep path-scoped credentials enabled (`credential.useHttpPath=true`) so tokens can be repo-specific.
- Validate remote URLs before pushing from SourceTree and terminal.

## Agent Notes

When asked to recover work quickly:

1. Verify `copilot_ai_backup` is up to date on `main`.
2. Restore only AI prompt/customisation files from `.copilot-backup/prompts`.
3. Do not mirror or restore full non-AI repositories from this backup.
