---
title: Install ElfHosted Mediaflow-Proxy
slug: MediaFlow-Proxy
description: MediaFlow Proxy enables Stremio addons to "proxy stream" media, bypassing IP restrictions on Debrid providers, and allowing for multiple simultaneous streams from different devices in different locations.
upstream: https://github.com/mhdzumair/mediaflow-proxy
links:
- name: GitHub Repo
  uri: https://github.com/mhdzumair/mediaflow-proxy
---

# {{ page.meta.slug }}

MediaFlow Proxy is a powerful and flexible solution for proxifying various types of media streams.

Specifically, it enables supported [Stremio addons][stremio-addons] to "proxy stream" media, bypassing IP restrictions on Debrid providers, and allowing for multiple simultaneous streams from different devices in different locations.

It supports HTTP(S) links, HLS (M3U8) streams, and MPEG-DASH streams, including DRM-protected content. This proxy can convert MPEG-DASH DRM-protected streams to decrypted HLS live streams in real-time, making it one of the fastest live decrypter servers available.

## How do I use it?

You'll find a link on your ElfHosted apps dashboard to MediaFlow Proxy, which provides some generic details. Use the URL for this link when you configure addons which support MediaFlow Proxy.

### Set the API password

Before you can use MediaFlow Proxy, you'll need to set your API password, to protect your proxy (otherwise publically exposed) from abuse. Use [ElfBot][elfbot] to run:

``` title="Quick-paste into MediaFlow Proxy's environment variables using ElfBot"
API_PASSWORD=whatevermypasswordis
```

### Test your speed

To test your streaming speed to your MediaFlow Proxy instance, browse to `https://<your username>-mediaflow-proxy.elfhosted.com/speed/` to perform a speedtest.

{% include 'app_footer.md' %}