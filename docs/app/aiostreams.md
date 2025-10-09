---
title: Host AIOStreams Stremio Addon (torrentio alternative)
slug: AIOStreams
description: AIOStreams (an alternative to torrentio stremio addon) is a popular Stremio Addon which combines the results of other addons, to produce a sorted, parsed, and deduplicated list of results, which can optionally be proxy-streamed using MediaFlow Proxy
upstream: https://aiostreams.elfhosted.com
links:
- name: GitHub Repo
  uri: https://github.com/Viren070/AIOStreams
sponsorship: 
- name: Ko-Fi
  uri: https://ko-fi.com/Viren070
- name: GitHub Sponsors
  uri: https://github.com/sponsors/Viren070
---

# {{ page.meta.slug }}

AIOStreams is an "addon of addons", which uses your provider credentials and preferences to combine the results from multiple addons, parse / filter, and present them in a consistent format, according to your preferences.

!!! tip "Proxy streaming support for torrentio"
    Notably, AIOStreams can serve these combined addons through your [MediaFlow Proxy][mediaflow-proxy] or [StremThru][stremthru] instance, so that you'll be able to use the results with your debrid provider from multiple locations at once, while not risking an account ban, since your provider only sees the IP of your proxy instance.

ElfHosted provides a public, community version of MediaFusion at https://aiostreams.elfhosted.com (*with individual and global rate-limits*), and per-user, private, un-rate-limited instances.

!!! tip "AIOStreams gets revenue sharing! :heart:"
    AIOStreams is an "Elf-illiated" Premium [Stremio Addon][stremio-addons] - the developer maintains an active support channel ([#elf-aiostreams](https://discord.com/channels/396055506072109067/1329435155407831070)) in our [Discord][discord] community, the app itself is tuned to work perfectly with ElfHosted "out-of-the-box", and 33% of your subscriptions are contributed to the developer!

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

### Proxying (optional)

We preconfigure AIOStreams with your bundled MediaFlowProxy or StremThru, so usually you'd just set the `credentials` field to match either your StremThru store, or your MediaFlowProxy api_password.

#### StremThru

<iframe width="560" height="315" src="https://www.youtube.com/embed/sYOsZ4AUN-Y?si=TzDsDisFvPPergQ3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Use [ElfBot] to set the `STREMTHRU_PROXY_AUTH` ENV var for Stremthru, to something like `spiderman:ilovemaryjane`, and then use that same value (`spiderman:ilovemaryjane`) as your proxy credentials in AIOStreams. Leave the rest of the proxy options as pre-configured.

``` title="Quick-paste into StremThru's environment variables using ElfBot"
STREMTHRU_PROXY_AUTH=spiderman:ilovemaryjane
```

#### MediaFlow Proxy

<iframe width="560" height="315" src="https://www.youtube.com/embed/45-dZnxluZ8?si=2Z6e3pETmW98rT9C" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Use [ElfBot] to set the `API_PASSWORD` ENV var for MediaFlow Proxy, to something like `greengoblinwuzhere`, and then use that same value (`greengoblinwuzhere`) as your proxy credentials in AIOStreams. Leave the rest of the proxy options as pre-configured.

``` title="Quick-paste into MediaFlow Proxy's environment variables using ElfBot"
API_PASSWORD=greengoblinwuzhere
```

#### Preferring MediaFlowProxy over StremThru

If you have both StremThru **and** MediaFlowProxy, we'll default your AIOStreams to work with StremThru, but you can override these defaults by setting the following ENV vars using [ElfBot][elfbot]:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
FORCE_PROXY_ID=mediaflow
FORCE_PROXY_URL=http://mediaflow-proxy:8888
FORCE_PROXY_PUBLIC_URL=https://<your mediaflow proxy hostname>
```

#### Using an external proxy

If you prefer to use an external (non-ElfHosted) instance of either StremThru or MediaFlowProxy, you'll need to pass ENV vars to AIOStreams to override our preset defaults. There's usually a disparity between the internal and the public URL of the proxy, but assuming an external StremThru with url `https://mystremthru.mickeymouse.com`, you'd set:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
FORCE_PROXY_ID=stremthru
FORCE_PROXY_URL=https://mystremthru.mickeymouse.com
FORCE_PROXY_PUBLIC_URL=https://mystremthru.mickeymouse.com
```

### Set SECRET_KEY (optional)

AIOStreams uses a secret key to encrypt the data you provide, so that you're not exposing base64-encoded API keys in the manifest URLs held by Stremio. This also protects your keys if you share your addon, since a user would need your ElfHosted SSO credentials in order to use the /configure page to examine them.

AIOStreams won't work without a `SECRET_KEY`, but we've set a secret default so that the app will work without configuration. Users who prefer to, can change their `SECRET_KEY` (and re-install the addon), by generating a 64-character hexidecimal string (*`openssl rand -hex 32` for example*), and then applying it to AIOStreams using [ElfBot][elfbot]:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
SECRET_KEY=whateveryousetmakesureits64charshexidecimalonly
```

### Set ADDON_PASSWORD (optional)

AIOStreams supports using regex-based sorting and filtering, to further refine your results. In order for the options (`excludePattern` and `includePattern`) to appear, users need to set an `ADDON_PASSWORD` environment variable.

Unlike `SECRET_KEY`, `ADDON_PASSWORD` can be anything you like - you'll need to enter it on the `/configure` page, and reconfigure the addon, in order to use it. Set the `ADDON_PASSWORD` in AIOStreams using [ElfBot][elfbot]:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
ADDON_PASSWORD=whateveryoulike
```

!!! note "Backwards-compatible to `API_KEY`"
    Version 1 of AIOStreams used an environment variable `API_KEY`, which has now been deprecated and replaced with `ADDON_PASSWORD`. If `ADDON_PASSWORD` is not set, but `API_KEY` is set, then AIOStreams will "fall back" to `API_KEY`.

### Integrate with MediaFusion

If you've got an ElfHosted [MediaFusion][mediafusion] instance, you'll have set your own `api_password`. AIOStreams needs that same password for optimal integration into the /configure page, so set it using:

``` title="Quick-paste into StremThru's environment variables using ElfBot"
MEDIAFUSION_API_PASSWORD=sameapipasswordyousetformediafusion
```

{% include 'app_footer.md' %}