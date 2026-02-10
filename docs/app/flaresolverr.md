---
title: ElfHosted Flaresolverr 🧝
description: FlareSolverr is a proxy server to bypass Cloudflare protection commonly applied to indexers / trackers, so that they can be auto-queried by Prowlarr
slug: Flaresolverr
upstream: https://github.com/FlareSolverr/FlareSolverr
works_with:
- Prowlarr
- Jackett
---

# {{ page.meta.slug }}

FlareSolverr is a proxy server to bypass Cloudflare protection commonly applied to indexers / trackers, so that they can be auto-queried by [Prowlarr][prowlarr] or [Jackett][jackett].

In ElfHosted, FlareSolverr is not a per-user app, but rather a shared internal service, usable by all tenants.

## How do I use it?

Since solving cloudflare challenges is.. challenging, the configuration of Flaresolverr in Prowlarr / Jackett can be complex / counter-intuitive. Follow the instructions below carefully.

### Jackett

Set the following in your Jackett config:

* Proxy Type: `HTTP`
* Proxy URL: `http://elfhosted-internal.flaresolverr`
* Proxy port: `8888`
* FlareSolverr API URL: `http://elfhosted-internal.flaresolverr:8191`

Example screenshot:

![](/images/jackett-flaresolverr-setup.png)

### Prowlarr

In Prowlarr, go to `Settings` -> `Indexers`.

Add **TWO** proxies, as follows:

#### FlareSolverr

* Type: `FlareSolverr`
* Name: `FlareSolverr`
* Tags: `flaresolverr`
* Host: `http://elfhosted-internal.flaresolverr:8191`

Example screenshot:

![](/images/prowlarr-flaresolverr-setup-2.png)

#### FlareSolverr-Egress

* Type: `Http`
* Name: `FlareSolverr-Egress`
* Tags: `flaresolverr-egress`
* Host: `elfhosted-internal.flaresolverr`
* Port: `8888`

![](/images/prowlarr-flaresolverr-setup-1.png)

#### Indexers

You've now defined **TWO** tags - `flaresolverr` and `flaresolverr-egress`. Apply **BOTH** of these tags to every cloudflare-protected indexer you add.

![](/images/prowlarr-flaresolverr-setup-3.png)

{% include 'app_footer.md' %}
