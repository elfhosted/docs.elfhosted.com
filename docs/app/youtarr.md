---
title: Curate your own YouTube Downloads with YouTarr
slug: YouTarr
description: Curate your own YouTube Downloads with YouTarr
upstream: https://github.com/DialmasterOrg/Youtarr
works_with:
- Plex
- Jellyfin
- Emby
sponsorship:
- name: Patreon
  uri: https://www.patreon.com/cw/ChrisDial
---

# {{ page.meta.slug }}

Youtarr is a YouTube downloader that automatically downloads videos from your favorite channels or specific URLs. With optional Plex/Jellyfin/Emby integration, it can refresh your media library for a seamless, ad-free viewing experience. 

Save your videos to external storage, and play them back with Plex!

{% include 'app.md' %}

## 🤔 Why Youtarr?

* No Ads or Tracking: Watch YouTube content without interruptions
* Offline Viewing: Access your videos anytime, even without internet
* Archive Content: Preserve videos before they're deleted or made private
* Family-Friendly Option: Create a curated, safe YouTube experience for kids
* Works Standalone: Full functionality without requiring any media server
* Plex-Ready: Seamlessly integrates with Plex if desired, but never requires it

## 🎯 Key Features

Core Features (No Plex Required)

* 📥 Smart Downloads: Pre-validate YouTube URLs with metadata preview before downloading (powered by yt-dlp)
* 🎯 Custom Quality Settings: Per-download resolution control with support from 360p to 4K
* 📺 Channel Subscriptions: Subscribe to channels and auto-download new videos
* 🚫 SponsorBlock Integration: Automatically remove or mark sponsored segments, intros, outros, and more using the crowdsourced SponsorBlock database
* 🗂️ Smart Organization: Videos organized by channel with metadata and thumbnails
* ⏰ Scheduled Downloads: Configure automatic downloads on your schedule (cron-based)
* 📱 Web Interface: Manage everything through a responsive web UI
* 🔍 Browse Channels: View all videos from subscribed channels before downloading
* 📊 Download History: Track what you've downloaded with smart duplicate prevention
* 🔐 Secure Access: Local authentication system with admin controls
* ☁️ Platform Flexible: Configurable storage paths for Kubernetes/Elfhosted deployments

Optional Plex Integration

* 🔄 Auto Library Refresh: Automatically update Plex after downloads
* 📁 Plex-Ready Format: Videos organized and named for perfect Plex compatibility
* 🎬 Metadata Support: Full descriptions, thumbnails, and video info display in Plex

{% include 'app_access.md' %}

## How to use YouTarr

### Setup external storage

Since YouTarr **downloads** content rather than just **streaming** it, a pre-requisite is that you attach your own, external cloud storage. ElfHosted users can "magically" [mount any rclone-compatible storage][rclone].

Your rclone-mounted storage will appear in `/storage/rclone/<something>` - use [FileBrowse][filebrowser] to confirm the path, and then set the `DATA_PATH` ENV var using [ElfBot][elfbot], like this example (*yours will be different, depending on path*):

![](/images/youtarr-elfbot-env.png)

### Setup cookies

YouTarr utilizes on `yt-dlp`, which needs a cookie file with valid Google account credentials, in order to access YouTube.

It is possible that excessive use of `yt-dlp` with this cookie may flag your account for automated abuse, so it's sensible to create a **separate** Google account, **just** for YouTarr (*a "throwaway" account*).

Methods may vary per-browser, but here is a solution which works in Firefox.

1. Install the [cookies.txt](https://addons.mozilla.org/en-US/firefox/addon/cookies-txt/) extension into Firefox, or the [Get cookies.txt LOCALLY](https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc) addon in Chrome
2. Open a **Private Browser Window**, and navigate to https://youtube.com. Log in with your throwaway account.
3. Once logged into YouTube, launch the extension, and save all cookies from your current window to a `cookies.txt` file
4. Examine the cookies.txt file, ensure it contains only Google-related cookies
5. Upload the `cookies.txt` file into YouTarr.

!!! warning "Sensitive cookies ahead"
    Your `cookies.txt` file can be used to gain access to the associated Google account. Use a throwaway account for this purpose, and protect your `cookies.txt` file as you would your password.

{% include 'app_footer.md' %}