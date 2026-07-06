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

**Model worksheet: `source/notes/ws-what-is-a-de.ptx`.** When in doubt,
copy its patterns exactly.

The student/instructor split uses the component/version mechanism:
elements marked `component="stu"` appear only in the student build,
`component="key"` only in the instructor build, selected by
`<source><version include="notes stu"/>` (student) vs
`<version include="notes key"/>` (instructor) in the publication files.
**Both versions must mirror each other in structure** — a `stu` element
is always paired with a matching `key` element at the same spot.

The mechanisms; NOT interchangeable:

1. **Reading-check blanks** — paired paragraphs: `<p component="stu">`
   containing `<fillin characters="N"/>` blanks, immediately followed by
   `<p component="key">` with the same sentence and the answers written
   as `<m>\underline{\textbf{answer}}</m>`.
   **Gotcha:** text inside `<fillin>` is silently discarded; the answer
   never lives inside `<fillin>`.
2. **Worked problems** — paired exercises:
   `<exercise component="stu" workspace="Xin">` (statement only) followed
   by `<exercise component="key">` (same statement plus `<solution>`).
   `workspace="Xin"` reserves X inches of write-in space on the printed
   student copy — be conservative and add extra room for students who
   write large. Short True/False checks may instead be a single
   `<exercise>` with `<solution component="key">`.
3. `<exercise-worksheet statement="yes" solution="no|yes"/>` in the
   publication files additionally hides/reveals bare `<solution>`s.

**Layout rules:**

- `<page>` delimits vertical space for letter-size printing, NOT topics.
  Never put a `<title>` on a `<page>`; write headings as
  `<p><term>Heading text.</term></p>`.
- No `<title>` on exercises unless it is important to the statement
  (e.g. "True or False") — space is precious on these worksheets.
- Display math uses `<md>`; `<me>`/`<men>` are deprecated.

**Gotcha:** PreTeXt `<example>` renders its solution in BOTH builds —
anything whose answer must hide on the student copy uses `<exercise>`.
Reserve `<example>` for read-along illustrations with NO hidden content.

Quick selection table:

| Situation                                 | Use                                          |
|-------------------------------------------|----------------------------------------------|
| One/two-word blank inside a sentence      | paired `<p component="stu|key">` + `<fillin>`|
| Definition or theorem with a blank in it  | paired `<p component="stu|key">` + `<fillin>`|
| Multi-step worked computation             | paired `<exercise component="stu|key">` + `workspace` |
| "Your turn" practice problem              | paired `<exercise component="stu|key">` + `workspace` |
| Quick True/False check                    | one `<exercise>` + `<solution component="key">` |
| Read-along illustration, no hidden answer | `<example>` (no solution)                    |

## 5. Verification gates (mandatory before every PR)

1. **Well-formedness** — for every touched `.ptx`:
   `python3 -c "import xml.etree.ElementTree as ET; ET.parse('FILE'); print('OK')"`
2. **Build** — `pretext build <target>` for every affected target from
   the repo root; filter the known-harmless warning with
   `grep -v 'asset directories'`; fix or explain anything left.
3. **Xref integrity** — zero unresolved cross-reference warnings.
4. **Visibility split** (worksheets) — sentinel phrase from
   `<solution>` or `component="key"` prose:
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
  a `component="stu"` element without its mirrored `component="key"`
  partner (or vice versa); `<title>` on `<page>`; `<me>`/`<men>`.
- Defining LaTeX macros anywhere except `source/bookends/docinfo.ptx`.
- Merging your own PRs, force-pushing, or rewriting history on `main`.
