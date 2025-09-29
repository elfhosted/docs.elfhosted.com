---
title: Elf Hosted Prowlarr 🧝
slug: Prowlarr
description: Prowlarr is an indexer manager/proxy built on the popular arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports management of both Torrent Trackers and Usenet Indexers
upstream: https://wiki.servarr.com/prowlarr
links:
- name: subreddit
  uri: https://www.reddit.com/r/prowlarr
works_with:
- Deluge
- LazyLibrarian
- NZBGet
- qBittorrent
- Radarr
- Readarr
- ruTorrent
- SABnzbd
- Sonarr
sponsorship: 
- name: Open Collective
  uri: https://opencollective.com/prowlarr
- name: GitHub Sponsors
  uri: https://github.com/sponsors/prowlarr
- name: Bitcoin
  uri: https://prowlarr.com/donate
---

# {{ page.meta.slug }}

Prowlarr is an indexer manager/proxy built on the popular arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports management of both Torrent Trackers and Usenet Indexers. 

It integrates seamlessly with [Lidarr][lidarr], [Mylar][mylar], [Radarr][radarr], [Readarr][readarr], and [Sonarr][sonarr], offering complete management of your indexers with no per app indexer setup required.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Internal Indexers

ElfHosted maintain several internal indexers which are pre-configured in Prowlarr. To add these manually (*if your subscription pre-dates their pre-configuration*), follow the instructions below:

#### ElfZilean

ElfZilean is an internal instance of Zilean which ingests not only DMM pubicly-shared hashlists, but also the hashes of every other ElfHosted users' RealDebrid library, providing exclusive internal hashes not available on public indexers.

Add an indexerer named `ElfZilean` as a `Generic Torznab` indexer, as follows:

* URL: `http://elfhosted-internal.zilean/torznab/`
* API: `/api`

!!! note "Remove year from search query"
    Due to a peculiarity of the Zilean Torznab API, you'll need to enable `Remove year from search query` in the synced indexer in Radarr.

#### ElfBitMagnet

ElfBitMagnet is an internal instance of BitMagnet which ingests torrent hashes from DHT, classifies content using TMBD, and provides a TorzNab interface for internal querying.

Add an indexerer named `ElfBitMagnet` as a `Generic Torznab` indexer, as follows:

* URL: `https://elfhosted-internal.bitmagnet/`
* API: `/torznab`

#### ElfStremThru

ElfStremThru is an internal instance of StremThru which *also* ingests torrent hashes from DMM, but additionally caches StremThru searches from our public addons, as well as some upstream hashes indexed using DHT.

Add an indexer named `ElfStremThru` as a `Generic Torznab` indexer, as follows:

* URL: `https://elfhosted-internal.stremthru/v0/torznab`
* API: `<leave empty>`

### Enabling apps

All the supported apps are pre-configured in Prowlarr, but set to a disabled state. To enable Radarr and Sonarr, for example, you'd edit each disabled app, check the "**Enabled**" checkbox, and test and save. 

Then "Sync app indexers" to have Prowlarr sync your indexers to the supported, enabled apps :thumbsup:

### External access (i.e. TorBox)

To enable access to your Prowlarr instance from outside of ElfHosted's infrastructure (*i.e., from a [TorBox](https://torbox.app) account*), you'll need to change your preconfigured API key, and add the [Prowlarr Exposed](https://store.elfhosted.com/product/prowlarr-exposed/) product to your subscription.

The "exposed" product explicitly disables SSO for Prowlarr's API, allowing Prowlarr's API (*but not web UI, so there's no need for extra authentication*) to be accessed externally, as illustrated below:

![](/images/prowlarr-torbox.png)

{% include 'app_footer.md' %}