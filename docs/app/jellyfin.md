---
title: Elf Hosted Jellyfin Accounts 🧝
slug: Jellyfin
description: Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.
works_with:
- Jellyseerr
- Jellyfin-Accounts
- NextPVR
upstream: https://jellyfin.org
links:
- name: subreddit
  uri: https://www.reddit.com/r/jellyfin/
sponsorship: 
- name: Open Collective
  uri: https://opencollective.com/jellyfin
---

# {{ page.meta.slug }}

Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

When you first connect, you'll be prompted to configure your admin account, setup your libraries, etc.

### Metadata / Artwork

Jellyfin defaults to saving media metadata **alongside** the media. This will quickly exhaust your symlink storage, so ensure that the following are configured:

![](/images/jellyfin-setup-2.png)

![](/images/jellyfin-setup-3.png)

### Trickplay

Disable any form of chapter analysis or trickplay, to avoid unnecessary wastage of your allocated RealDebrid bandwidth (*analysis would require Jellyfin to download each entire file simply to analyze*).

![](/images/jellyfin-setup-1.png)

### Enable Hardware transcoding

Our nodes support either Intel QuickSync for Video (QSV) (*EU datacenter*) or Nvidia (*US datacenters*). Enable this under the admin dashboard's Playback settings.

#### EU Datacenters

The following options have been tested on the QSV hardware in the EU datacenter:

* Enable VPP Tone mapping: **Checked**

### From media players

When you configure the Jellyfin app in your media player, use `https://<username>-jellyfin.elfhosted.com` as the address (*if a port is required, use `443`*)

## Solutions to common issues

### Playback stalls

Jellyfin may be trying to transcode the media, based on a detected incompatibilty with your client/app, and running into CPU limitations. For optimal performance and quality, try to direct-play media where possible. You could also try enabling hardware transcoding (*above*), which will improve transcoding performance.

### Test your speed

To test your streaming speed to your Jellyfin instance, browse to `https://<your username>-jellyfin.elfhosted.com/speed/` to perform a speedtest.

{% include 'app_footer.md' %}