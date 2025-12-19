---
title: NzbDAV WebDAV Bridge for Stremio, Plex, Emby & Jellyfin
slug: NzbDAV
description: Deploy ElfHosted NzbDAV to expose your authorized Usenet catalog via WebDAV/SABnzbd for Sonarr, Radarr, Stremio, and compliant media servers.
keywords:
- nzbdav
- usenet streaming
- stremio addons
- plex webdav
- sonarr radarr downloader
upstream: "https://github.com/nzbdav-dev/nzbdav"
works_with:
- Lidarr
- Mylar
- AIOStreams
- Prowlarr
- Radarr
- Readarr
- Sonarr
---

<!-- markdownlint-disable MD025 MD052 -->

# {{ page.meta.slug }}

NzbDav is a WebDAV server that allows you to mount and browse NZB documents as a virtual file system without downloading the underlying payload upfront.

It's designed to integrate with other media management tools, like [Sonarr][sonarr] and [Radarr][radarr], by providing a SABnzbd-compatible API that those applications already understand.

NzbDav does not provide media. It simply exposes the catalog exposed by **your** Usenet provider so that legitimate backups or time-shifted recordings can stream into [Plex][plex], [Emby][emby], [Jellyfin][jellyfin], or similar players. You must ensure that every source you connect is authorized in your jurisdiction and complies with our [No-Piracy Policy](/legal/no-piracy-policy/).

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Stremio

Using NzbDAV with Stremio is a simple process, and will work with the out-of-the-box defaults as long as you configure it with sources you have the rights to access. Here's a video guide:

<!-- markdownlint-disable-next-line MD033 -->
<iframe width="560" height="315" src="https://www.youtube.com/embed/QNF7FU3n-I8?si=rpDLmYvNL4evuuaS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Aars

Building a large streaming library with Aars requires a few extra toggles compared to AIOStreams + Stremio. Here's a demo for Plex, followed by a summary of what you need to set (*these are pre-configured on fresh NzbDAV installs*)

<!-- markdownlint-disable-next-line MD033 -->
<iframe width="560" height="315" src="https://www.youtube.com/embed/8KXlTGcmdf4?si=HKAQym3kMYP3rJb6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

In Radarr/Sonarr..

Configure a "SABNZBD" downloader in Radarr/Sonarr, pointing to `http://nzbdav:3000`, using categories which match their names (Radarr=`radarr`, Radarr4k=`radarr4k`, etc).

Paste in the SABNZBD API key from NzbDAV, and test.

Optionally, you may want to add "ElfZyclops" as a generic NewsNab indexer in Prowlarr, with the URL `http://elfhosted-internal.zyclops`, and the API key set to a comma-separated list of your provider hostnames (*i.e. `news.provider.com,reader.provider2.com`*).

ElfZyclops is an internal NZB cache built from all internal NzbDAV activity (*see below*)

In NzbDAV..

#### Usenet

Configure your own Usenet provider that authorizes your usage, **Connections Per Stream** can be adjusted, start with 8 and increase to suit your requirements.

!!! tip "Bundled Usenet Provider PoC"

    Optionally (*until Feb 2026*), use a PoC-bundled internal provider, with the following details:

    * Host: `news.elfhosted.com`
    * Port: `563` (SSL)
    * User: `elfie`
    * Pass: `elfie`
    * Connections: `20` (adjust this as necessary, there's no hard limit)


#### SABnzbd

- **Categories**: `radarr,radarr4k,sonarr,sonarr4k,sonarranime`
- **Rclone Mount Directory**: `/storage/nzbdav` **CRITICAL**

#### WebDAV

It doesn't matter what you set here, because WebDAV auth is disabled in our environment (*since it's never exposed externally*)

#### Radarr/Sonarr

Add all your Aars, using the API keys found in each Aar under `Settings -> General`. Refer to [this guide][connect-apps] to confirm the hostnames and ports per-arr.

Automatic queue management - tune these to your preferences, depending on whether you want lots of manual intervention / twiddling, or set-and-forget.

#### Repairs

- **Enable Background Repairs**: Optional (*but you need Library Directory below to enable it*)
- **Library Directory**: `/storage/symlinks`

### Shared cache

Every NZB file ingested by an ElfHosted NzbDAV instance also anonymously submits that NZB reference (*not the media itself*) to an internal-only NewsNab-compatible cache, "ElfZyclops", which is then usable exclusively by ElfHosted Stremio/Aarr users. 

This improves search speed and reduces duplicate API calls to external indexers, but it remains your responsibility to ensure any referenced material is lawful for you to access.

Here's how to use ElfZyclops:

#### Stremio (ElfZyclops)

Add a NewsNab indexer in [AIOStreams][aiostreams], with the URL `http://elfhosted-internal.zyclops`, with no API key.

#### Prowlarr

Add a NewsNab indexer in [Prowlarr][prowlarr], with the URL `http://elfhosted-internal.zyclops`, with no API key, and sync the indexer to your Radarr/Sonarr instances.

#### Opting out

If you'd prefer not to contribute your NZBs to the shared cache, you can opt **out** of having your NzbDAV submit NZBs to this cache, as described below.

``` title="Quick-paste into NzbDAV's environment variables using ElfBot to opt out"
SHARE_NZB_WITH_CACHE=false
```

### External access (exposing)

To make NzbDav's SabNZBD API work with 3rd-party apps, you'll need to "expose" its API, so that it can be accessed without ElfHosted SSO.

1. Refresh your SabNZBD API token in NzbDAV
2. Grab [this product](https://store.elfhosted.com/product/nzbdav-exposed/) from the store, to bypass SSO for the API endpoints

Note that exposing NzbDAV doesn't make the content or the admin UI publicly available - it's simply about exposing the SabNZBD API endpoints so that they're accessible from external tools.

--8<-- "common-links.md"

{% include 'app_footer.md' %}

<!-- markdownlint-enable MD025 MD052 -->
