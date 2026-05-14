# RUNBOOK-ORCHESTRATION.md — How to Use These Task Files

## Recommended workflow
1. Select the task file that matches the job:
   - Section rewrite → TASK-SECTION-REWRITE.md
   - Reading checkpoints → TASK-READING-CHECKPOINTS.md
   - Exercises → TASK-EXERCISES.md
   - TTS narration → TASK-TTS-NARRATION.md
2. Prepend AGENT-CORE.md to the agent prompt.
3. Provide:
   - The target file path,
   - The full file content (preferred) or a clearly marked excerpt,
   - Any constraints (tone, length, where to insert questions, etc.).
4. Require the agent to follow the output mode specified in the task file.

## When to require Find/Replace JSON (Mode B)
Use Mode B when:
- You want consistent editorial tweaks across many repeated phrases,
- You will apply changes automatically via script,
- You are editing a `.txt` extraction of the `.ptx` and want a safe mapping.

## When to require Patch Output (Mode A)
Use Mode A when:
- The agent is writing new content (new paragraphs, new questions, new exercises),
- The edits depend on local context,
- You need the updated PreTeXt snippet ready to paste.

## Minimal prompt template
- Include:
  - `TASK: ...`
  - `TARGET: ...`
  - `OUTPUT MODE: A or B`
  - `CONTENT: ...`
  - `CONSTRAINTS: ...`
