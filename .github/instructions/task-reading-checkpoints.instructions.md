# TASK-READING-CHECKPOINTS.md — Create Reading Checkpoint Questions for a Section

## Inputs you will receive
- Target section file:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- The section content (full text or excerpt).
- Optional: where checkpoints should appear (end-of-subsection, mid-narrative, etc.).

## Primary goal
Write **reading checkpoint questions** that directly test understanding of *this section’s* core ideas.

## Question design requirements
- Produce **10 questions**.
- **No short-answer** questions.
- Mix formats:
  - multiple choice
  - multiple select
  - true/false
  - matching / card-sort (if your PreTeXt/Runestone pipeline supports it)
- Each question must have a **short, descriptive title** (not a restatement of the prompt).
- Feedback must **teach**, not just evaluate:
  - Avoid “Correct!” / “Nope” style feedback.
  - Explain the concept that makes the right choice right.

## Content alignment
- Every question must target a specific concept from the section (not generic DE trivia).
- Prefer “conceptual + light computation” over long algebra.
- If a question references an earlier idea, phrase it as “from a previous example/section” rather than inventing numbers.

## PreTeXt formatting expectations
- Use appropriate PreTeXt assessment elements used in your project (e.g., `<exercise>` with `exercisegroup`, or your established `<checkpoint>` structure).
- Do not wrap the full problem statement in `<em>`.
- All math uses `<m>` and `<me>`.

## Output mode
Default to **Mode A (Patch Output)**:
- Provide a ready-to-paste PreTeXt block containing the 10 questions.
- If the user requests insertion points, also provide a brief placement note.

## Deliverables
1. PreTeXt block of 10 questions.
2. A short placement suggestion list (where they fit best and why).
