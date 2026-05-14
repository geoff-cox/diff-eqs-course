# Copilot Instructions — Exploring Differential Equations (PreTeXt)

## Repo summary
- Repository for “Exploring Differential Equations,” an open-access PreTeXt XML textbook (student-centered intro to differential equations).
- Core content is modular PreTeXt XML in `source/`.
- Builds and outputs are controlled by `project.ptx` and `publication/*.ptx`.
- Supporting scripts live in `processing-tools/` (TTS audits, post-processing, LaTeX→PreTeXt helpers).

## High-level info
- Type: PreTeXt XML textbook project.
- Languages: PreTeXt XML (`.ptx`), Python, JavaScript, CSS/SCSS, Markdown.
- Tooling/runtime: PreTeXt CLI (Python). PreTeXt may invoke npm for theme/CSS builds. Optional LaTeX for PDF.

## Layout / architecture (where to look)
- `project.ptx`: PreTeXt project manifest (targets like `web`, `dev`, `pdf`, `runestone`).
- `source/`: main PreTeXt sources (`main.ptx`, `main-dev.ptx`, chapter folders).
  - Sections: `source/{chapterID}-{chapterTitle}/sec-{sectionTitle}.ptx`
  - Exercises: `source/{chapterID}-{chapterTitle}/exercises-{sectionTitle}.ptx`
- `publication/`: publication configs (`publication.ptx` for web/dev/pdf, `runestone.ptx` for Runestone).
- `assets/`: custom styles, JS interactives, data.
- `processing-tools/`: TTS audits and conversion utilities.

## Root file list (major)
- `README.md`
- `project.ptx`
- `requirements.txt`
- `common-regex-commands.md`
- `assets/`
- `processing-tools/`
- `publication/`
- `source/`

## Editing guardrails (agent safety)
- Preserve PreTeXt structure and identifiers: do not change `xml:id`, `label`, `ref`, target names, or publication parameters unless explicitly requested.
- Do not pretty-print/reflow XML wholesale.
- Avoid modifying generated output dirs (e.g., `web/`, `print/`) unless the task explicitly targets them.

## Build / run (expected commands)
- Install deps:
  - `python -m pip install -r requirements.txt`
- Check PreTeXt:
  - `python -m pretext --version`
- Build targets (common):
  - Web: `python -m pretext build -t web`
  - Dev: `python -m pretext build -t dev`
  - PDF: `python -m pretext build -t pdf`

## Known environment-dependent issues
- Web builds may fail in offline or restricted-network environments if external services are required (e.g., WebWork server URL resolution).
  - If this occurs, inspect `publication/publication.ptx` for WebWork-related configuration.
  - To locate the setting quickly: search `publication/` for the WebWork host string.

## Key snippet (project.ptx targets)
(Keep this excerpt up to date if targets change.)

## Guidance (how to proceed on tasks)
- Trust this file for repo navigation and build entry points.
- When editing content, follow local conventions in nearby `.ptx` files (terminology, tagging patterns, exercise formats).
- If something is unclear, search the repo for similar patterns (same chapter/section type) before inventing a new structure.
