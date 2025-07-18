---
title: Elf Hosted ThreadFin 🧝
slug: ThreadFin
description: Threadfin M3U Proxy for Plex DVR and Emby Live TV
upstream: https://github.com/Threadfin/Threadfin
---

# {{ page.meta.slug }}

M3U Proxy for Plex DVR and Emby/Jellyfin Live TV. Based on xTeVe.

{% include 'app.md' %}

!!! note
    Note that DVR functionality in either Plex or Emby requires a paid subscription (*either PlexPass or Emby Premier*)

Features include:

Files

- Merge external M3U files
- Merge external XMLTV files
- Automatic M3U and XMLTV update
- M3U and XMLTV export

Channel management

- Filtering streams
- Channel mapping
- Channel order
- Channel logos
- Channel categories

Streaming

- Buffer with HLS / M3U8 support
- Re-streaming
- Number of tuners adjustable
- Compatible with Plex / Emby EPG


{% include 'app_access.md' %}

## How do I use it

### Connecting to Plex

Connect Plex to ThreadFin, in the syntax `threadfin:34400`

{% include 'app_footer.md' %}