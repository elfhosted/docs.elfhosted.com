---
date: 2024-07-22
categories:
  - infra
tags:
  - CHANGELOG
title: Riven 0.8.0 Released, upgraded to 100% of your subscription revenue!
description: Riven v0.8.0 is hot-off-the-press, with loads of improvements / features! Also, 100% of your Riven subscription now goes to the devs!
---

# Riven 0.8.0 Released

!!! warning "Old / daily subscriptions will sunset from 1 Aug. Take action as described below"

    We have a new pricing model / bundle structure which requires resubscriptions (*the store can't migrate daily to monthly subscriptions for us*). Unless you take action described [here](/blog/2024/07/10/pricing-model-updated/), your ElfHosted subscriptions **will** stop working some time after 1 Aug 2024. 

    Details [here](/blog/2024/07/10/pricing-model-updated/)!

Tonight saw the end of the famous Riven "[pickle dance](https://store.elfhosted.com/product/pickle-dance-mug)", as our favorite `.pkl` file was abandoned for a "real" database (*SQLite, in our case*), as part of the big v0.8.0 release!

![](/images/blog/riven-rip-pickle.png)

Riven 0.8.0's changes include:

* Plex watchlists work again
* Anime show fixes
* Settings migrations
* RealDebrid API rate-limit fixes
* [AllDebrid](https://store.elfhosted.com/product/rclone-alldebrid-pia) support
* [TorBox](https://store.elfhosted.com/product/torbox-mount) support
* [Comet][comet] support
* Lots more!

!!! tip "Riven Revenue sharing Revised ❤️"
    Now's a good time to point out that we're reviewed our revenue sharing deal with Riven, and are now contributing 100% of your Riven subscription to the devs! (*so that's $9/month/subscriber, regardless of your stack / bundle / starter kit*).

<!-- more -->

## Comet Co-location

This is a small, but meaningful quality-of-life improvement.. if you're (*like me*) an occasional Plex **and** Stremio household (*because fussy kids can't pre-plan what they'd like to watch!*), you may already be taking advantage of [Comet][comet]'s proxy-streaming powers to safely simultaneoeusly stream from RealDebrid without fearing an account ban.

From tonight's rollout, Comet will "snuggle" with Zurg on the same node wherever possible, so you no longer have to worry about whether your Plex instance is in use at the same time as your Stremio users! The trick for this "safe setup" will be to exclusively use your Comet addon with Stremio, in proxy streaming mode - this will result in **all** your RealDebrid traffic being sourced from the same node, whether it be Plex-via-Zurg, or Comet Proxy Streaming.

(*There are still some cases where the snuggling may not work, so it might pay to confirm via [Kubernetes Dashboard][kubernetes-dashboard] or `kubectl get pods -o wide` in [ElfTerm][elfterm]*)

## elfhosted.us cluster progress

I've renewed our "experimental" US node for a second month, since we didn't quite get through testing last month, what with RD API "fun" and pricing model adjustments. The install process is smoothing out, and I'm about to start testing tenant services.

In the meantime, you can compare your results for https://speed.elfhosted.us (*Washington State*) with https://speed.elfhosted.com (*Germany*) for an indication of the difference!

## Summary

Thanks for geeking out with us, and please share these posts with related geeks! Type `/review` into any Discord channel to share your experience - this helps us to attract mooar elves!

--8<-- "common-links.md"
