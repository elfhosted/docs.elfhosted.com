---
title: Private hosted AIOMetadata instance
slug: AIOMetadata
description: A next-generation, power-user-focused metadata addon for Stremio. It aggregates and enriches movie, series, and anime metadata from multiple sources (TMDB, TVDB, MyAnimeList, AniList, IMDb, TVmaze, Fanart.tv, MDBList, and more), giving you full control over catalog sources, artwork, and search
upstream: https://aiometadata.elfhosted.com
links:
- name: GitHub Repo
  uri: https://github.com/cedya77/aiometadata
sponsorship: 
- name: BuyMeACoffee
  uri: https://buymeacoffee.com/cedya
---

# {{ page.meta.slug }}

AIOMetadata is a next-generation, power-user-focused metadata addon for Stremio. It aggregates and enriches movie, series, and anime metadata from multiple sources (*TMDB, TVDB, MyAnimeList, AniList, IMDb, TVmaze, Fanart.tv, MDBList, and more*), giving you full control over catalog sources, artwork, and search

ElfHosted provides a public, community version of AIOMetaData at https://aiometadata.elfhosted.com, and per-user, private, instances with pre-warming support.

!!! tip "AIOMetadata gets revenue sharing! :heart:"
    AIOMetadata is an "Elf-illiated" Premium [Stremio Addon][stremio-addons] - the developer maintains an active support channel ([#elf-aiometadata](https://discord.com/channels/396055506072109067/1429233135874216068)) in our [Discord][discord] community, the app itself is tuned to work perfectly with ElfHosted "out-of-the-box", and 33% of your subscriptions are contributed to the developer!

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Pre-warming

AIOMetadata, by default, will "pre-warm" its catalogs on TMDB for movies, TVMD for series and MAL for anime, in english. However, you may prefer alternate catalog providers, or want to pre-warm your own provider-specific lists, like MAL.

To tailor pre-warming to your own setup, generate a UUID by doing a complete setup, and then pass that UUID to AIOMetadata as an environment variable, using [ElfBot][elfbot]:

``` title="Quick-paste into AIOMetadata's environment variables using ElfBot"
CACHE_WARMUP_UUID=<your uuid>
```

### Dashboard

Your addon dashboard will be accessible at `https://<your-aiometadata-url>/addon/`. No password is required in the browser, because the URL is protected with your ElfHosted SSO login.

{% include 'app_footer.md' %}