# Guided Lecture Notes (GLN) roadmap

Ordered plan of one PreTeXt `<worksheet>` per course section, drafted from
the old Beamer decks in `source/notes/latex/`, tracking the coursebook
*Exploring Differential Equations* (`geoff-cox/debookrs`).

> **Status of this file.** This is a *seed* roadmap created alongside the first
> B2 worksheet (Task B2 for `c0_*` + `c1_*`). It is keyed to the coursebook
> chapter map, not yet to the syllabus ODP topic list — completing that mapping
> and confirming full topic coverage is the remaining part of **Task B1**. Rows
> are added/refined as worksheets are drafted.

## Notes build machinery (set up with the first worksheets)

- `source/notes.ptx` — container `<article>` that `<xi:include>`s each worksheet.
- Two targets in `project.ptx`, sharing `notes.ptx`, differing only by
  publication file:
  - `notes-student` → `publication/notes-student-pub.ptx`
    (`exercise-worksheet solution="no"`, `<version include="notes stu">`).
  - `notes-instructor` → `publication/notes-instructor-pub.ptx`
    (`exercise-worksheet solution="yes"`, `<version include="notes key">`).
- Student/instructor content split uses `component="stu"` / `component="key"`
  on mirrored elements (paired `<p>`s for reading-check blanks, paired
  `<exercise>`s for worked problems); the publication file's
  `<source><version include="…">` selects which survives. Student exercises
  carry `workspace="Xin"` for write-in space; `<page>` delimits printed
  letter-page vertical space, not topics; display math uses `<md>`.
  See `CLAUDE.md` §4 and `source/notes/ws-what-is-a-de.ptx` for the model.

## Worksheet rows

| Worksheet slug | Title | Old deck(s) | Book section(s) | Status |
|---|---|---|---|---|
| `ws-what-is-a-de` | What Is a Differential Equation? | `01 intro-topics` (What is a DE, ODE/PDE) | `c0-whats-a-de/sec-connection-to-alg-calc`, `sec-de-defn`, `sec-variables`, `sec-terms-coeffs` | **done** |
| `ws-classification` | Classifying Differential Equations | `01 intro-topics` (order, linearity) | `c1-classification/sec-order`, `sec-linear-terms`, `sec-linearity` | **done** |
| `ws-solutions-ivp` | Verifying Solutions & Initial Conditions | `01 intro-topics` (Verifying DEs, Initial Conditions) | `c2-solns/*` | **done** |
| `ws-direct-integration` | Solving by Direct Integration | — (new) | `c3-di/*` | **in-review** |
| `ws-separation-of-variables` | Separation of Variables | `02 sov` | `c4-sov/*` | **done** |
| `ws-integrating-factors` | Integrating Factors | `03 if` | `c5-if/*` | **done** |
| `ws-slope-fields` | Slope Fields & Qualitative Analysis | `08 slope-fields` | `c6-qm/*` | **done** |
| `ws-eulers-method` | Euler's Method | `07 eulers-method` | `c7-em/*` | **done** |
| `ws-homogeneous-linear` | Homogeneous Linear Equations (constant coeff.) | `04 lhcc` | `c8-lhcc/*` | **done** |
| `ws-undetermined-coefficients` | Undetermined Coefficients | `05 lncc` | `c9-uc/*` | **in-review** |
| `ws-laplace-transforms` | Laplace Transforms | `06 lt` | `c10-lt/*` | todo |
| `ws-laplace-method` | Solving DEs with the Laplace Method | `06 lt` | `c11-ltm/*` | todo |
| `ws-piecewise-forcing` | Piecewise Forcing | `06 lt` | `c12-ltp/*` | todo |
| `ws-linear-systems` | Linear Systems | `09 systems / reduction-of-order` | `c13-linsys/*` | todo |
| `ws-nonlinear-systems` | Nonlinear Systems | `09 systems` | `c14-nlinsys/*` | todo |

**Statuses:** `todo` → `in-review` (PR open) → `done` (merged).
