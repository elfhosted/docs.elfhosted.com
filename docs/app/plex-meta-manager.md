---
title: Elf Hosted PrivateBin 🧝 from $0.05/day
slug: Plex-Meta-Manager
description: Plex Meta Manager super-charges your Plex library with overlays, collections, and more!
upstream: https://metamanager.wiki
links:
- name: Discord
  uri: https://metamanager.wiki/en/latest/discord/
sponsorship:
- name: GitHub Sponsors
  uri: https://github.com/sponsors/meisnate12
---

# {{ page.meta.slug }}

With Plex Meta Manager, you can:

* Create hand-crafted collections to showcase your library in unique ways
* Apply modular overlays to your posters
* Connect to third-party sites such as TMDb, IMDb and Trakt
* Apply our pre-defined PMM Default Collections and Overlays
* Integrate with Radarr and Sonarr to expand your media libraries
* Share your creations with others in a Discord and Configs Repo

[Get Elf Hosted {{ page.meta.slug }} from ${{ page.meta.price }}/day :magic_wand:](https://store.elfhosted.com/product/{{ page.meta.slug | lower }}/){ .md-button .md-button--primary }

![Screenshot of {{ page.meta.slug }}](/images/screenshots/{{ page.meta.slug | lower }}.png){ loading=lazy }

## How do I access {{ page.meta.slug }}?

Being a command-line tool, {{ page.meta.slug }} doesn't actually have a UI you can "log into". However, your dashboard (`https://<username>.elfhosted.com>`) will link you to the FileBrowser path to the config and the logs - you can also view the logs in realtime using [Kubernetes Dashboard][kubernetes-dashboard].

## Can I set env vars?

Yes, [use ElfBot to set your ENV vars](/app/elfbot/#how-to-set-an-env-var-for-an-app) - here's a [link to the official docs](https://metamanager.wiki/en/latest/pmm/environmental/) describing how to use environment variables.

You could, for example, use `elfbot env plexmetamanager PMM_TIMES=10:00,23:00` to configure Plex Meta Manager to run at 10am and 11pm (UTC) daily.

{% include 'app_footer.md' %}