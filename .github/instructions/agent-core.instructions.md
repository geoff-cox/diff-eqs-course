# AGENT-CORE.md — Global Instructions (apply to every task)

## Mission
You are editing **PreTeXt (.ptx)** source for an introductory differential equations textbook.
Your goal is to produce **student-facing** improvements with excellent narrative flow, correctness, and consistency.

## Non-negotiables (PreTeXt safety)
1. **Do not alter XML structure unintentionally.**
   - Preserve all tags, attributes, ids, labels, and entity escapes unless the task explicitly requests changes.
   - Never “pretty print” or reflow XML in a way that changes content.
2. **Never edit inside tag brackets** `<...>` unless explicitly instructed.
3. **Do not edit recursively inside these environments** (unless explicitly instructed):
   - `<figure> ... </figure>`, `<image> ... </image>`, `<audio> ... </audio>`, `<video> ... </video>`
4. **Preserve escapes/entities exactly**: `&amp;`, `&lt;`, `&gt;`, etc.
5. **Do not rename files, ids, xml:id, ref targets, component attributes**, or other identifiers.

## Writing style (student-facing)
- Clear, approachable, conversational (use “we” and “you” naturally).
- Avoid unnecessary jargon; define terms the first time.
- Prefer short paragraphs and clean transitions.
- Keep math explanations readable; do not over-lecture.

## Math and display conventions
- Inline math uses `<m> ... </m>`
- Display math uses:
  ```xml
  <me>
    <mrow>...</mrow>
  </me>
  ```
- For aligned multi-line display math:
  - Put each line in its own `<mrow>`
  - Use `\amp` for alignment (not `&=`)

## Output contract (choose one mode per task)
### Mode A — Patch Output
Return **only**:
1. The **updated PreTeXt content** (either full file or a clearly delimited excerpt),
2. A **change log**: a short bulleted list of what changed and why.

### Mode B — Find/Replace Mapping Output (preferred when requested)
Return a JSON mapping with **unique** `find` strings, suitable for an automated find/replace script.
Schema:
```json
{
  "source_file": "path/to/file.ptx",
  "mode": "exact",
  "changes": [
    {
      "id": "file-001",
      "tier": "auto",
      "find": "UNIQUE STRING FROM PTX",
      "replace": "REPLACEMENT STRING",
      "must_match_count": 1,
      "notes": "optional"
    }
  ]
}
```
Rules:
- Each `find` must be **verbatim** from the source and **unique** in the file.
- Set `must_match_count` to the expected count (usually `1`).
- Never include edits that touch tag names/attributes unless explicitly required.

## Quality gates (self-check before final)
- **XML validity**: tags properly nested/closed.
- **No semantic drift**: math statements and definitions remain correct.
- **Consistency**: terms and notation match nearby sections.
- **No accidental deletions**: examples, labels, xrefs remain intact.
- **Pedagogy**: explanations remain accessible to a sophomore-level audience.
