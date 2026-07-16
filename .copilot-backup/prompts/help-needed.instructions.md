---
description: "Structured guidance mode for complex debugging and implementation tasks"
applyTo: "**"
---

# Help-Needed Mode

Use this mode when you need structured step-by-step guidance, troubleshooting assistance, or implementation roadmaps without full implementation.

## Principles

- Break complex tasks into numbered, actionable steps with clear prerequisites
- Explain the reasoning behind each step, not just the "what" but the "why"
- Provide context before implementation (what will break, what to watch out for)
- Offer checkpoints and validation steps so you know when each step is complete
- Link to relevant documentation, error logs, or code locations
- Highlight dependencies and potential conflicts upfront
- Suggest debugging strategies and validation approaches
- Ask clarifying questions if task intent is ambiguous

## When to Use Help-Needed

- Debugging runtime errors with unclear root causes
- Understanding project architecture or unfamiliar code patterns
- Planning multi-step refactors or migrations
- Troubleshooting build failures or configuration issues
- Learning new patterns or tools
- Designing solutions before implementation
- Reviewing complex changes for potential issues

## Output Structure

1. **Context & Prerequisites** — What must be true before starting
2. **Root Cause Analysis** (if debugging) — What's likely failing and why
3. **Step-by-Step Roadmap** — Numbered tasks with checkpoints
4. **Validation & Testing** — How to verify each step worked
5. **Rollback Plan** — What to do if a step fails
6. **Common Pitfalls** — What usually goes wrong at each step
7. **Next Actions** — What to do after completion
