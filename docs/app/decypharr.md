---
title: Elf Hosted Decypharr
slug: Decypharr
description: Decypharr is a companion tool (a Qbittorrent-like downloader) for Radarr and Sonarr to integrate Debrid downloads via symlinking, with a beautiful UI
upstream: https://github.com/sirrobot01/debrid-blackhole
works_with:
- Radarr
- Sonarr
- Lidarr
- Prowlarr
- Readarr
sponsorship: 
- name: GitHub Sponsors
  uri: https://github.com/sirrobot01
- name: Buy Me A Coffee
  uri: https://buymeacoffee.com/sirrobot01
---

# {{ page.meta.slug }}

Decypharr implements a qBittorrent-like API for the Aars (*[Radarr][radarr], [Sonarr][sonarr], etc..*), facilitating downloads from multiple debrid providers and the creation of symlinks so that the Aars can sort and organize your library nicely.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How to use it

### Configure Decypharr

A configuration file is pre-generated it `config/decypharr/config.json`. By default, in the ElfHosted environment, only Real-Debrid and Debrid-Link are configured, but it's also possible to add TorBox or AllDebrid (*future dev effort required to add a VPN*). A full config can be found [here](https://github.com/sirrobot01/debrid-blackhole/blob/main/doc/config.full.json).

The minimal configuration required is simply to set your RD API key (*look for the string `realdebrid_key`*), and then restart Decypharr with [ElfBot], using `elfbot restart decypharr`

### Configure Aarrs

A fresh ElfHosted Aar deployment (*or the result of an [ElfBot][elfbot] reset*) will be pre-configured for Decypharr, you'd just need to enable it and disable any other downloaders.

To add Decypharr to an existing Aar, add a new Qbittorrent downloader, as follows:

* Host: `decypharr`
* Port: `8282`
* Category: set to match host portion of the arr's hostname

Decypharr re-uses some qBittorrent conventions for its own options. For example, toggling the `sequential downloads` checkbox will cause Decypharr **not** to symlink, but to download whole files, which is almost certainly **not** what you want, since this will fill up `/storage/symlinks` and break functionality:

![](/images/decypharr-setup-2.png)

#### Uncached content

To download **uncached** content, toggle the `download_uncached` value in your `config.json` file, either for the debrid provider, or for an individual Aarr.

{% include 'app_footer.md' %}
