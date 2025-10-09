---
title: 🧝 Hosted AudioBookBay-Automated 🎧
slug: AudioBookBayA
upstream: https://www.audiobookshelf.org
sponsorship: 
- name: GitHub Sponsors
  uri: https://github.com/sponsors/advplyr
links:
- name: Official Subreddit 
  uri: https://www.reddit.com/r/audiobookshelf
- name: Discord server
  uri: https://discord.com/invite/pJsjuNCKRq
- name: GitHub repo
  uri: https://github.com/advplyr/audiobookshelf
- name: App (Google Play)
  uri: https://play.google.com/store/apps/details?id=com.audiobookshelf.app
- name: iOS app (Testflight)
  uri: https://testflight.apple.com/join/wiic7QIW
title: Audiobookshelf
description: Audiobookshelf is an audiobook and podcast streaming server, with native Android / iOS apps
---

# {{ page.meta.slug }}

Audiobookshelf is an audiobook and podcast streaming server, with native [Android](https://play.google.com/store/apps/details?id=com.audiobookshelf.app) / iOS ([testflight](https://testflight.apple.com/join/wiic7QIW)) apps.

{% include 'app.md' %}

Features include:

* Fully open-source, including the android & iOS app (in beta)
* Stream all audio formats on the fly
* Search and add podcasts to download episodes w/ auto-download
* Multi-user support w/ custom permissions
* Keeps progress per user and syncs across devices
* Auto-detects library updates, no need to re-scan
* Upload books and podcasts w/ bulk upload drag and drop folders
* Backup your metadata + automated daily backups
* Progressive Web App (PWA)
* Chromecast support on the web app and android app
* Fetch metadata and cover art from several sources
* Chapter editor and chapter lookup (using Audnexus API)
* Merge your audio files into a single m4b
* Embed metadata and cover image into your audio files (using Tone)
* Basic ebook support and e-reader (experimental)
  
{% include 'app_access.md' %}

## How do I use it?

Upon launch, you'll be prompted to create a username/password. Once this is completed, you'll be able to access the app, and configure your users, libraries, etc.

You may need to mount external storage to store your Audiobooks, using [rclone][rclone], if you're not storing your Audiobooks on an existing cloud storage provider, like [Real-Debrid][real-debrid].

{% include 'app_footer.md' %}