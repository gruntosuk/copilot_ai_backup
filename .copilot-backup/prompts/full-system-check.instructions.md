---
description: "Full System Check for project-wide audit and checklist output"
applyTo: "**"
---

# Full System Check

- Checklist sync rule: when the user asks to update checklists, apply the same relevant updates to both full-system-check.instructions.md and full-system-fix.instructions.md.
- Checklist sync rule: if one checklist is changed and the other is not updated in the same pass, explicitly report the gap and finish the second update before ending.
- Scope: review the entire project and produce a checklist of issues without editing files unless explicitly asked.
- Always run a full diagnostics pass, then inspect startup scenes, autoloads, and connected scripts.
- Report findings ordered by severity: blockers first, then high-risk runtime issues, then quality issues.
- Include precise file and line references for each finding.
- Include a clear checklist section with actionable items across the project.
- Verify parser errors, missing methods, node-path mismatches, signal declaration and emit mismatches, and group mismatches.
- Check GDScript constant casing mistakes, for example .VECTOR2.ZERO versus Vector2.ZERO.
- Check unclear signal parameter tags, including vague new labels that reduce readability.
- Distinguish explanatory comments from disabled code.
- Flag bare commented-out code that lacks a DISABLED(YYYY-MM-DD): reason prefix.
- Preserve fixed external API names and engine property names in recommendations.
- Prefer consistency with existing project conventions unless requested otherwise.
- Ensure location/position variable names are correct and consistent.
- Use location for grid/cell/logical coordinates (for example, grid_location, start_location, end_location).
- Use position for transform/screen/world position values tied to engine properties (for example, global_position, position, mouse position values before conversion).
- Ensure variable conversions are done in the parent before values are passed to child components or emitted to downstream listeners.
- Ensure all world-to-grid and grid-to-world coordinate conversions use GlobalGameState helper functions (calculate_grid_location_from_world and calculate_world_location_from_grid) rather than inline maths.
- Ensure variable declarations include explicit typed suffixes and spaced annotations with explicit defaults where applicable (for example, var player : bool = false). Do not use := shorthand for local declarations when an explicit type can be written.
- Ensure enum and array names use PascalCase (for example, CapitalsLikeThis or PlayerBoolWalking).
- Ensure array, dictionary, and similar collection members use capitals for their names or keys where they are defined as identifiers.
- Enforce function naming for font-related helpers: use a leading underscore only for local/private helper functions; do not use a leading underscore for functions called externally. Keep engine callback names unchanged where required by Godot.
- Use UK English spelling in prose and user-facing output where practical.
- End with residual risks and any validation gaps if tests or runtime execution were not performed.
- Change-minimisation rule: prefer recommendations that keep the user's current structure intact and require the smallest safe code delta.
- Improved-code gate rule: before presenting rewritten or improved code samples, end with a yes/no prompt asking whether to show the improved version.
