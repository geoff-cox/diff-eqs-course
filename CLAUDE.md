# CLAUDE.md — Project Instructions for Claude Code (MA 311 repo)

Read automatically by Claude Code (CLI and the GitHub Action) at the
start of every task. Keep edits to this file surgical.

When a request says **"Task X"** (e.g., "Task B2"), it refers to a task
in `checklists/mobile-build-checklist.md` and its per-track detail files
`checklists/mobile-build-checklist-{A,B,C,D,M}.md`. Open the matching file
and follow its steps and acceptance criteria exactly.

---

## 1. What this repository is

The course site and materials for **MA 311 — Ordinary Differential
Equations**, being refreshed for a new semester. Two content streams
live here:

1. **Homepage/syllabus** — `source/homepage.ptx` including the syllabus
   under `source/homepage/syllabus/`, with shared VMI policy files in
   `source/homepage/syllabus/common/`.
2. **Guided Lecture Notes (GLN)** — PreTeXt `<worksheet>` files in
   `source/notes/`, drafted from old LaTeX/Beamer decks in
   `source/notes/latex/` and the coursebook. Student copies have blanks
   and unworked examples; instructor copies reveal everything.

## 2. The coursebook is EXTERNAL and READ-ONLY

The textbook, *Exploring Differential Equations* (Geoffrey Cox), lives
in its own repository: <https://github.com/geoff-cox/debookrs>. The
published student-facing render is on Runestone Academy.

- **This repo never modifies the textbook.** No task here touches
  debookrs; if a task uncovers a textbook error, report it under the
  PR's "Open questions" (with chapter/section) so the instructor can fix
  it in debookrs — do not attempt a cross-repo PR unless explicitly
  asked.
- For GLN drafting, clone it read-only **outside** the workspace:
  `git clone --depth 1 https://github.com/geoff-cox/debookrs.git /tmp/debookrs`
  (the GitHub Action does this for you). Never commit any part of it
  into this repo.
- Coursebook layout: `source/main.ptx` (entry), `source/main-parts.ptx`,
  chapter directories `source/c0-whats-a-de/ ... c14-nlinsys/`, each with
  a `*-model.ptx` chapter file and `sec-*.ptx` sections. The chapter
  map is in `checklists/mobile-build-checklist-B-guided-notes.md`.

## 3. Repository layout (orient before editing)

```
.
├── CLAUDE.md                          <- this file
├── checklists/
│   ├── mobile-build-checklist.md      <- master index + global rules
│   └── mobile-build-checklist-*.md    <- per-track details (A..D)
├── project.ptx                        <- PreTeXt targets (read FIRST)
├── publication/                       <- publication files per target
├── source/
│   ├── homepage.ptx
│   ├── homepage/syllabus...           <- Task A (see note below)
│   ├── homepage/syllabus/common/      <- shared VMI policies: NEVER edit
│   ├── bookends/docinfo.ptx           <- macros live here (Task C)
│   ├── notes/                         <- GLN worksheets (Task B)
│   └── notes/latex/                   <- OLD Beamer decks: read-only input
└── .github/workflows/
    ├── claude.yml
    └── deploy-pages.yml               <- Pages deploy (Task D; builds the
                                          deploy targets declared in
                                          project.ptx via `--deploys`)
```

**Known wart:** the syllabus may exist BOTH as a monolithic
`source/homepage/syllabus.ptx` and as modular files under
`source/homepage/syllabus/` (`general-info.ptx`, `grades-coursework.ptx`,
`topics.ptx`, `resources.ptx`) with duplicated content. Task A1 resolves
which one is live and removes the duplication. Until then, check which
file the build actually includes before editing.

Before any task: `pretext --version`, read `project.ptx` for the actual
target names, skim the relevant checklist file. Never assume target
names — read them.

## 4. The guided-notes conventions (Task B core)

Three mechanisms; NOT interchangeable:

1. `<fillin characters="N"/>` — an in-prose blank in BOTH builds.
   **Gotcha:** text inside the tag is silently discarded; the answer
   never lives inside `<fillin>`.
2. `<commentary>` — block-level, instructor-only; visibility from the
   `commentary` stringparam set per-target in `project.ptx` (`"yes"` on
   instructor targets only). Placed after the prose with the blanks,
   never inline.
3. `<exercise>` with `<statement>` + `<solution>` — multi-step worked
   computations; visibility via
   `<exercise-worksheet statement="yes" solution="no|yes"/>` in the
   publication files.

**Gotcha:** PreTeXt `<example>` renders its solution in BOTH builds —
anything whose answer must hide on the student copy uses `<exercise>`.
Reserve `<example>` for read-along illustrations with NO hidden content.

**Commentary pattern:** group the blanks for one idea into a single
paragraph/list, then place ONE `<commentary>` block immediately after it
listing the answers *in order*. Do not scatter one commentary per blank.

Quick selection table:

| Situation                                 | Use                         |
|-------------------------------------------|-----------------------------|
| One/two-word blank inside a sentence      | `<fillin>` + `<commentary>` |
| Definition or theorem with a blank in it  | `<fillin>` + `<commentary>` |
| Multi-step worked computation             | `<exercise>` + `<solution>` |
| "Your turn" practice problem              | `<exercise>` + `<solution>` |
| Read-along illustration, no hidden answer | `<example>` (no solution)   |

If this repo lacks model worksheets, copy the pattern from the sibling
course repo's `ws-function-notation.ptx` / `ws-vectors.ptx` (comment
header explaining the mechanisms, `<objectives>`, `<page>` divisions,
"Looking ahead" closer).

## 5. Verification gates (mandatory before every PR)

1. **Well-formedness** — for every touched `.ptx`:
   `python3 -c "import xml.etree.ElementTree as ET; ET.parse('FILE'); print('OK')"`
2. **Build** — `pretext build <target>` for every affected target from
   the repo root; filter the known-harmless warning with
   `grep -v 'asset directories'`; fix or explain anything left.
3. **Xref integrity** — zero unresolved cross-reference warnings.
4. **Visibility split** (worksheets) — sentinel phrase from
   solution/commentary prose:
   student build grep count = 0, instructor build count >= 1.

Paste literal command output into the PR's "Verification evidence"
section. A PR without evidence is incomplete.

## 6. PR workflow

- Never push to `main`. Branch `claude/<task-id>-<slug>`; one Task per
  PR; use the PR template; add the `preview` label so `deploy-pages.yml`
  publishes the branch's rendered HTML to GitHub Pages.
- Keep PRs phone-reviewable: several small PRs beat one large one.
- Respond to review comments on the same branch; re-run all gates after
  every revision.

## 7. Improve, but itemize

Some material here hasn't been updated in a while. You are expected to
exercise judgment and actively improve it: deepen shallow treatments,
add motivating examples and misconception checks, fix errors, propose
effective or creative pedagogical ideas. The contract: **every
substantive improvement is itemized in the PR's "Improvements"
section**, and genuinely uncertain editorial calls get a
`<!-- TODO(geoff): ... -->` comment plus an "Open questions" line.
Faithful conversion is the baseline; silent deviation is prohibited.

## 8. Prohibited

- Editing `source/homepage/syllabus/common/` (shared VMI policy text).
- Editing `source/notes/latex/` (historical inputs, read-only).
- Modifying, vendoring, or committing any part of the debookrs
  coursebook into this repo.
- Answers inside `<fillin>`; `<example>` where the answer must hide;
  inline `<commentary>`.
- Defining LaTeX macros anywhere except `source/bookends/docinfo.ptx`.
- Merging your own PRs, force-pushing, or rewriting history on `main`.
