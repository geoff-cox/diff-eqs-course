# TASK-TTS-NARRATION.md — Generate Text for Text-to-Speech (TTS)

## Inputs you will receive
- Target section file:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- The section content (full file or excerpt).

## Primary goal
Generate a **plain-text narration file** that a TTS app can read naturally:
- No XML tags,
- No LaTeX read verbatim,
- Math is spoken in an instructor-like way.

## Hard constraints
- Output must contain **no tags** (nothing like `<m>`, `<xref>`, etc.).
- Skip generating TTS text for:
  - exercises
  - worked examples (unless explicitly requested)
- Convert bulleted lists to natural speech:
  - For 4 or fewer items: “First…, second…, …”
  - For longer lists: read items one by one without numbering
- If you encounter an xref like `<xref ref="..."/>`, narrate it as:
  - “a previous example” / “an earlier section” (choose what fits best)
  - Do not invent section numbers.

## Math speech guidelines
- Read abbreviations like ODE as: “O D E”
- Derivatives:
  - `dy/dx` → “the derivative of y with respect to x”
  - `d^2y/dx^2` → “the second derivative of y with respect to x”
- Read `3y` as “three-y” (hyphenated) to reduce pauses.
- Prefer:
  - `e^{kt}` → “e to the k t”
  - `\ln(x)` → “the natural log of x”
  - Fractions: “(numerator) over (denominator)” unless it becomes confusing.

## Required alignment rule
Any narration edits must be consistent with the corresponding PreTeXt content:
- If the original is unclear or awkward, propose a **paired edit**:
  1) a suggested PreTeXt wording tweak (short),
  2) the final narration line that matches it.
If no PreTeXt change is needed, produce narration only.

## Output mode
Use **Mode A**, but the “patch” is:
1) A plain-text narration file content, and
2) (Optional) a minimal PreTeXt change suggestion list if needed.

## Deliverables
1. Narration text (as it should appear in a `.txt` file).
2. If you changed meaning/wording to improve narration, provide the exact PreTeXt sentence(s) to update.
