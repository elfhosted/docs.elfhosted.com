---
title: Boost your Stremio addon experience with Comet! (alternative to torrentio stremio addon)
slug: Comet
description: Comet ☄️ is a Stremio addon with super-powers! 🦸 It can search public DMM hashlists, and it can proxy your streams, bypassing RealDebrid's one-ip-per-account limitation!
works_with:
- Jackett
- Prowlarr
upstream: https://github.com/g0ldyy/comet
sponsorship: 
- name: Ko-fi
  uri: https://ko-fi.com/g0ldyy
---

# {{ page.meta.slug }}

Comet is an innovative new Stremio addon (a torrentio alternative) which differentiates itself from the existing [Stremio Addons][stremio-addons] with the superpowers of:

* [x] Works with Real-Debrid, All-Debrid, and Premiumize
* [x] Scraping all public DMM content with [Zilean](https://github.com/iPromKnight/zilean)
* [x] Add your own indexers with [Jackett][jackett] or [Prowlarr][prowlarr]
* [x] Smart Torrent Ranking by [RTN](https://github.com/dreulavelle/rank-torrent-name)
* [x] Proxying Debrid requests, allowing you to use multiple IPs with one RD account!

[Get Elf Hosted {{ page.meta.slug }}! :magic_wand:](https://store.elfhosted.com/product/{{ page.meta.slug | lower }}/){ .md-button .md-button--primary }

<iframe width="560" height="315" src="https://www.youtube.com/embed/JAC4UrlFx7Y?si=EHBM8ZU71fAstkjQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

{% include 'app_access.md' %}

## How do I use it

### Environment variables

Comet is configured using environment variables. Use [Kubernetes Dashboard][kubernetes-dashboard] to set your environment variables.

Here's a helpful video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/WEGKI7ppq9E?si=r0u_JfR1VWyj0HoA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### With Prowlarr

Paste the following into [Kubernetes Dashboard][kubernetes-dashboard] to create a new ConfigMap resource (`elfbot-comet`) is the same ConfigMap that would get created/updated if you used [ElfBot][elfbot] to do this, but because of the advanced syntax of some of the values, editing a ConfigMap is the better approach.

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: elfbot-comet
data:
  INDEXER_MANAGER_TYPE: prowlarr
  INDEXER_MANAGER_URL: http://prowlarr:9696
  INDEXER_MANAGER_API_KEY: <YOUR PROWLARR API KEY>
  INDEXER_MANAGER_INDEXERS: '["EXAMPLE1_CHANGETHIS", "EXAMPLE2_CHANGETHIS"]'
```

### With Jackett

Paste the following into [Kubernetes Dashboard][kubernetes-dashboard] to create a new ConfigMap resource (`elfbot-comet`) is the same ConfigMap that would get created/updated if you used [ElfBot][elfbot] to do this, but because of the advanced syntax of some of the values, editing a ConfigMap is the better approach.

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: elfbot-comet
data:
  INDEXER_MANAGER_TYPE: jackett
  INDEXER_MANAGER_URL: http://jackett:9117
  INDEXER_MANAGER_API_KEY: <YOUR JACKETT API KEY>
  INDEXER_MANAGER_INDEXERS: '["EXAMPLE1_CHANGETHIS", "EXAMPLE2_CHANGETHIS"]'
```

Now visit your Comet URL from your dashboard, enter your debrid provider API key, pick your indexers (*may as well pick 'em all!*), and click `Install`!

### Proxy Streaming and Password

To enable Proxy Streaming, use you can either add the following ENV vars to your ConfigMap, or just use [ElfBot][elfbot], and run (*one line at a time*):

Choose your own password, and replace `whatevermypasswordis` below with your own password:

```
elfbot env comet PROXY_DEBRID_STREAM_PASSWORD=whatevermypasswordis
```

And to enable proxy streaming:

```
elfbot env comet PROXY_DEBRID_STREAM=true
```

## Debrid Stream Proxying

Here's how Debrid Stream Proxying works

=== ":nerd: Normal mode"

    Here's how Comet works as a "regular" Stremio addon:

    ```mermaid
    sequenceDiagram
        Stremio->>+Comet: Search movie
        Comet->>+Indexer: Search movie
        Indexer->>Comet: Search Results
        Comet->>Stremio: Search results
        Stremio->>Comet: Play movie
        Comet->>RealDebrid: Get link
        RealDebrid->>Comet: Here's link
        Comet->>Stremio: Here's link
        Stremio->>RealDebrid: Play link
        RealDebrid->>Stremio: Enjoy!
    ```

    Stremio searches/requests content via Comet, and Comet returns an "unrestricted" RD download link to Stremio, which uses that link to stream the content.

=== ":superhero: Stream Proxy mode"

    But **here's** how Comet works in Proxy Stream mode:

    ```mermaid
    sequenceDiagram
        Stremio->>+Comet: Search movie
        Comet->>+Indexer: Search movie
        Indexer->>Comet: Search Results
        Comet->>Stremio: Search results
        Stremio->>Comet: Play movie
        Comet->>RealDebrid: Get link
        RealDebrid->>Comet: Here's link
        Comet->>Stremio: Here's proxy link
        Stremio->>Comet: Play proxy link
        Comet->>RealDebrid: Play link
        RealDebrid->>Comet: Enjoy!
        Comet->>Stremio: Enjoy!
    ```

    Unlike regular mode, in Proxy Stream mode, Comet doesn't return the unrestricted download link to Stremio, rather it returns a **Comet** download link, and when Stremio requests that link, Comet downloads the **real** download link from RealDebrid, and serves it to Stremio.

    Thus, **all** interaction with RealDebrid is done from Comet. Stremio talks to Comet exclusively, and streams the content **through** Comet. Therefore, only a single source IP is in use, from the perspective of Stremio!

!!! danger "Use comet consistently"
    If you're going to use Comet in Stream Proxy mode, remember that ElfHosted will be the IP that RealDebrid sees when you stream from Stremio. If you use other addons to stream on one device, while using Comet on another, you'll again trigger the multiple-source-IPs problem.

    In Stream Proxy mode, use Comet **exclusively, everywhere**!

### Test your speed

To test your streaming speed to your Comet instance, browse to `https://speed.elfhosted.com` to perform a speedtest to the datacenter whose suffix which matches your Comet URL (*too slow? You can [migrate](/how-to/migrate-datacenters/) to a closer datacenter, based on your speedtest results*)

{% include 'app_footer.md' %}