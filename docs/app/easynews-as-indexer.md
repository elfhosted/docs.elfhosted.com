---
title: Use your EasyNews account as a NewzNab indexer
slug: Easynews-as-indexer
description: NZBGet is an efficient usenet downloader
upstream: https://github.com/nzbdav-dev/nzbdav
works_with:
- NzbDAV
- Prowlarr
- AIOStreams
---

# {{ page.meta.slug }}

Easynews-as-indexer is a simple tool to allow you to use your own EasyNews account as a newznab indexer, so that you can use it alongside supported apps such as [Prowlarr][prowlarr], [NzbDAV][nzbdav], and [AIOStreams][aiostreams].

## How do I use it?

To use EasyNews, you'll need an EasyNews account. You can get one for [as little as \$3/month for the first year](https://signup.easynews.com/checkout/deal-for-you-e1/), or potentially [$2/month](https://signup.easynews.com/checkout/winback-deal-ae/) if on a "win-back" deal.

### Setup Credentials

Provide your EasyNews details to easynews-as-indexer using [ElfBot][elfbot]:

``` title="Quick-paste into easynews-as-indexer's environment variables using ElfBot:"
EASYNEWS_USER=your_easynews_username
EASYNEWS_PASS=your_easynews_password
```

### In AIOStreams

Add a `NewzNab` addon from the marketplace with the URL of `http://easynews`, and API key of `elfhosted`, as illustrated below:

![](/images/easynews-as-indexer-aiostreams.png)

### In Prowlarr

Add a `Generic Newznab` indexer with the URL of `http://easynews`, and API key of `elfhosted`, as illustrated below:

![](/images/easynews-as-indexer-aiostreams.png)

{% include 'app_footer.md' %}