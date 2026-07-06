# Track B — Guided Lecture Notes (GLN)

**Goal:** one PreTeXt `<worksheet>` per course section, in
`source/notes/`, blending three inputs:

1. the old LaTeX/Beamer decks in `source/notes/latex/` (structure,
   examples; the reveal pattern `\ON<1>{\B{...}}` marks what becomes a
   blank or hidden solution),
2. the **coursebook** *Exploring Differential Equations* — cloned
   read-only to `/tmp/debookrs` (see `CLAUDE.md` §2); its definitions,
   theorems, examples, and exercise pools are the mathematical source
   of truth, and the GLN should track its notation and chapter order,
3. **new material Claude recommends** — modern applications,
   conceptual warm-ups, common-misconception checks — itemized as
   Improvements.

Worksheet-authoring conventions: **`checklists/worksheet-conventions.md`**
(shared byte-identical with `vector-calc-course` — see `CLAUDE.md` §4
for this repo's parameters). Model worksheet:
`source/notes/ws-what-is-a-de.ptx`.

## Coursebook chapter map (debookrs, `source/`)

| Dir | Chapter |
|---|---|
| `c0-whats-a-de` | Modeling with Differential Equations |
| `c1-classification` | Modeling with Classification |
| `c2-solns` | Modeling and Verifying Solutions |
| `c3-di` | Modeling with Direct Integration |
| `c4-sov` | Modeling with Separation of Variables |
| `c5-if` | Modeling with Integrating Factors |
| `c6-qm` | Qualitative Modeling and Phase Line Analysis |
| `c7-em` | Numerical Modeling with Euler's Method |
| `c8-lhcc` | Modeling with Homogeneous Linear Equations |
| `c9-uc` | Modeling Forced Systems with Undetermined Coefficients |
| `c10-lt` | Modeling with Laplace Transforms |
| `c11-ltm` | Real-World Problems with the Laplace Transform Method |
| `c12-ltp` | Modeling Systems with Piecewise Forcing |
| `c13-linsys` | Modeling with Linear Systems |
| `c14-nlinsys` | Modeling with Nonlinear Systems |

Each chapter dir holds a `*-model.ptx` chapter file, `sec-*.ptx`
sections, and `exercises-*.ptx`. Entry points: `source/main.ptx` /
`source/main-parts.ptx` (check which is current; `main-dev.ptx` and
`abandoned-content.ptx` are not authoritative). Verify this table
against the live clone before relying on it — the book is actively
maintained.

---

## Task B1 — Worksheet roadmap (once, before any B2)

1. Inventory `source/notes/latex/` and map each old deck to the
   coursebook section(s) covering the same material and to the
   syllabus topic list (core + secondary ODP topics).
2. Where the course covers a topic with no old deck (or a deck predates
   the book's current "modeling-first" framing), plan a from-scratch
   worksheet sourced from the coursebook.
3. Write `docs/gln-roadmap.md`: ordered table —
   `worksheet slug | title | old deck(s) | book section(s) | ODP topic | status`
   — with `status` starting at `todo`.
4. Set up the notes machinery: read `project.ptx`; ensure student and
   instructor notes targets exist (publication files with
   `<version include="notes stu"/>` vs `<version include="notes key"/>`
   per `CLAUDE.md` §4), and a notes container file that worksheets
   `<xi:include>` into. Build both targets empty or with any existing
   worksheets.
5. Update the roadmap's `status` column in every later B2 PR.

**Acceptance:** roadmap covers every ODP topic; both notes targets
build; the sentinel-grep gate is demonstrated once end-to-end on a
minimal stub worksheet (then delete or keep the stub — instructor's
call, ask in the PR).

## Task B2 — Draft one worksheet (repeat per roadmap row)

Invocation names the row, e.g.:
`@claude Task B2 for "Slope Fields" (book: c6-qm/sec-slope-fields.ptx).`

1. Read the old deck (if any), the mapped book section(s) in
   `/tmp/debookrs`, and the model worksheet
   (`source/notes/ws-what-is-a-de.ptx`).
2. Author per the shared conventions —
   **`checklists/worksheet-conventions.md`** — which govern the
   mechanisms (stu/key pairs, `workspace`), layout, structure,
   Beamer-deck translation, sourcing rules (including "never reuse the
   book's example equations"), figures, improvements, and macros.
   Course-specific notes for this repo:
   - the worksheet is the in-class companion to a section students have
     already read on Runestone;
   - never copy binary assets from debookrs into this repo.
3. Wire the worksheet in via `<xi:include>` in `source/notes.ptx`; flip
   its roadmap row to `in-review`.
4. If the deck and the book disagree mathematically, the book wins;
   note the discrepancy. If the *book* looks wrong, do not "fix" it in
   the worksheet silently — flag it under "Open questions" with
   chapter/section so the instructor can patch debookrs.

**Verification:** all four gates in `CLAUDE.md` §5, with the
visibility-split procedure from `worksheet-conventions.md` §6 — it is
the heart of this track. Also confirm blanks render on the Pages
preview student copy.

**Acceptance per worksheet:** `worksheet-conventions.md` §7 (builds in
both notes targets; sentinel counts pass; objectives match content;
Improvements and figure TODOs itemized; roadmap updated; one worksheet
per PR).
