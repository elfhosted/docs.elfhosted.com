---
title: Elf Hosted OpenBooks 🧝
slug: Openbooks
description: Allows you to download ebooks from irc.irchighway.net quickly and easily.
upstream: https://github.com/evan-buss/openbooks
sponsorships:
- name: PayPal
  uri: https://www.paypal.com/paypalme/evanbuss
- name: Ko-fi
  uri: https://github.com/evan-buss/openbooks
---

# {{ page.meta.slug }}

Openbooks allows you to download ebooks from irc.irchighway.net quickly and easily.

{% include 'app.md' %}
{% include 'app_access.md' %}

### Where are my downloaded books?

The app saves books to `/tmp` by default, but this can by adjusted to use a storage mount by passing the `DATA_DIR` env var using [ElfBot][elfbot], for example:

``` title="Quick-paste into Plex's environment variables using ElfBot"
DATA_DIR=/storage/storagebox-a/media/ebooks
```


{% include 'app_footer.md' %}