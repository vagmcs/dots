---
name: query
description: Query the Obsidian LLM wiki. Reads the index, finds relevant pages, and synthesizes an answer with citations. Files the answer only when explicitly asked.
argument-hint: <question>
disable-model-invocation: true
allowed-tools: Bash(obsidian *)
---

**Do not use MCP tools.** Use only the `obsidian` CLI via Bash. Run `obsidian --help` for available commands and flags.

Answer the question: `$ARGUMENTS`

## Step 1 — Orient

Read the index for a structural overview:
```bash
obsidian read path="Wiki/index.md"
```

Then search the wiki for terms relevant to the question:
```bash
obsidian search query="<key terms>" path="Wiki" format=json
```

Run multiple searches with different terms if the question covers several concepts.
Combine the index and search results to build a reading list of relevant pages.

## Step 2 — Read

Read each relevant page:
```bash
obsidian read path="<file>.md"
```

Follow `[[wikilinks]]` to related pages if the initial pages are insufficient.
If no relevant pages exist, say so and indicate which source directories might
contain material worth ingesting.

## Step 3 — Answer

Synthesize an answer with explicit citations to wiki pages. Format citations as:
`([[wiki/concepts/slug|concept name]])`

## Step 4 — File (only if asked)

If the user says "file this" or "save this to the wiki", write the answer as
`Wiki/qa/<slug>.md` with frontmatter:
- `aliases`: alternative names or phrasings for this finding
- `tags`: relevant domain tags + type `qa` or `synthesis`
- `last_updated`: today's date

Then append to log:
```bash
obsidian append path="Wiki/log.md" content="## [<YYYY-MM-DD>] query | <question>\n\nFiled as [[qa/<slug>]]."
```
