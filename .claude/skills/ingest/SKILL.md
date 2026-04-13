---
name: ingest
description: Ingest a source file into the Obsidian LLM wiki. Reads the source, discusses key takeaways, plans changes, and updates wiki pages, index, and log.
argument-hint: <vault-relative-path>
disable-model-invocation: true
allowed-tools: Bash(obsidian *)
---

**Do not use MCP tools.** Use only the `obsidian` CLI via Bash. Run `obsidian --help` for available commands and flags.

Ingest the source at `$ARGUMENTS` into the wiki.

## Step 1 — Read

```bash
obsidian read path="$ARGUMENTS"
```

If the file is not found, stop and tell the user.

## Step 2 — Discuss

Summarize the source in 3–5 bullet points covering the key claims, arguments, or findings. Then ask:
- What aspects should be emphasized in the wiki?
- Are there specific concepts or entities to create or update?

Wait for the user's response before continuing.

## Step 3 — Plan

Produce a change plan listing every file to be created or updated:
- `Wiki/sources/<slug>.md` — new source summary page
- `Wiki/concepts/<slug>.md` — create or update (list each)
- `Wiki/entities/<slug>.md` — create or update (list each)
- `Wiki/index.md` — update index tables
- `Wiki/log.md` — append entry

Present the plan and wait for the user to confirm before executing.

## Step 4 — Execute

### New pages
```bash
obsidian create path="<path>" content="<content>"
```

Set frontmatter fields individually:
```bash
# Generate the note ID
NOTE_PATH="<file>.md"
NOTE_SLUG=$(basename "$NOTE_PATH" .md | tr ' ' '-')
NOTE_ID="$(date +%Y%m%d%H%M%S)-${NOTE_SLUG}"

obsidian property:set path="$NOTE_PATH" name="id" value="$NOTE_ID"
obsidian property:set path="$NOTE_PATH" name="aliases" value="<alternative names>"
obsidian property:set path="$NOTE_PATH" name="tags" value="<value>"
obsidian property:set path="$NOTE_PATH" name="last_updated" value="<YYYY-MM-DD>"
```

Required frontmatter on every wiki page: `id`, `tags`, `last_updated`. Populate `aliases` with common alternative names, abbreviations, or synonyms for the concept or entity — these enable wikilink resolution under any of those names. Aliases must be lowercase and contain only letters and spaces.

Tags — domain: `ml`, `ai`, `programming`, `math`, `books`, `research`, `personal`, `engineering`, `language`
Tags — type: `concept`, `entity`, `source-summary`, `comparison`, `synthesis`, `qa`

### Existing pages
Read first, then rewrite with updates:
```bash
obsidian read path="<file>.md"
obsidian create path="<file>" content="<updated full content>"
```

### Contradictions
If new content conflicts with an existing claim, insert inline:
```
> ⚠️ Contradiction: <existing claim> vs <new claim>
```

### Wikilinks
Use `[[wikilinks]]` for all cross-references. Only link to pages that already exist
or are being created in this operation. Every concept and entity page updated or
created during an ingest must include a wikilink back to the source summary page
(`Wiki/sources/<slug>.md`) created in the same operation.

### index.md
Append new rows to the relevant tables (Sources, Concepts, Entities).

### log.md
```bash
obsidian append path="Wiki/log.md" content="## [<YYYY-MM-DD>] ingest | <source title>\n\n<one sentence: pages created and pages updated>"
```

## Step 5 — Confirm

Report which files were created and which were updated.
