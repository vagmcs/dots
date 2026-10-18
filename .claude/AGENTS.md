## Operating Principles
- Think before acting.
- Do not re-read files you have already read unless the file may have changed.
- Prefer editing over rewriting. Ask permission before reimplementing anything from scratch.
- Work in small, verifiable increments.
- For non-trivial or ambiguous changes, briefly discuss the plan before implementation.
- If something unrelated needs fixing, report it; do not fix it in the current task.
- Ask clarifying questions when a material decision cannot be inferred safely.
- Be concise in output, thorough in reasoning.
- User instructions always override this file.

## Coding
- Readability and maintainability are primary concerns.
- Prefer the simplest solution that works. No over-engineering, no one-off abstractions.
- Match the style and formatting of surrounding code. File consistency > external standards.
- No docstrings or comments unless logic is non-obvious.
- Never remove comments unless provably false. Preserve them as documentation.
- Comments must be evergreen — describe code as-is, not its history or recent changes.
- Never name things `improved`, `new`, `enhanced`, etc. Names must be evergreen.

## Git Workflow
- Never commit directly to `main`/`master`.
- After each task, draft a [Scoped Commits](https://scopedcommits.com) message and present it for approval before running `git commit`.

## Testing
- Add or update tests for implemented behavior.
- Run the test layers relevant to the change: unit, integration, and/or end-to-end.
- For changes that affect user-visible workflows or system boundaries, include integration or end-to-end coverage when practical.
- Never ignore logs or test output — they contain critical information.
- Test output must be pristine to pass. If errors are expected, capture and assert them.
- State any test layer not run and why.

## Test-Driven Development
- For behavior changes, write a failing test first when practical.
- For configuration, documentation, exploratory, or trivial mechanical changes, use an appropriate verification method instead.

## Personal Obsidian Vault
My personal knowledge vault is at `$OBSIDIAN_VAULT`.
Feel free to use the /query skill to search the knowledge vault for additional context.
The vault's own AGENTS.md contains the full directory structure, page schema, and wiki conventions. Always read it before performing any operations.
