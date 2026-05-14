# skill-add-glossary-items.md
Generate glossary items for a section

## Notation
- FILENAME = `./source/c*-*/sec-secTitle.ptx`

Section file to be modified.

## Inputs you will receive
- secTitle: Refers to the section name used in FILENAME.

## Stage 1: FILENAME Sweep
- You will sweep the content [FILENAME] looking for important terms that are important to the topic and may be referenced later.
- For each [TERM] found, generate a concise [TERM-DESCRIPTION] based on the surrounding prose. 
Enhance terms with one or more simple examples that link the term to its description. 
- Use existing glossary items for the style and formatting of new glossary items.

## Stage 2: Glossary Population
- For each [TERM] and [TERM-DESCRIPTION] pair, generate a glossary item using the format:

```
<glossary xml:id="glossary-main">
  <title>Glossary</title>

  ...

  <!-- ============================================================ -->
  <!-- [TOPIC-NAME] Terms                                           -->
  <!-- ============================================================ -->

  <gi xml:id="gi-[TERM]">
    <title>[TERM]</title>
    <p>
      [TERM-DESCRIPTION]
    </p>
  </gi>

  ...

</glossary>
```

where [TOPIC-NAME] is derived from the `<title>` tags of [FILENAME].

## NOTE
A separate sweep will add subsequent references to these glossary items at later point in the textbook. 
