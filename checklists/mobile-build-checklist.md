# Mobile Build Checklist — Master Index (MA 311)

Task catalog for refreshing the MA 311 (Ordinary Differential Equations)
course materials. Each task has an ID (`A1`, `B2`, ...). From the GitHub
mobile app, open an issue or comment and write, for example:

> @claude Do Task B2 for "Separation of Variables".

Claude Code reads `CLAUDE.md` (conventions, verification gates, PR
rules, coursebook access) automatically; the per-track files hold the
step-by-step details. Track letters match the original build-task
letters: A = syllabus, B = GLN, C = macros, plus D = deployment.

| Track | File | Scope |
|---|---|---|
| A | `mobile-build-checklist-A-syllabus.md` | Review & update the MA 311 syllabus |
| B | `mobile-build-checklist-B-guided-notes.md` | Guided Lecture Notes worksheets |
| C | `mobile-build-checklist-C-macros.md` | LaTeX macro management |
| D | `mobile-build-checklist-D-deploy.md` | GitHub Pages deployment |
| M | `mobile-build-checklist-M-maintenance.md` | Ad hoc: answer keys, figures, QA, build fixes, visibility |

**The coursebook (debookrs) is external and read-only** — see
`CLAUDE.md` §2. No task in this repo modifies the textbook.

## Recommended work order

1. **D1** (verify the deploy-target config in `project.ptx` — the
   workflow builds via `pretext build --deploys`) — first, so every
   later PR is reviewable as rendered HTML on Pages.
2. **A1 → A2** (syllabus) — A1 untangles the monolithic-vs-modular
   syllabus duplication; A2 is the semester refresh.
3. **B1**, then **B2 repeated per section** — the long tail; one
   worksheet per PR, ordered by the course schedule.
4. **C1/C2** — C1 is a standing rule inside every task; C2 is an
   occasional audit.

## Global rules (apply to every task)

1. One task per branch, one branch per PR, PR template filled out,
   `preview` label applied.
2. All four verification gates from `CLAUDE.md` §5 pass, with literal
   command output pasted in the PR.
3. `source/homepage/syllabus/common/` and `source/notes/latex/` are
   never modified; debookrs is never modified or vendored.
4. Improvements are welcome and encouraged, but every one is itemized
   in the PR's "Improvements" section; judgment calls that change
   meaning (content, math, pedagogy, policy, grading) get
   `<!-- TODO(geoff): ... -->` markers plus an "Open questions" line.
   Typos, grammar, and minor wording fixes are just fixed — a grouped
   one-liner under "Improvements" suffices (CLAUDE.md §7).
5. Any new LaTeX macro goes into `source/bookends/docinfo.ptx` in the
   same PR (Task C1 rule).
6. If inputs are missing or contradictory, ship what's safe and put the
   blocker under "Open questions" — never guess on critical decisions
   (grading changes, semester dates, deleting content).
7. Every PR also updates the **Status board** below, flagging the
   task(s) that PR completes (with the PR number). Repeatable tasks
   (B2, M*) get their per-instance scope noted instead of a single
   done-mark.

## Status board

| Task | Status | Evidence |
|---|---|---|
| A1 — syllabus source-of-truth | ✅ Done | PR #4 |
| A2 — semester refresh | 🔶 Stubs in place | PR #5 — instructor fills `TBD-FA26` values before the semester |
| B1 — worksheet roadmap | ✅ Done | PR #1 (`docs/gln-roadmap.md`) |
| B2 — worksheets (per section) | 🔶 In progress | c0 `ws-what-is-a-de` + c1 `ws-classification` (PRs #1–#2); c2 `ws-solutions-ivp` (PR #6, merged); c3 `ws-direct-integration` (PR #7); c4 `ws-separation-of-variables` (PR #8, merged); c5 `ws-integrating-factors` (PR #9, merged); c6 `ws-slope-fields` (PR #10, merged); c7 `ws-eulers-method` (PR #11, merged); c8 `ws-homogeneous-linear` (PR #12, merged); c9 `ws-undetermined-coefficients` (PR #13, merged); c10 `ws-laplace-transforms` (PR #14); rest per roadmap |
| C1 — macro standing rule | ♻️ Standing | enforced inside every PR |
| C2 — macro audit | ⬜ Not started | — |
| D1 — deploy config | ✅ Done | PR #3 |
| D2 — preview hygiene | ♻️ Standing | every content PR |
| M1–M5 — maintenance | ⬜ As needed | — |

## Mobile request recipes

- `@claude Do Task D1.`
- `@claude Do Task A1 and post the duplication report before changing anything.`
- `@claude Do Task A2. New semester: <term>, meeting <days/times/room>, WebWork course <id>, Runestone course code <code>.`
- `@claude Do Task B1 and attach the roadmap.`
- `@claude Do Task B2 for "Slope Fields" (book: c6-qm/sec-slope-fields.ptx).`
- `@claude Address my review comments on PR #7 and re-run all gates.`
- `@claude Run Task C2 and report; only open a PR if fixes are needed.`
