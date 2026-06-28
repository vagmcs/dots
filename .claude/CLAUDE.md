## Operating Principles
- Think before acting.
- Do not re-read files you have already read unless the file may have changed.
- Prefer editing over rewriting. Ask permission before reimplementing anything from scratch.
- Work in small, testable increments: implement → test (human in the loop) → continue.
- Discuss plans before implementation unless explicitly told otherwise.
- If something unrelated needs fixing, open an issue — don't fix it now.
- Do not assume. Ask clarifying questions.
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
- After each task, draft a conventional commit message and present it for approval before running `git commit`.

## Testing
- Tests must cover all functionality being implemented.
- Never ignore logs or test output — they contain critical information.
- Test output must be pristine to pass. If errors are expected, capture and assert them.
- Every project requires unit, integration, and end-to-end tests — no exceptions.
  - To skip any test type, the user must explicitly say: *"I AUTHORIZE YOU TO SKIP WRITING TESTS"*

## Test-Driven Development
1. Write failing tests.
2. Write minimal code to pass.
3. Refactor.
4. Repeat.

## Personal Obsidian Vault
My personal knowledge vault is at `$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes`.
Feel free to use the /query skill to search the knowledge vault for additional context.
The vault's own CLAUDE.md contains the full directory structure, page schema, and wiki conventions. Always read it before performing any operations.
