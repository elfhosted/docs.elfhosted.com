---
title: 🧝 Hosted Calibre-Web 🦸
slug: Calibre-Web-Automated-Book-Downloader
description: Calibre-Web-Automated Book Downloader is an intuitive web interface for searching and requesting book downloads, designed to work seamlessly with
works_with:
- Calibre-Web
upstream: https://github.com/calibrain/calibre-web-automated-book-downloader
---

# {{ page.meta.slug }}

Calibre-Web-Automated Book Downloader is an intuitive web interface for searching and requesting book downloads, designed to work seamlessly with [Calibre-Web-Automated][calibre-web]. This project streamlines the process of downloading books and preparing them for integration into your Calibre library.

{% include 'app.md' %}

{% include 'app_access.md' %}

## How do I use it?

By default, books are downloaded to `/cwa-book-ingest/`, which resolves to `storage/config/calibre-web/cwa-book-ingest/`, and is used by [Calibre-Web-Automated][calibre-web] to automatically ingest books into your library.

The contents of `/cwa-book-ingest/` will be deleted after ingestion (*You can, however, download the book locally via your browser before CWA ingests it*).

### Custom download location

If you **don't** want downloads to be ingested into CWA, but rather to be stored elsewhere for ingestion (into [Booklore][booklore], for example), you can override the `INGEST_DIR` ENV var using [ElfBot], to point to wherever your want the downloads to end up (usually `/storage/rclone/<sommething>), based on remote storage you've [magic-mounted][rclone].

### Fast downloads for donators

If you're an Anna's Archive donator, you can access faster (and more reliable) downloads, by passing your secret key using [ElfBot][elfbot], as follows:

``` title="Quick-paste into CWA Downloader's environment variables using ElfBot"
AA_DONATOR_KEY=<your secret key>
```

{% include 'app_footer.md' %}