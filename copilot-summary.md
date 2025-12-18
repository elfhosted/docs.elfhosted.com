# Copilot Summary

## What this repo is

- Sources for the public ElfHosted documentation site, built with MkDocs Material and published at <https://elfhosted.com>.
- Content focuses on app listings, how-to guides, support/legal docs, transparency reports, and marketing pages for managed self-hosting bundles.

## Key structure

- `mkdocs.yml` configures global metadata, navigation, plugins (macros, git-revision-date, minify, social cards), palettes, fonts, and extra JS/CSS.
- `docs/` holds all published pages (landing page `docs/index.md`, app sheets under `docs/app/`, guides, testimonials, legal, transparency reports, etc.).
- `_includes/` and `_snippets/` provide reusable markdown blocks (testimonials, common links, how-to snippets) consumed via the `pymdownx.snippets` and mkdocs-macros plugins.
- `overrides/` contains Jinja/HTML overrides for MkDocs Material (custom layouts, partials, 404 page) plus custom icons referenced in the emoji extension.
- `assets/`, `images/`, `extras/` and sibling folders host static media, CSS (`extras/css/*.css`), and JS enhancements (`extras/javascript/*`).
- `scripts/build.sh`, `scripts/serve-insiders.sh`, etc. wrap common MkDocs build/serve workflows for CI or local previews.

## Typical workflows

1. Install deps: `pip install -r requirements.txt` (includes MkDocs Material and the listed plugins).
2. Local preview: `mkdocs serve` (or `./scripts/build.sh` / `./scripts/serve-insiders.sh` for scripted flows).
3. Production build artifacts land in `site/` (gitignored) and are deployed via Netlify/GitHub workflows referenced in `netlify.toml` and `netlify_redirects.txt`.

## Editing tips

- Prefer reusing snippets/includes for repeated callouts (e.g., testimonials, common links) instead of copying markdown blocks.
- Keep navigation changes in sync with `mkdocs.yml`; broken paths will break the build when `strict` is enabled.
- When adding new app pages, follow existing front-matter style under `docs/app/` and link them under the appropriate nav section in `mkdocs.yml`.
