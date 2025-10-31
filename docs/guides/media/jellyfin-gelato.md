---
title: Ultimate guide infinite streaming with Jellyfin, Gelato, and AIOStreams
description: The following page guides the user through the process of establishing an ElfHosted "Infinite Streaming" stack using Jellyfin, Gelato, and AIOStreams
---

# Ultimate guide infinite streaming with Jellyfin, Gelato, and AIOStreams

This guide describes how to use Jellyfin, Gelato, and AIOStreams to create a simple "Infinite Streaming" stack, on ElfHosted.

An enhanced, "ScribeHow" version of this page can be found [here](https://scribehow.com/viewer/Install_Jellyfin_and_Gelato_Plugin_on_ElfHosted__vXHqhlnkQCSG3l40zpAV1g).

[Get your $1, 7-day free trial!](https://store.elfhosted.com/product/hobbit/){ .md-button .md-button--primary }

## Requirements

* [x] [JellyGoblin stack](https://store.elfhosted.com/product/jellygoblin/)

## How to set it up

In summary...

1. Subscribe to the [JellyGoblin stack](https://store.elfhosted.com/product/jellygoblin/)
2. Check your email for a confirmation of your TorBox account. Setup your account and retrieve your API key from <https://torbox.app/settings?section=account>
3. Configure Jellyfin without setting up libraries
4. Add Gelato plugin
5. Configure AIOStreams with your addon and service preferences
6. Apply AIOStreams manifest URL to Gelato
7. Add `/tmp/gelato/movies` and `/tmp/gelato/series` to new Jellyfin libraries

In (*excruciating*) detail...

{% include 'scribe_jellyfin_gelato_setup.md' %}

--8<-- "common-links.md"

{% include 'testimonials.md' %}