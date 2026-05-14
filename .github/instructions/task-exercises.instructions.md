# TASK-EXERCISES.md — Improve/Add/Write Exercises + Solutions

## Inputs you will receive
- Target exercises file:
  `./source/{chapterID}-{chapterTitle}/exercises-{sectionTitle}.ptx`
- Existing exercise set (full file or excerpt).
- Optional: desired difficulty distribution and topics.

## Primary goal
Produce a coherent exercise set that reinforces the section’s skills and concepts, with solutions when requested.

## Exercise design requirements
- Maintain a spread:
  - warm-up / routine
  - conceptual checks
  - medium synthesis
  - a small number of challenge problems
- Avoid repetitive clones (same template with new numbers) unless explicitly desired.
- Prefer problems that teach a *single* point cleanly.

## Solutions
If solutions are requested:
- Show the key steps, but don’t drown the student in algebra.
- Ensure math narration is readable:
  - brief “what we’re doing and why” between steps
- Use `<m>` / `<me>` correctly, with `<mrow>` per line.

## Don’t change
- Existing labels/ids unless explicitly instructed.
- Structural containers used by the file (exercise groups, divisions).

## Output mode
- If asked to “rewrite/improve” specific exercises: **Mode A (Patch Output)** with localized edits.
- If asked for sweeping editorial tweaks across many similar sentences: **Mode B (Find/Replace JSON)** may be more efficient.

## Deliverables
1. Updated exercises (ready to paste or full updated file excerpt).
2. Change log:
   - New exercises added (titles + learning target)
   - Exercises modified (what improved)
   - Solutions added (where)
