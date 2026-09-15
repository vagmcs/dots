---
name: lint
description: Health-check the Obsidian LLM wiki. Finds orphans, broken links, contradictions, stubs, stale pages, and suggests gaps to fill.
disable-model-invocation: true
allowed-tools: Bash(obsidian *)
---

**Do not use MCP tools.** Use only the `obsidian` CLI via Bash. Run `obsidian --help` for available commands and flags.

Run a full health-check on the wiki and produce a lint report.

## Step 1 — Structural checks

Orphan pages (no inbound links):
```bash
obsidian orphans
```

Broken wikilinks:
```bash
obsidian unresolved
```

Tag inventory:
```bash
obsidian tags counts sort=count
```

## Step 2 — Contradiction scan

Find all unresolved contradiction markers:
```bash
obsidian search query="⚠️ Contradiction" format=json
```

List each file containing unresolved contradictions.

## Step 3 — Stub detection

```bash
obsidian read path="Wiki/index.md"
```

Search for concept and entity names that appear as `[[wikilinks]]` across wiki
pages but have no corresponding page in `Wiki/concepts/` or `Wiki/entities/`.
List them as missing stubs.

## Step 4 — Staleness check

```bash
obsidian read path="Wiki/log.md"
```

Identify source ingests from more than 90 days ago. Read the corresponding
`Wiki/sources/` pages and check whether their linked concept/entity pages have
a `last_updated` older than the most recent relevant ingest. Flag potentially
stale pages.

## Step 5 — Gap analysis

Based on the current state of the wiki, suggest:
- Topics worth creating dedicated pages for
- Source directories that appear underrepresented
- Questions worth investigating that would fill obvious gaps

## Step 6 — Report

Produce a structured report with these sections:
1. **Orphans**
2. **Broken links**
3. **Unresolved contradictions**
4. **Missing stubs**
5. **Potentially stale pages**
6. **Gap suggestions**

Do not auto-fix anything. Present findings only and wait for direction.

## Step 7 — Log

```bash
obsidian append path="Wiki/log.md" content="## [<YYYY-MM-DD>] lint | health check\n\n<one sentence: counts of orphans, broken links, contradictions, and stubs found>"
```
