---
title: 🧝 Hosted CineSync 📚
slug: CineSync
description: CineSync uses smart symlinking to organize your debrid libraries for tidy streaming from Plex
upstream: https://github.com/sureshfizzy/CineSync
links:
- name: Discord
  uri: https://discord.gg/BtZYTCQtAR
sponsorship: 
- name: GitHub Sponsors
  uri: https://github.com/sponsors/sureshfizzy
- name: Buy Me A Coffee
  uri: https://buymeacoffee.com/Sureshfizzy
- name: Patreon
  uri: https://patreon.com/sureshs
- name: PayPal
  uri: https://www.paypal.me/sureshfizzy
---

# {{ page.meta.slug }}

CineSync is a comprehensive media library management system designed to efficiently organize libraries for Movies & TV shows, eliminating the need for [Sonarr][sonarr]/[Radarr][radarr]. With its modern web interface, real-time monitoring, and advanced automation features, CineSync streamlines the organization of your library while providing full control over your data locally. While highly optimized for debrid platforms, CineSync is also versatile and works effectively with non-debrid platforms.

{% include 'app.md' %}

## What's New in CineSync

- **🌐 Modern Web Interface** - Complete web-based dashboard with file browser, settings management, and real-time monitoring
- **🤖 Auto-Processing** - Intelligent automation that processes media files as they're discovered
- **📊 Advanced Analytics** - Comprehensive dashboard with media statistics, recent activity, and system monitoring
- **🎯 Smart Content Separation** - Automatic categorization for Kids content, 4K media, and Anime with customizable rules
- **🔄 Real-Time Updates** - Live dashboard updates and instant media server integration (Plex/Jellyfin/Emby)
- **🗃️ Database Management** - Built-in database with export capabilities and advanced search functionality

## Web Interface Features

- **📊 Interactive Dashboard**: Real-time statistics, recent media tracking, and system monitoring
- **📁 Advanced File Browser**: Navigate, manage, and organize your media library with drag-and-drop support
- **⚙️ Settings Management**: Configure all CineSync options through an intuitive web interface
- **🔍 Smart Search**: Advanced search and filtering capabilities with alphabet indexing
- **📈 Analytics & Reporting**: Detailed insights into your media collection and processing activities
- **🔄 Real-Time Updates**: Live notifications and automatic refresh of library changes
- **🎯 Auto-Processing Controls**: Enable/disable automatic processing with toggle controls
- **🗃️ Database Management**: Export, search, and manage your media database
- **🔐 Secure Authentication**: JWT-based authentication with configurable access controls

{% include 'app_access.md' %}

## How to use CineSync

Point your Plex libraries to the respective folders under `/storage/symlinks/`

Optionally, grab a [Plex Token][plex-token], and add it to CineSync as illustrated below, triggering library updates in Plex when new content is detected.

![](/images/cinesync-setup-1.png)

{% include 'app_footer.md' %}
