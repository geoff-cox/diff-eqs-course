# Track A — MA 311 Syllabus Review & Update

**Goal:** bring the existing MA 311 syllabus up to date for the new
semester. This is a *refresh*, not a rewrite — the course design
(proficiency-based grading with ODPs, core/secondary topics, Runestone
reading, WebWork homework) stays unless the instructor says otherwise.

**Hard constraint:** files under `source/homepage/syllabus/common/`
(attendance, work-for-grade, MERC, Writing Center, AI policy, etc.) are
inherited unchanged.

---

## Task A1 — Resolve the syllabus source-of-truth (structure only)

The repo carries the syllabus in two forms with overlapping content: a
monolithic `source/homepage/syllabus.ptx` AND modular files under
`source/homepage/syllabus/` (`general-info.ptx`, `grades-coursework.ptx`,
`topics.ptx`, `resources.ptx`, ...). Duplication guarantees drift.

1. Trace the include chain from `project.ptx` → `source/homepage.ptx`
   downward and determine which form the build actually renders.
2. Diff the two forms section-by-section and post the differences in
   the PR body (this is the "duplication report").
3. Consolidate to the **modular** form (one file per section, a thin
   `syllabus.ptx` that only `<xi:include>`s them) — it matches the
   `common/` pattern and makes future semester refreshes single-file
   edits. Where the two forms disagree, keep the newer/renders-now text
   and flag the loser's unique content under "Open questions".
4. Delete the redundant copy only after the build is green and the
   rendered syllabus on the Pages preview is unchanged (byte-level HTML
   diff against a pre-change build is ideal evidence).

**Acceptance:** exactly one source of truth; homepage target builds
clean; rendered syllabus content-identical (or every difference
itemized); duplication report in the PR.

## Task A2 — Semester refresh (content)

Requires instructor-supplied facts in the request (see the mobile
recipe): term, meeting days/times/room, WebWork course id, Runestone
course code. If any is missing, use `<insert>TBD</insert>` +
`<!-- TODO(geoff) -->` and list it under "Open questions" — never
carry forward a stale semester-specific value silently.

1. Update semester-specific values: meeting info, Runestone course code
   (currently `vmi-differential-eqns-fall-25-cox`), WebWork URL
   (currently `.../ma311-fa25-cox`), any dated policies or deadlines.
2. Link check: fetch every `<url>` in the syllabus (textbook Runestone
   URL, WebWork, MERC, mailto sanity). Report dead/redirecting links;
   fix the obviously-moved ones, flag the rest.
3. Consistency pass against the course design: topic counts in the
   grading table vs. the topics section, ODP rules stated identically
   everywhere, no references to retired assignments (e.g., the
   commented-out Modeling Scenarios block — propose delete or revive
   under "Open questions").
4. Improvements welcome: clearer grade-table presentation, a short
   "how to succeed in this course" paragraph, tightened prose —
   itemized as always. Do **not** change the grading scheme itself
   without an explicit instruction; if the scheme looks internally
   inconsistent, flag it instead.

**Verification:** gates 1–2 on the homepage target;
`grep -in "fa25\|fall-25\|S2015" output/<homepage-target>/*.html` returns
nothing once the new-term values are in; Pages preview reads coherently.

**Acceptance:** no stale semester tokens; all links verified or
flagged; `common/` byte-identical (`git diff --stat` shows nothing
under `common/`).
