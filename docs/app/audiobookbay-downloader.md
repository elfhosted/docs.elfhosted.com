---
title: 🧝 Hosted AudiobookBay Downloader 🎧
slug: AudiobookBay-Downloader
upstream: <https://github.com/JamesRy96/audiobookbay-Downloader>
description: AudiobookBay Downloader searches AudioBook Bay and pushes magnet links into your torrent client so apps like Audiobookshelf can ingest the finished downloads automatically.
links:
- name: GitHub repo
  uri: <https://github.com/JamesRy96/audiobookbay-Downloader>
- name: Container image
  uri: <https://github.com/JamesRy96/audiobookbay-Downloader/pkgs/container/audiobookbay-Downloader>
- name: Screenshots
  uri: <https://github.com/JamesRy96/audiobookbay-Downloader#screenshots>
---

<!-- markdownlint-disable-next-line MD025 -->
# {{ page.meta.slug }}

AudiobookBay Downloader (ABB Downloader) is a lightweight web UI that searches [AudioBook Bay](https://audiobookbay.lu/) and forwards the results to Decyhparr. Decypharr creates a symlink and, ABB Downloader moves the downloads to a destination folder, and apps such as [Audiobookshelf][audiobookshelf] can pick up the organized files automatically.

{% include 'app.md' %}

Features include:

- 🔎 Fast keyword search across the public AudioBook Bay index.
- 🖼️ Inline book covers, titles, and "More details" links for quick vetting.
- ⚡ One-click "Download to server" that generates a magnet link from the ABB infohash and posts it to your torrent client's WebUI.
- 📁 Automatic category + save-path assignment so torrents land in the right library folder for Audiobookshelf, Plex, or Jellyfin.
- 📊 Optional status view that shows everything in the chosen torrent category, so you can see what is still downloading.
- 🔗 Optional navigation link (e.g., "Open Audiobookshelf") injected into the UI for rapid hopping between tools. 

{% include 'app_access.md' %}

## How do I use it?

### Add Jackett API key

```
JACKETT_API_KEY
```

Use the search box to find a title on AudioBook Bay. Click **More details** to open the ABB listing, or **Download to server** to push the magnet directly into Decypharr.

### Final Destination

By default, AudiobookBay Downloader will move completed symlinks to `/storage/symlinks/audiobooks`, but if you'd prefer the files be **actually copied** (dereferenced) to [rclone-mounted][rclone] storage, then set the `TARGET_DIR` ENV var using [ElfBot]

{% include 'app_footer.md' %}
