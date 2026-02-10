---
title: 🧝 Hosted Shelfmark 📚
slug: Shelfmark
description: helfmark is a unified web interface for searching and aggregating books and audiobook downloads from multiple sources - all in one place.
works_with:
- Calibre-Web
- Booklore
- Audiobookshelf
upstream: https://github.com/calibrain/shelfmark
---

# {{ page.meta.slug }}

Shelfmark is a unified web interface for searching and aggregating books and audiobook downloads from multiple sources - all in one place. Works out of the box with popular web sources, no configuration required. Add metadata providers, additional release sources, and download clients to create a single hub for building your digital library.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

By default, books are downloaded to `/books/`, which resolves to `storage/config/shelfmark/books/`, but you can adjust this for the automated ingestion used by either [Calibre-Web-Automated][calibre-web], [Booklore][booklore], or [AudioBookshelf][audiobookshelf] (below).

The following folders are mounted into Shelfmark for automated download and sorting:

* `/booklore-bookdrop` : Booklore's bookdrop folder
* `/calibre-web/cwa-book-ingest` : Calibre-Web's ingestion folder (*note that calibre-web auto-deletes any content in here after ingestion*)

You can also use any rclone-mounted external storage (usually `/storage/rclone/<something>), based on remote storage you've [magic-mounted][rclone], and use this as your download path.

## Search Mode 

### Direct

## Universal Mode

### Decypharr

* Create an "arr" called "shelfmark", and set it to download uncached content. Add any desired file extensions (.epub, .mobi, .cbz, etc) under Settings -> General.

### NzbDAV

If using Shelfmark with NZBDav, go into Settings -> SABnzbd, and **uncheck** the checkbox labeled `Fail downloads for nzbs without video content` (*since you're not going to be downloading videos*). Note that this **may** impact your NZBDav video streaming in other apps, since non-video NZBs will no longer be rejected.


{% include 'app_footer.md' %}