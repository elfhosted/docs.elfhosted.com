---
title: Stream from Usenet with NzbDAV and Stremio, Plex, Emby or Jellyfin
slug: NzbDAV
description: NZBGet is an efficient usenet downloader
upstream: https://github.com/nzbdav-dev/nzbdav
works_with:
- Lidarr
- Mylar
- AIOStreams
- Prowlarr
- Radarr
- Readarr
- Sonarr
---

# {{ page.meta.slug }}

NzbDav is a WebDAV server that allows you to mount and browse NZB documents as a virtual file system without downloading.

It's designed to integrate with other media management tools, like [Sonarr][sonarr] and [Radarr][radarr], by providing a SABnzbd-compatible API. 

With it, you can build an infinite [Plex][plex], [Emby][emby] or [Jellyfin][jellyfin] media library that streams directly from your usenet provider at maxed-out speeds.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Stremio

Using NzbDAV with Stremio is a simple process, and will work with the out-of-the-box defaults. Here's a video guide:

<iframe width="560" height="315" src="https://www.youtube.com/embed/QNF7FU3n-I8?si=rpDLmYvNL4evuuaS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Aars

An infinite streaming library setup is a little more complicated than AIOStreams + Stremio, here's a demo for Plex, followed by a summary of what you need to set (*these are pre-configured on fresh NzbDAV installs*)

<iframe width="560" height="315" src="https://www.youtube.com/embed/8KXlTGcmdf4?si=HKAQym3kMYP3rJb6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

In Radarr/Sonarr..

Configure a "SABNZBD" downloader in Radarr/Sonarr, pointing to `http://nzbdav:3000`, using categories which match their names (Radarr=`radarr`, Radarr4k=`radarr4k`, etc).

Paste in the SABNZBD API key from NzbDAV, and test.

Optionally, you may want to add "ElfZyclops" as a generic TorzNab indexer in Prowlarr, with the URL `http://elfhosted-internal.zyclops`, and no API key. ElfZyclops is an internal NZB cache built from all internal NzbDAV activity (*see below*)

In NzbDAV..

#### Usenet

Configure your own Usenet provider. 

**Connections Per Stream** can be adjusted, start with 8

#### SABnzbd

* **Categories**: `radarr,radarr4k,sonarr,sonarr4k,sonarranime`
* **Rclone Mount Directory**: `/storage/nzbdav` **CRITICAL**

#### WebDAV

It doesn't matter what you set here, because WebDAV auth is disabled in our environment (since it's never exposed externall)

#### Radarr/Sonarr

Add all your Aars, using the API keys found in each Aar under `Settings -> General`. Refer [to this guide][connect-apps] to confirm the hostnames and ports per-arr.

Automatic queue management - tune these to your preferences, depending on whether you want lots of manual intervention / twiddling, or set-and-forget.

#### Repairs

* **Enable Background Repairs**: Optional (*but you need Library Directory below to enable it*)
* **Library Directory**: `/storage/symlinks`

### Shared cache

Every NZB file ingested by an ElfHosted NzbDAV instance also anonymously submits that NZB to an internal-only TorzNab-compatible cache, "ElfZyclops", which is then usable by ElfHosted Stremio/Aarr users, reducing API impact on external indexers, for ElfHosted users' exclusive use.

Here's how to use ElfZyclops

#### Stremio

Add a TorzNab indexer in [AIOStreams][aiostreams], with the URL `http://elfhosted-internal.zyclops`, with no API key.

#### Prowlarr

Add a TorzNab indexer in [Prowlarr][prowlarr], with the URL `http://elfhosted-internal.zyclops`, with no API key, and sync the indexer to your Radarr/Sonarr instances.

#### Opting out

If you'd prefer not to contribute your NZBs to the shared cache, you can opt **out** of having your NzbDAV submit NZBs to this cache, as described below.

``` title="Quick-paste into NzbDAV's environment variables using ElfBot to opt out"
SHARE_NZB_WITH_CACHE=false
```


{% include 'app_footer.md' %}