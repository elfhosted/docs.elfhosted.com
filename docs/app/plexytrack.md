---
title: Elf Hosted PlexyTrack 🧝
slug: PlexyTrack
description: PlexyTrack adds a two-way-sync between trakt.tv or Simkl, and Plex Media Server
upstream: https://github.com/Taxel/PlexTraktSync
---

# {{ page.meta.slug }}

This project synchronizes your Plex library with Trakt. Besides watched history it can optionally add items to your Trakt collection, sync ratings and watchlists, and now mirrors Trakt lists you like as Plex collections. 

Collections created in Plex will in turn appear as Trakt lists. A small Flask web interface lets you choose which features to enable and configure the sync interval. Items that are manually marked as watched in Plex are detected as well.

The interface also includes a tool for creating backups of your history, watchlist and ratings. The recommended sync interval is at least 60 minutes. Shorter intervals generally do not provide any benefit, and you can even synchronize once every 24 hours to reduce the load on your server and the API.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How to use PlexTraktSync

Use [ElfBot][elfbot] to set **one set** of the following ENV vars, depending on which provider you want to sync with:

### Trakt

* `TRAKT_CLIENT_ID`
* `TRAKT_CLIENT_SECRET`

### Simkl

* `SIMKL_CLIENT_ID`
* `SIMKL_CLIENT_SECRET`

{% include 'app_footer.md' %}
