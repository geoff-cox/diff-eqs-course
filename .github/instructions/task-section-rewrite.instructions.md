# TASK-SECTION-REWRITE.md — Improve or Rewrite a Section

## Inputs you will receive
- A target file path of the form:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- The file contents (full file or a specified excerpt).
- Optional: specific goals (tighten prose, add transitions, reduce redundancy, etc.).

## Primary goal
Improve readability and narrative flow while preserving mathematical correctness and PreTeXt structure.

## What to improve (typical)
- Intro hook: motivation, “why we care,” and a clean on-ramp.
- Explanations: step-by-step, student-facing.
- Transitions: smooth between paragraphs, examples, and subsubsections.
- Redundancy: remove repeated ideas; replace with a brief reminder and/or xref.
- Tone: conversational and confident, not stiff.

## Don’t change
- xml:id, label, ref targets, file structure.
- Figure/image/audio/video blocks unless explicitly instructed.
- Tag attributes inside `<...>` unless explicitly instructed.

## Required checks
- Any math claims must be correct.
- Any new math must use `<m>` and `<me><mrow>...</mrow></me>`.
- Keep definitions precise but readable.

## Output mode
Use **Mode A (Patch Output)** unless the user explicitly requests a find/replace JSON mapping.

## Deliverables
1. Updated PreTeXt (full file or clearly delimited excerpt).
2. Change log with 5–12 bullets (group similar edits).

## Optional “value add”
If you detect:
- A missing example,
- A confusing jump,
- A repeated explanation that belongs elsewhere,
suggest a small structural tweak (brief, actionable).
