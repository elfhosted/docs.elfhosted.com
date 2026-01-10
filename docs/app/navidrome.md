---
title: Elf Hosted Navidrome 🧝
slug: Navidrome
description: Navidrome allows you to enjoy your music collection from anywhere, by making it available through a modern Web UI and through a wide range of third-party compatible mobile apps, for both iOS and Android devices
upstream: https://www.navidrome.org
links:
- name: subreddit
  uri: https://www.reddit.com/r/navidrome
sponsorship:
- name: Liberapay
  uri: https://liberapay.com/deluan
- name: Ko-fi
  uri: https://ko-fi.com/deluan
- name: GitHub Sponsors
  uri: https://github.com/sponsors/deluan
---

# {{ page.meta.slug }}

Navidrome allows you to enjoy your music collection from anywhere, by making it available through a modern Web UI and through a wide range of third-party compatible mobile apps, for both iOS and Android devices.

{% include 'app.md' %}
{% include 'app_access.md' %}

### From mobile apps

Connect your subsonic-compatible app to `https://<username>-navidrome.elfhosted.com`

## Where's my music?

Navidrome refers to the `ND_MUSICFOLDER` environment variable to determine where to look for your music. Identify where your music is found (usually `/storage/rclone/<something>`), if you've [magic-mounted][rclone] some external storage, and use [ElfBot][elfbot] to set this variable, like this:

``` title="Quick-paste into Navidrome's environment variables using ElfBot"
ND_MUSICFOLDER=<path to wherever your music is>
```

{% include 'app_footer.md' %}