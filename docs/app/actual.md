---
title: Hosted Actual Budget
slug: Actual
description: Actual Budget is a super fast and privacy-focused app for managing your finances
upstream: https://actualbudget.org/
links:
- name: GitHub
  uri: https://github.com/actualbudget/actual
- name: Discord
  uri: https://discord.gg/8JfAXSgfRf
sponsorship: 
- name: Open Collective
  uri: https://opencollective.com/actual
---

# {{ page.meta.slug }}

Actual Budget is a super fast and privacy-focused app for managing your finances. At its heart is the well proven and much loved Envelope Budgeting methodology.

You own your data and can do whatever you want with it. Featuring multi-device sync, optional end-to-end encryption and so much more.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How to use Actual

### API Access

A [community-maintained API "wrapper"](https://github.com/jhonderson/actual-http-api/) is attached to your Actual pod, for optional integration with 3rd-party tooling like https://github.com/TaylorJns/Actual-Budget-iOS-Widget.

The API will be non-functional until you to set 2 additional environment variables using [ElfBot][elfbot]:

* `ACTUAL_SERVER_PASSWORD`: Your own server password
* `API_KEY`: A new API key you make up, using something like `apg -m 50 -n 1`

The API will be accessible, by default, at `https://<your username>-actual-api.elfhosted.com`, and a [custom domain addon](https://store.elfhosted.com/product/actual-budget-api-custom-domain-addon/) is available. The API itself will **not** be linked on your ElfHosted apps dashboard or your health tab.

{% include 'app_footer.md' %}