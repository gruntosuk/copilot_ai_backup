---
description: "Full System Check for script edits and reviews"
applyTo: "**"
---

# Full System Check

- Use UK English spelling in prose, comments, and user-facing strings where practical.
- Preserve existing external API names and engine property names when they are fixed by the platform.
- Prefer consistency with existing project conventions unless requested otherwise.
- Ensure location/position variable names are correct and consistent.
- Use location for grid/cell/logical coordinates (for example, grid_location, start_location, end_location).
- Use position for transform/screen/world position values tied to engine properties (for example, global_position, position, mouse position values before conversion).
- Ensure variable conversions are done in the parent before values are passed to child components or emitted to downstream listeners.
- Ensure all world-to-grid and grid-to-world coordinate conversions use GlobalGameState helper functions (calculate_grid_location_from_world and calculate_world_location_from_grid) rather than inline maths.
- Ensure variable declarations include explicit typed suffixes and spaced annotations with explicit defaults where applicable (for example, var player : bool = false). Do not use := shorthand for local declarations when an explicit type can be written.
- Ensure enum and array names use PascalCase (for example, CapitalsLikeThis or PlayerBoolWalking).
- Ensure array, dictionary, and similar collection members use capitals for their names or keys where they are defined as identifiers.
- Ensure explanatory comments and disabled code are clearly distinguished: use prose comments for explanation, and only keep disabled code with a DISABLED(YYYY-MM-DD): reason prefix.
- Ensure there is no bare commented-out code without an explicit DISABLED(...) reason.
