# skill-add-idx-tags-for-index.md 
Generate <idx> tags for Index entries

## Notation
- FILENAME = `./source/c*-*/sec-secTitle.ptx`

Section file to be modified.

## Inputs you will receive
- secTitle: Refers to the section name used in FILENAME.

## FILENAME Sweep
- You will sweep the content [FILENAME] looking for important [CONCEPT]s that belong in a textbook's index.
- For each [CONCEPT] found, ensure that it is contained inside is a `<parentTag>` that supports an `<idx>` tag.
  - If there is no `<parentTag>`, then flag it in the PR notes.
  - If there is a `<parentTag>` and does not already have an `<idx>` tag, then add one with a short title or description that will be seen in the Index.
