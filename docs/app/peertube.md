---
title: PeerTube
slug: PeerTube
description: 
upstream: https://aiostreams.elfhosted.com
links:
- name: GitHub Repo
  uri: https://github.com/Viren070/AIOStreams
sponsorship: 
- name: Ko-Fi
  uri: https://ko-fi.com/Viren070
- name: GitHub Sponsors
  uri: https://github.com/sponsors/Viren070
---

# {{ page.meta.slug }}

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Set PEERTUBE_SECRET

PeerTube won't start without a `PEERTUBE_SECRET` ENV var, which needs to be set by the user.

Generate a 64-character hexidecimal string (*`openssl rand -hex 32` for example*), and then applying it to PeerTube using [ElfBot][elfbot]:

``` title="Quick-paste into PeerTube's environment variables using ElfBot"
PEERTUBE_SECRET=whateveryousetmakesureits64charshexidecimalonly
```

{% include 'app_footer.md' %}