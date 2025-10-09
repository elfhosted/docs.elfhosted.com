---
title: Elf Hosted PrivateBin 🧝
slug: Kometa
description: Kometa super-charges your Plex library with overlays, collections, and more!
upstream: https://kometa.wiki
links:
- name: Discord
  uri: https://kometa.wiki/en/latest/en/latest/discord/
sponsorship:
- name: GitHub Sponsors
  uri: https://github.com/sponsors/meisnate12
---

# {{ page.meta.slug }}

With Kometa, you can:

* Create hand-crafted collections to showcase your library in unique ways
* Apply modular overlays to your posters
* Connect to third-party sites such as TMDb, IMDb and Trakt
* Apply our pre-defined PMM Default Collections and Overlays
* Integrate with Radarr and Sonarr to expand your media libraries
* Share your creations with others in a Discord and Configs Repo

[Get ElfHosted {{ page.meta.slug }}" :magic_wand:](https://store.elfhosted.com/product/{{ page.meta.slug | lower }}/){ .md-button .md-button--primary }

![Screenshot of {{ page.meta.slug }}](/images/screenshots/{{ page.meta.slug | lower }}.png){ loading=lazy }

## How do I access {{ page.meta.slug }}?

Being a command-line tool, {{ page.meta.slug }} doesn't actually have a UI you can "log into". However, your dashboard (`https://<username>.elfhosted.com>`) will link you to the FileBrowser path to the config and the logs - you can also view the logs in realtime using [Kubernetes Dashboard][kubernetes-dashboard].

## Can I set env vars?

Yes, use [ElfBot][elfbot] to set your ENV vars - here's a [link to the official docs](https://metamanager.wiki/en/latest/pmm/environmental/) describing how to use environment variables.

You could, for example, use set `PMM_TIMES=10:00,23:00` to configure Plex Meta Manager to run at 10am and 11pm (UTC) daily:

``` title="Quick-paste into Kometa's environment variables using ElfBot"
PMM_TIMES=10:00,23:00
```

{% include 'app_footer.md' %}