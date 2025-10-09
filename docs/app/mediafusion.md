---
title: Install ElfHosted MediaFusion Stremio Addon (torrentio alternative)
slug: MediaFusion
description: MediaFusion (an alternative to torrentio stremio addon), is the most comprehensive and powerful of the Stremio Addons in 2024, especially popular for watching Tamil, Hindi, Malayalam, Kannada, English, and dubbed movies & series
upstream: https://mediafusion.elfhosted.com
links:
- name: GitHub Repo
  uri: https://github.com/mhdzumair/MediaFusion
---

# {{ page.meta.slug }}

MediaFusion (an alternative to torrentio stremio addon), is the most comprehensive and powerful of the Stremio Addons in 2024, especially popular for watching Tamil, Hindi, Malayalam, Kannada, English, and dubbed movies & series. ElfHosted provides a public, community version of MediaFusion at https://mediafusion.elfhosted.com (*with individual and global rate-limits*), and per-user, private, un-rate-limited instances.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Set the API password

<iframe width="560" height="315" src="https://www.youtube.com/embed/oEVJ-wyyOz8?si=uXA0lCIkp_A5z9Dm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Since MediaFusion v4, every instance **must** include an `api_password` ENV var, to secure the instance from unwanted public tampering. 

Every ElfHosted instance defaults its API password to `changemeelfie`, but you can (and should) reset this using [ElfBot][elfbot], by running:

``` title="Quick-paste into MediaFusion's environment variables using ElfBot"
api_password=whateveryouwant
```

### Integrating with Jackett

Optionally, you can use a bundled [Jackett][jackett] instance to provide additional sources to your MediaFusion instance.

Configure your Jackett, and then copy your API key, and provide it to MediaFusion with:

``` title="Quick-paste into MediaFusion's environment variables using ElfBot"
jackett_api_key=<api key here>
is_scrap_from_jackett=true
```

{% include 'app_footer.md' %}