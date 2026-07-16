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
- Use UK English spelling in prose and user-facing output where practical.
- End with residual risks and any validation gaps if tests or runtime execution were not performed.
