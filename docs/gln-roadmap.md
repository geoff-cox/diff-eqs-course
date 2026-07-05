# Guided Lecture Notes (GLN) roadmap

Ordered plan of one PreTeXt `<worksheet>` per course section, drafted from
the old Beamer decks in `source/notes/latex/`, tracking the coursebook
*Exploring Differential Equations* (`geoff-cox/debookrs`).

> **Status of this file.** This is a *seed* roadmap created alongside the first
> B2 worksheet (Task B2 for `c0_*` + `c1_*`). It is keyed to the coursebook
> chapter map, not yet to the syllabus ODP topic list — completing that mapping
> and confirming full topic coverage is the remaining part of **Task B1**. Rows
> are added/refined as worksheets are drafted.

## Notes build machinery (set up with the first worksheet)

- `source/notes.ptx` — container `<article>` that `<xi:include>`s each worksheet.
- Two targets in `project.ptx`, sharing `notes.ptx`, differing only by
  publication file:
  - `notes-student` → `publication/notes-student-pub.ptx`
    (`exercise-worksheet solution="no"`, `<version include="notes">`).
  - `notes-instructor` → `publication/notes-instructor-pub.ptx`
    (`exercise-worksheet solution="yes"`, `<version include="notes instructor">`).
- Instructor-only `<commentary component="instructor">` blocks are kept only
  when `instructor` is in the target's `<source><version include="…">` list.
  (PreTeXt 2.43.1 removed the older `commentary` stringparam that `CLAUDE.md`
  §4 describes; the component/version mechanism is the current equivalent.)

## Worksheet rows

| Worksheet slug | Title | Old deck(s) | Book section(s) | Status |
|---|---|---|---|---|
| `ws-intro-classification` | What Is a Differential Equation? Naming Its Parts and Classifying It | `01 intro-topics` (What is a DE, ODE/PDE, order, linearity) | `c0-whats-a-de/sec-connection-to-alg-calc`, `sec-de-defn`, `sec-variables`, `sec-terms-coeffs`; `c1-classification/sec-order`, `sec-linear-terms`, `sec-linearity` | **in-review** |
| `ws-solutions-ivp` | Verifying Solutions & Initial Conditions | `01 intro-topics` (Verifying DEs, Initial Conditions) | `c2-solns/*` | todo |
| `ws-direct-integration` | Solving by Direct Integration | — (new) | `c3-di/*` | todo |
| `ws-separation-of-variables` | Separation of Variables | `02 sov` | `c4-sov/*` | todo |
| `ws-integrating-factors` | Integrating Factors | `03 if` | `c5-if/*` | todo |
| `ws-slope-fields` | Slope Fields & Qualitative Analysis | `08 slope-fields` | `c6-qm/*` | todo |
| `ws-eulers-method` | Euler's Method | `07 eulers-method` | `c7-em/*` | todo |
| `ws-homogeneous-linear` | Homogeneous Linear Equations (constant coeff.) | `04 lhcc` | `c8-lhcc/*` | todo |
| `ws-undetermined-coefficients` | Undetermined Coefficients | `05 lncc` | `c9-uc/*` | todo |
| `ws-laplace-transforms` | Laplace Transforms | `06 lt` | `c10-lt/*` | todo |
| `ws-laplace-method` | Solving DEs with the Laplace Method | `06 lt` | `c11-ltm/*` | todo |
| `ws-piecewise-forcing` | Piecewise Forcing | `06 lt` | `c12-ltp/*` | todo |
| `ws-linear-systems` | Linear Systems | `09 systems / reduction-of-order` | `c13-linsys/*` | todo |
| `ws-nonlinear-systems` | Nonlinear Systems | `09 systems` | `c14-nlinsys/*` | todo |

**Statuses:** `todo` → `in-review` (PR open) → `done` (merged).
