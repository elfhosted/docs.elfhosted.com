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

### Fast downloads for donators

If you're an Anna's Archive donator, you can access faster (and more reliable) downloads, by passing your secret key using [ElfBot][elfbot], as follows:

```
elfbot env cwa-book-downloader AA_DONATOR_KEY=<your secret key>
```

{% include 'app_footer.md' %}