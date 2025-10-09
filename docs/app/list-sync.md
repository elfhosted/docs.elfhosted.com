---
title: 🧝 Hosted List-Sync 📚
slug: List-Sync
description: List-Sync automatically syncs your watchlists from IMDb, Trakt, and Letterboxd with Overseerr/Jellyseerr
upstream: https://github.com/Woahai321/list-sync
works_with:
- SeerrBridge
- Overseerr
- Jellyseerr
sponsorship:
- name: GitHub Sponsors
  uri: https://github.com/sponsors/Woahai321
links:
- name: Discord
  uri: https://discord.com/invite/Dy5xNzEHKw
---

# {{ page.meta.slug }}

List-Sync automatically syncs your watchlists from IMDb, Trakt, and Letterboxd with Overseerr/Jellyseerr. No more manual adding - just add movies and shows to your favorite watchlist, and they'll appear in your media server automatically.

!!! tip "list-sync gets revenue sharing! :heart:"
    List-Sync is an "Elf-illiated" project - the developer maintains an active support channel ([#elf-list-sync](https://discord.com/channels/396055506072109067/1357211427013791836)) in our [Discord][discord] community, the app itself is tuned to work perfectly with ElfHosted "out-of-the-box", and 33% of your subscriptions are contributed to the developer!

{% include 'app.md' %}

And here's a demo gif:

![Screenshot of {{ page.meta.slug }}](/images/screenshots/{{ page.meta.slug | lower }}.gif){ loading=lazy }

{% include 'app_access.md' %}

## How to use List-Sync

At the least, you'll need to give List-Sync your Overseerr / Jellyseerr API key:

``` title="Quick-paste into ListSync's environment variables using ElfBot"
OVERSEERR_API_KEY=<your key here>`
```

You can, at this point, run List-Sync in interactive mode, or you can drive it declaritively, by setting any of the following ENV vars, using the same [ElfBot][elfbot] syntax:

``` title="Example ENV vars"
# Sync interval in hours (default: 24)
SYNC_INTERVAL=24

# Request Quality Profile (true for 4K, false for standard)
OVERSEERR_4K=false

# Lists Configuration (comma-separated)
# Examples:
IMDB_LISTS=ls123456789,ur123456789,top,boxoffice,https://www.imdb.com/list/ls123456789/
TRAKT_LISTS=12345,67890,https://trakt.tv/users/username/lists/listname
LETTERBOXD_LISTS=https://letterboxd.com/username/list/listname/ 
```

{% include 'app_footer.md' %}