---
title: Hosted Immich
slug: Immich
description: Immich is a beloved s(elf-hosted) alternative to Google Photos
upstream: https://immich.app/
links:
- name: subreddit
  uri: https://www.reddit.com/r/Immich
- name: Discord
  uri: https://discord.immich.app/
sponsorship:
- name: Purchase
  uri: https://buy.immich.app
---

# {{ page.meta.slug }}

Immich is a beloved s(elf-hosted) alternative to Google Photos. Combined with a storage mount, Immich can be used to manage, catalogue, and backup your photos automatically from your mobile devices!

Want to check it out? There's a public demo instance at <https://demo.immich.app/>

{% include 'app.md' %}
{% include 'app_access.md' %}

## How to use Immich

!!! warning "Immich requires BYO storage"
    You'll need to attach your own cloud storage to your ElfHosted stack, to take advantage of Immich. An excellent choice for attaching cloud storage is a [Hetzner Storagebox][storagebox], which can optionally be encrypted.

### Video guide

<iframe width="560" height="315" src="https://www.youtube.com/embed/BOio8jKfnL4?si=cCPe1sqe220XTj-T" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Attach storage

Ensure you have a suitable BYO storage [rclone-mounted][rclone] (confirm the location is browsable in [FileBrowser][filebrowser]) - a [Hetzner Storagebox][storagebox] is a good option if you don't already have cloud storage.

### Configure 

Use ElfBot to configure Immich to point to your mounted storage location, by running something like:

``` title="Quick-paste into Immich's environment variables using ElfBot"
IMMICH_MEDIA_LOCATION=/storage/rclone/storagebox/photos
```

{% include 'app_footer.md' %}