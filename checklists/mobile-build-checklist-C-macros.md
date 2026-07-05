# Track C — LaTeX Macro Management

All macros live in exactly one place: the `<macros>` element of
`source/bookends/docinfo.ptx` (plus `<latex-image-preamble>` for
TikZ-only packages). If `project.ptx` reveals that any target uses a
different docinfo file, a macro must be added to **every docinfo used
by a target that renders it** — verify before assuming there is only
one.

**Notation follows the book.** The GLN accompany *Exploring
Differential Equations* (debookrs). When the book's docinfo
(`/tmp/debookrs/source/aa-bookends/`) defines a macro for a notion the
worksheets also use, reuse the same macro *name* and rendering here so
students see one notation — but the *definition* must be copied into
this repo's docinfo (targets never read debookrs).

## Task C1 — Standing rule (enforced inside every other task)

Whenever a document authored in Tracks A–C uses a LaTeX macro:

1. If it's already defined in the relevant docinfo, use it — do not
   redefine, do not invent a synonym (`\vv` exists; don't add `\vecv`).
2. If it's new, add it in the same PR: semantic name, `\newcommand` (or
   `\DeclareMathOperator`), grouped with its family, one per line,
   with the existing style (e.g., `\vF`, `\norm{...}`, `\proj`).
3. Old Beamer decks use header macros like `\D` (displaystyle), `\B`
   (reveal box), `\ON`, `\OBUL`. Do **not** port presentation-mechanic
   macros (`\B`, `\ON`, `\OBUL`) — they are the reveal system, replaced
   by fillin/commentary. Port genuinely semantic ones (e.g., a Laplace
   transform shorthand like `\lap{...}`) only if used in 3+ places,
   preferring the book's name for it; otherwise inline the LaTeX.

## Task C2 — Macro audit (run occasionally, or when math renders wrong)

1. Extract every control sequence used in `source/**/*.ptx` math:
   `grep -rhoE '\\\\[a-zA-Z]+' source --include='*.ptx' | sort | uniq -c | sort -rn`
   (crude but effective; ignore XML entities and PreTeXt tags).
2. Diff against (a) macros defined in each docinfo and (b) a whitelist
   of standard LaTeX/AMS commands. Anything undefined and nonstandard
   is a bug: define it or fix the usage.
3. Flag name clashes where this repo's definition differs from the
   book's rendering of the same macro (notation drift), and dead macros
   defined but never used (report only — deleting definitions is the
   instructor's call).
4. Build all targets; confirm no MathJax/LaTeX "undefined control
   sequence" output. Open a PR only if fixes are needed; otherwise post
   the report as an issue comment.

**Acceptance:** zero undefined control sequences across all targets;
report distinguishes fixed / duplicate / dead.
