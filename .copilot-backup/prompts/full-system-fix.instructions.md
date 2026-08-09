---
description: "Full System Fix for project-wide issue resolution"
applyTo: "**"
---

# Full System Fix

- Checklist sync rule: when the user asks to update checklists, apply the same relevant updates to both full-system-fix.instructions.md and full-system-check.instructions.md.
- Checklist sync rule: if one checklist is changed and the other is not updated in the same pass, explicitly report the gap and finish the second update before ending.
- Scope: scan the entire project and apply fixes directly where safe.
- Always run a full diagnostics pass first, then fix issues by severity.
- Prioritise parser errors, load blockers, signal mismatches, and runtime node-path issues.
- Preserve fixed external API names and engine property names.
- Enforce function naming for font-related helpers: use a leading underscore only for local/private helper functions; do not use a leading underscore for functions called externally. Keep engine callback names unchanged where required by Godot.
- Prefer consistency with existing project conventions unless the user asks otherwise.
- Use UK English spelling in prose, comments, and user-facing strings where practical.
- Ensure location and position names are correct and consistent.
- Use location for grid/cell/logical coordinates (for example, grid_location, start_location, end_location) and position for transform/screen/world position values tied to engine properties (for example, global_position, position, mouse position values before conversion).
- Ensure parent components perform conversions before passing values to children or emitting them to downstream listeners.
- Use GlobalGameState conversion helpers (calculate_grid_location_from_world and calculate_world_location_from_grid) for world-grid conversions instead of inline maths.
- Ensure variable declarations use explicit typed suffixes and spaced annotations with explicit defaults where practical (for example, var player : bool = false). Do not use := shorthand for local declarations when an explicit type can be written.
- Ensure enum and array names use PascalCase where those are defined as identifiers.
- Ensure array and dictionary identifier members use capitalised names or keys where required by project convention.
- Fix GDScript constant casing mistakes, for example .VECTOR2.ZERO to Vector2.ZERO.
- Fix incorrect or stale signal usage, including mismatched signal names and invalid emit calls.
- Replace vague signal parameter tags such as new where unclear, using descriptive names that preserve behaviour.
- Remove stray tokens, dead no-op expressions, and accidental commented-out code.
- Keep intentionally disabled code only with DISABLED(YYYY-MM-DD): reason comments.
- After edits, re-run diagnostics and summarise each fix with file and line references.
- Change-minimisation rule: implement the smallest safe fix set first, preserving existing structure unless a larger refactor is explicitly requested.
- Improved-code gate rule: before presenting rewritten or improved code variants, end with a yes/no prompt asking whether to show the improved version.
