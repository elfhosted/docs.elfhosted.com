---
title: Cloud Plex Media Server
slug: Plex
description: ElfHosted provides simple Plex hosting - including hardware transcoding
works_with:
- Ombi
- Overseerr
- Tautulli
upstream: https://plex.tv
links:
- name: subreddit
  uri: https://www.reddit.com/r/plex
price: 0.15
---

# {{ page.meta.slug }}

Plex is a power media player with support across a large range of platforms

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

Use [ElfBot][elfbot] to apply your [plex claim](https://www.plex.tv/claim/), and reboot. Then access Plex from your dashboard.

You'll be prompted to setup your libraries, etc.

### From media players

When you configure the Plex app in your media player, use `https://<username>-plex.elfhosted.com` as the address (*if a port is required, use `443`*)

### Enable Hardware transcoding

Our nodes support Intel QuickSync for Video (QSV). If you're a PlexPass user, you can enable hardware transcoding.

## Solutions to common issues

### Claiming server / Can't add media libraries

If you find that you can't add media libraries, or even administer your Plex instance, then it probably hasn't been "claimed" yet. Use [ElfBot][elfbot] to claim your server using a claim code from https://www.plex.tv/claim/.

To confirm whether your Plex instance has been claimed, use [FileBrowser][filebrowser] to examine `config/plex//Library/Application Support/Plex Media Server/Preferences.xml`. If the server has been claimed, you'll see a key `PlexOnlineUsername`.

### Playback stalls

Plex may be trying to transcode the media, based on a detected incompatibilty with your client/app, and running into CPU limitations. For optimal performance and quality, try to direct-play media where possible. You could also try enabling hardware transcoding (*above*), which will improve transcoding performance.

### The transcoder exited due to an error.

This error will occur if Plex tries to transcode something in an inefficient way. ElfHosted nodes run a "[transcode-killer](https://github.com/funkypenguin/elf-infra/blob/ci/roles/node/files/kill-unwanted-transcodes.sh)" script which terminates such transcodes for the sake of the resources shared by other users.

Here are the transcodes we'll automatically terminate:

* Transcoding from HEVC to H264
* Transcoding video without using QSV (*PlexPass is required for hardware transcoding support*)
* Transcoding any 4K content (*even with QSV this is very resource-intensive - 4K should only be direct-played*)

### Database is corrupt

You trigger a database repair in Plex by setting the `REPAIR_DB_ON_START` environment variable to `true` with ElfBot, like this:

```bash
elfbot env plex REPAIR_DB_ON_START=true
```

Plex will restart, and thereafter on every restart (*until you set it to `false`*), it will run through a DBRepair process which has been known to fix database issues / inconsistencies.

Plex makes its own, internal backup of its database at regular intervals, so it's possible to restore from a backed-up version of the database.

Here's the process to restore Plex to a database backup:

1. "Pause" Plex, using [ElfBot][elfbot]
2. In [FileBrowser][filebrowser], navigate to `config/plex/Library/Application Support/Plex Media Server/Plug-in Support/Databases`
3. Rename `com.plexapp.plugins.library.db` to `com.plexapp.plugins.library.db-corrupt`, and then pick the most recent, dated version of `com.plexapp.plugins.library.db-<date>`, and rename it to `com.plexapp.plugins.library.db`.

When Plex starts after the pause, the backup database will be used! :thumbsup:

### Remote Access issues

Plex may alert you that it is "Not available outside your network". This is to be expected, given that we're (a) accessing it via a reverse proxy, and (b) using a VPN to avoid Plex's global Hetzner ban. 

You'll still be able to access your Plex instance remotely via apps etc, provided that under `Settings` -> `Network` -> `Custom server access URLs`, you see your ElfHosted URL defined (*i.e. `https://<your username>-plex.elfhosted.com:443`*).

Note that when you connect to Plex externally, your port will be `443`, since your traffic arrives via our reverse proxy.

### Unable to save settings

Normally, Plex servers can be remotely administered using https://app.plex.tv - in our case, (maybe because we're using a VPN?), users have had inconsistent results saving server settings changes this way. To make changes to your Plex instance, use the `https://<your username>-plex.elfhosted.com` interface.

### Get Plex token

Several app integrations require a Plex "authentication token". The simplest way to generate this token, when you need it, is to use the [ElfHosted Plex Token Generator][plex-token]!

### Auto-empty trash

By default Plex is configured to **not** automatically empty its trash. This default primarily benefits symlink-based, "[Infinite Streaming](/guides/media/)" users, who would loose their entire library of content if their debrid service was disconnected for a period.

Users may opt back into automatically clearing Plex's trash by overriding an environment variable (*`PLEX_PREFERENCE_7` in our case*), using [ElfBot][elfbot]. To enable automatic clearing of Plex's trash, use [FileBrowser][filebrowser]'s console, and run `elfbot env plex PLEX_PREFERENCE_7=autoEmptyTrash=1`

### Test your speed

To test your streaming speed to your Plex instance, browse to `https://<your username>-plex.elfhosted.com/speed/` to perform a speedtest.

{% include 'app_footer.md' %}