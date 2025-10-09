---
title: 🧝 Hosted Debridav
slug: Debridav
description: Debridav enables "Infinite Streaming" from Premiumize and EasyNews accounts, similar to how Zurg works for RealDebrid
works_with:
- Radarr
- Sonarr
- Prowlarr
upstream: https://github.com/skjaere/DebriDav
---

# {{ page.meta.slug }}

Debridav is a small app written in Kotlin that emulates the qBittorrent and SABnzbd APIs and creates virtual files that are mapped to remotely cached files at debrid services, essentially acting as a download client that creates virtual file representations of remotely hosted files rather than downloading them. DebriDav exposes these files via the WebDav protocol so that they can be mounted.

[Get Elf Hosted {{ page.meta.slug }}! :magic_wand:](https://store.elfhosted.com/product/{{ page.meta.slug | lower }}/){ .md-button .md-button--primary }

!!! tip "Debridav gets revenue sharing! :heart:"
    Debridav is an "Elf-illiated" project - the developer maintains an active support channel ([#elf-debridav](https://discord.com/channels/396055506072109067/1327038603389567068)) in our [Discord][discord] community, the app itself is tuned to work perfectly with ElfHosted "out-of-the-box", and 33% of your subscriptions are contributed to the developer!

## How do I use it?

The following guide indicates how to **add** Debridav to an existing, ElfHosted stack. To setup a new stack with Premiumize or EasyNews as your primary storage provider, refer to:

TBC

### Premiumize

To use Premiumize, you'll need an Premiumize account. ElfHosted currently have 14-day trial vouchers available for first-time Premiumize users. Reach out in [#elf-help][elf-help] if you'd like one!

Use [ElfBot][elfbot] to set the following environment variables:

``` title="Quick-paste into Debridav's environment variables using ElfBot"
PREMIUMIZE_API_KEY=<your api key>
```

#### Radarr / Sonarr

In each Aarr, add a new download client, of type qBittorrent. Set the name to `Debridav [PM/RD/EN]`, the URL to `http://debridav:8080`. No credentials are required. Set one of following categories `radarr,sonarr,radarr4k,sonarr4k,lidarr,readarr,readarraudio,prowlarr` (*avoid re-using the same category across multiple aars*).


![](/images/debridav-setup-3.png)

Under `Settings` -> `Media Management` in your aars, show the advanced settings, and enable `Import Using Script`. Set the `Import Script Path` to `/elf-import.sh`

![](/images/debridav-setup-4.png)

### EasyNews

To use EasyNews, you'll need an EasyNews account. You can get one for [as little as \$3/month for the first year](https://signup.easynews.com/checkout/deal-for-you-e1/), or potentially [$2/month](https://signup.easynews.com/checkout/winback-deal-ae/) if on a "win-back" deal.

Use [ElfBot][elfbot] to set the following environment variables:

``` title="Quick-paste into Debridav's environment variables using ElfBot"
DEBRIDAV_DEBRIDCLIENTS=easynews
EASYNEWS_USERNAME=<your username>
EASYNEWS_PASSWORD=<your password>
```

!!! tip "Using Premiumize and EasyNews simultaneously"
    It's possible to use both Premiumize **and** EasyNews, if you set:

    ``` title="Quick-paste into Debridav's environment variables using ElfBot"
    DEBRIDAV_DEBRIDCLIENTS=premiumize,easynews
    ```

#### Prowlarr

Add a custom Prowlarr indexer, of type `Generic Newznab`. Name it `ElfEasyNews` and set the URL to `http://debridav:5001`. Sync the indexer to your apps.

![](/images/debridav-setup-1.png)

#### Radarr / Sonarr

In each Aarr, add a new download client, of type SabNZBD. Set the name to `Debridav [EN] (Usenet)`, the URL to `http://debridav:8080`, and enter anything for the API key. Set one of following categories `radarr,sonarr,radarr4k,sonarr4k,lidarr,readarr,readarraudio,prowlarr` (*avoid re-using the same category across multiple aars*).

![](/images/debridav-setup-2.png)

Under `Settings` -> `Media Management` in your aars, show the advanced settings, and enable `Import Using Script`. Set the `Import Script Path` to `/elf-import.sh`

![](/images/debridav-setup-4.png)

Unless you're using Debridav exclusively, you'll now have both a usenet (*ElfEasyNews*) indexer and a torrent indexer (*ElfZilean*). Under `Settings` -> `Profiles` -> `Delay Profiles`, you can control which type your Aar will prefer.

![](/images/debridav-setup-5.png)

### Real Debrid

!!! warning
    The developer discourages RealDebrid users from using Debridav at present, until a significant bug has been resolved.

To use Debridav with RealDebrid, you'll need to set the `DEBRIDAV_DEBRIDCLIENTS` env var accordingly, like this:

``` title="Quick-paste into Debridav's environment variables using ElfBot"
DEBRIDAV_DEBRIDCLIENTS=real_debrid
```

You'll also need to set your RD API key, like this:

``` title="Quick-paste into Debridav's environment variables using ElfBot"
REAL-DEBRID_APIKEY=<your key>
```

### Where's my content?

The **actual** files are "downloaded" to `/storage/debridav/symlinked` (*moved there by the `elf-import.sh` script*), but you should continue to point your libraries (and your root media folders) to `/storage/symlinks/..`. 

{% include 'app_footer.md' %}