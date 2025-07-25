---
title: Troubleshoot
description: Here's how to troubleshoot your ElfHosted apps
---

# Troubleshoot

This page outlines some common troubleshooting techniques you'd use to work out why your ElfHosted apps are not working - i.e., some "Elf-Service".

<iframe width="560" height="315" src="https://www.youtube.com/embed/gdZaPHvpJCo?si=FPScroHIHfUMuOMe" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## ElfBot

[ElfBot][elfbot] can be used to view logs, restart your apps, or create backups for later retrieval and archive. 

## Kubernetes Dashboard

If ElfBot is a spoon, then [Kubernetes Dashboard][kubernetes-dashboard] is a hammer! Using dashboard, you can examine your pods CPU/RAM usage, node placement, and more.

Deleting a pod using Kubernetes Dashboard will have the same effect as using ElfBot - the pod will be deleted, and Kubernetes will quickly schedule a replacement.

--8<-- "common-links.md"