---
title: Flixio - Use Stremio anonymously
slug: Flixio
description: Flixio is an instance of the Stremio web client, patched to work with a drop-in API replacement, ensuring that your Stremio activity is anonymous and under your control
upstream: https://github.com/iPromKnight/stremio-web
---

# {{ page.meta.slug }}

While Stremio is free-to-use, and popularly paired with community addon to source extra content, some aspects of how Stremio works may concern privacy-focused users. By necessity, all interactions with Stremio (*whether you're signed in or not*) result in data about you being sent back to Stremio's servers, recording your IP, watching history, etc.

If you're signed in *(which most users are, in order to sync addons and watch history*), this data can also be used to accurately track your watching habits.

Flixio is a [patched instance](https://github.com/iPromKnight/stremio-web) of the Stremio Web Player, altered to use [flixio-api](https://github.com/iPromKnight/flixio-api), a reverse-engineered instance of the Stremio API, such that you retain full functionality of the Stremio client, but no data is sent back to Stremio. Your activity is instead stored in a local SQLite database which you can backup (or purge) as and when you please.

Further, the patched client restores external player functionality, so that media discovered in Stremio can be opened in other apps, such as VLC, Infuse, etc.

[Get Elf Hosted {{ page.meta.slug }}! :magic_wand:](https://store.elfhosted.com/product/{{ page.meta.slug | lower }}/){ .md-button .md-button--primary }

{% include 'app_access.md' %}

## How do I use Flixio?

### Web Auth password

Your Flixio instance is exposed to the public internet without SSO, so to prevent unauthorized access, it is protected by a web auth password. The password defaults to `changemeelfie`, but you should change this ASAP, by running the following with [ElfBot][elfbot]:

``` title="Quick-paste into Flixio's environment variables using ElfBot"
WEB_AUTH_KEY=<your chosen password>
```

### Infuse / VLC support

To use Flixio (*Stremio Web*) with external player support, navigate to `Settings` -> `Player` -> `Advanced`, and alter the setting for `Play in external player`:

![](/images/flixio-external-player.png)

{% include 'app_footer.md' %}
