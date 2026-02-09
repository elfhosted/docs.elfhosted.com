---
title: Elf Hosted Jackett 🧝
slug: Jackett
description: Jackett proxies queries from apps (including Stremio-Jackett) into queries against torrent trackers, enabling integrations like playing torrents from Real-Debrid using Stremio
upstream: https://github.com/Jackett/Jackett/
works_with:
- LazyLibrarian
- Radarr
- Readarr
- ruTorrent
- SABnzbd
- Sonarr
- Lidarr
- Jackettio
- Annatar
---

# {{ page.meta.slug }}

Jackett works as a proxy server: it translates queries from apps (*[Sonarr][sonarr], [Radarr][radarr], etc.*) into tracker-site-specific http queries, parses the html or json response, and then sends results back to the requesting software. 

This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

Specifically, Jackett, combined with [Stremio-Jackett][stremio-jackett], is one half of a [popular integration enabling streaming of content from Debrid providers via Stremio](/guides/media/stream-from-real-debrid-with-stremio-jackett).

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### FlareSolverr

ElfHosted users have access to an internal FlareSolverr instance to support cloudflare-protected indexers. See [our FlareSolverr docs][flaresolverr] for configuration details.

{% include 'app_footer.md' %}