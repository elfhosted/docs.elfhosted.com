---
title: StremThru - Your Stremio / Debrid multitool
slug: StremThru
description: StremThru is a Stremio "companion", a debrid multi-tool, which enhances your debrid / addon experience, by "wrapping" addons for increased debrid provider support, "proxying" streams to avoid simultaneous-IP-usage bans, make your debrid library available for browsing / searching, and re-order / configure your addons.
upstream: https://github.com/MunifTanjim/stremthru
---

# {{ page.meta.slug }}

StremThru is not a "traditional" [Stremio Addon][stremio-addons] - it's a collection of tools to add enhanced functionality to existing addons, and so can be used in a variety of ways, the most notable being:

1. Add additional debrid providers to other addons (*public and private*)
2. "Proxystream" from other addons, to avoid simultaneous-IP-use bans (*private only*)
3. Browse / search your own debrid catalogue in Stremio (*public and private*)
4. Re-order / temporarily deactivate your addons (*public and private*)

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use StremThru?

### Initial Setup (private instance)

!!! tip
    The following is only required for [private, ElfHosted instances](https://store.elfhosted.com/product/stremthru/)

#### Setup STREMTHRU_PROXY_AUTH

`STREMTHRU_PROXY_AUTH` is your StremThru instance's user and password list, and is only required if you want to do proxy streaming. 

You can serve multiple, different users from StremThru, or simply use a common user/password for all streaming.

Users are defined by using [ElfBot][elfbot] to set the `STREMTHRU_PROXY_AUTH` environment variable, as in the following example, creating a user `batman` with password `supermanisaweenie`

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_PROXY_AUTH=batman:supermanisaweenie
```

Or, a more comprehensive example, defining passwords for users `batman`, `spiderman`, and `lexluthor`:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_PROXY_AUTH=batman:supermanisaweenie,spiderman:ppmjforever,lexluthor:iwishihadhair
```

!!! note
    StremThru will briefly restart after applying the env var.

Record your credentials (*you'll need them later*).

The credentials are then used in StremThru-compatible addons (*including StremThru itself*), to authorize access to your debrid providers (*below*)...

#### Setup STREMTHRU_STORE_AUTH

Separately from your **users**, StremThru thinks of debrid providers as "stores". RealDebrid is a "store", AllDebrid is a "store", etc.

`STREMTHRU_STORE_AUTH` is how you tie your **users** to your debrid providers.

Once again, a simple example for user `batman` with RealDebrid API key `abcdef123456`...

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_STORE_AUTH=batman:realdebrid:abcdef123456
```

And a more complicated example, where `batman` uses RealDebrid with API key `abcdef123456`, `spiderman` uses AllDebrid with API key `ghijkl56789`, and `lexluthor` uses TorBox with API key `98765dcba`:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_STORE_AUTH=batman:realdebrid:abcdef123456,spiderman:alldebrid:ghijkl56789,lexluthor:torbox:98765dcba
```

!!! note
    StremThru will briefly restart after applying the env var.

### Store

StremThru includes a catalogue addon, which makes your debrid library available in both the `Discover` and the `Search` sections of Stremio.

To install the catalogue addon, visit <https://stremthru.elfhosted.com/stremio/store/> (*or the equivalent on your private StremThru instance*), pick your `Store Name`, and enter the appropriate token.

!!! tip
    Picking `StremThru` as your `Store Name` will require your chosen user/pass combination from `STREMTHRU_PROXY_AUTH` (i.e., `batman:supermanisaweenie`) - in the backend, this combination is used to look up your debrid provider credentials (`STREMTHRU_STORE_AUTH`). Unless you have unusual requirements (*using public StremThru store with a private StremThru instance, for example*), this is unnecessary.

Install the addon, and then find it in Stremio under `Discover`, or as a provider of search results.

### Wrap

#### Adding extra debrid support to existing addons (public & private)

StremThru can "wrap" an addon which serves direct torrents (*i.e. not debrid links*), using its own knowledge of your debrid provider to download and serve the torrent.

To wrap an addon, go to the **original addon**, configure it with your preferred options, as if you wanted direct torrents (*no debrid provider*), and copy the installation URL (*ending in `.manifest.json`*). 

!!! tip
    If the installation URL starts with `stremio://`, you'll need to change it to `https://` before it'll work with StremThru

In the case of a default TorrentIO installation, this URL would be `https://torrentio.strem.fun/manifest.json`

Go to <https://stremthru.elfhosted.com/stremio/wrap/> (*or the equivalent on your [private, ElfHosted instance](https://store.elfhosted.com/product/stremthru/)*), and paste the URL into `Upstream Manifest URL`, as illustrated below:

![](/images/stremthru-wrap-1.png)

Choose your debrid provider from `Store Name`, and enter the appropriate API token.

!!! tip 
    Using "StremThru" as a 'Store Name' is not necessary if you're wrapping with an existing debrid provider, and you **don't** want to do proxy-streaming. For proxy-streaming support, see the next section.

Click the `Install` button to add the wrapped addon to Stremio, or (*after clicking*) copy the manifest URL and paste it into Stremio manually.

That's it! When Stremio searches the wrapped addon, StremThru will request torrents from the original addon, and use your configured debrid provider to provide cached/uncached links for Stremio to consume.

#### Adding proxystreaming support to existing addons (private)

With one variation, the process above can be used to provide "proxy streaming" support to existing addons. When adding proxystreaming, you'll need to have configured `STREMTHRU_PROXY_AUTH` and `STREMTHRU_STORE_AUTH` as described above, and you'll need an [ElfHosted private instance](https://store.elfhosted.com/product/stremthru/).

Proceed with "wrapping" the addon as described above, but for `Store Name`, choose `StremThru`, instead of the actual debrid provider.

![](/images/stremthru-wrap-2.png)

In `Store Token`, enter your chosen user/pass combination from `STREMTHRU_PROXY_AUTH` (*i.e., `batman:supermanisaweenie`*) - in the backend, this combination is used to look up your debrid provider credentials (`STREMTHRU_STORE_AUTH`), and to generate the streaming link, which will appear, to the provider, as coming from the source IP of your StremThru instance.

You can now use the "wrapped" addon across multiple devices in multiple locations at once, and avoid inadvertent account bans for simultaneous source IP streaming.

!!! tip
    Use this process with multiple addons (*or multiple `STREMTHRU_PROXY_AUTH` users*) to combine all streaming from your StremThru instance

### Sidekick

StremThru also includes "Sidekick", a simple interface to the Stremio API, which allows you to re-order your existing addons, or even temporarily disable them (*say, if they're under maintenance*) without uninstalling them.

To use Sidekick, it's currently required that you pass your Stremio username/password to the addon. Other authentication mechanisms (*tokens, etc*) are coming in future updates. Users with concerns re the security of the credentials should review the [source code](https://github.com/MunifTanjim/stremthru/tree/main/internal/stremio/sidekick), or avoid using Sidekick.

To launch Sidekick, visit <https://stremthru.elfhosted.com/stremio/sidekick/>, or the equivalent URL on your [private instance](https://store.elfhosted.com/product/stremthru/).

### List

StremThru List now supports both MDBList and Trakt.tv, and you can access any MDBLIst or Trakt.tv Lists right inside Stremio as Catalogs. 

For Trakt support, you'll need your own Trakt OAuth credentials (*free but you have to sign up*).

Create your OAuth credentials here, and set your redirec URI to <https://<YOUR STREMTHRU URL>/auth/trakt.tv/callback>. Use ElfBot to set `STREMTHRU_INTEGRATION_TRAKT_CLIENT_ID` and `STREMTHRU_INTEGRATION_TRAKT_CLIENT_SECRET` like this:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_INTEGRATION_TRAKT_CLIENT_ID=your-oauth-client-id
STREMTHRU_INTEGRATION_TRAKT_CLIENT_SECRET=your-oauth-client-secret
```

{% include 'app_footer.md' %}
