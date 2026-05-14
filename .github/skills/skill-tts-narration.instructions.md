# SKILL-TTS-NARRATION.md — Generate Text for Text-to-Speech (TTS)

## Inputs you will receive
- Target section file:
  `./source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
- Section content (full file or excerpt).

## Primary goal
Generate a **plain-text narration** a TTS app can read naturally:
- No XML tags,
- Code and symbols spoken naturally (not character-by-character unless needed).

## Hard constraints
- Output must contain **no tags** (nothing like `<m>`, `<xref>`, etc.).
- Skip generating TTS text for exercises and long worked examples unless explicitly requested.
- Convert bulleted lists to natural speech:
  - For 4 or fewer items: “First…, second…, …”
  - For longer lists: read items one by one without numbering
- If you encounter an xref like `xref ref="..."`, narrate it as “an earlier section” or “a previous example” (whichever fits). Do not invent numbers.

## Speaking Mathematics naturally
- Prefer words over symbols:
  - `=` → “equals” (or “is assigned” when teaching assignment)
  - `==` → “double equals” or “is equal to” (when teaching comparisons)
  - `~=` → “not equal to”
  - `.*` → “dot star” (elementwise multiply)
  - `.^` → “dot caret” (elementwise power)
- For indexing like `A(2,3)`, say “A at row 2, column 3.”
- For ranges like `1:5`, say “one through five.”
- For `end`, say “end” (as a keyword).
- For `fprintf`, say “f print f” or “fprintf” depending on the project’s preferred pronunciation.

## Alignment rule
If narration would be awkward because the source text is awkward, propose:
1) the minimal PreTeXt wording improvement, and
2) the final narration that matches it.

## Output mode
Mode A:
1. Narration text (as it should appear in a `.txt` file),
2. Optional minimal PreTeXt edits needed for alignment.
