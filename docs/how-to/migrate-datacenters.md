---
title: Migrating between ElfHosted datacenters
description: Prefer a datacenter "closer to home", for improved latency / throughput? Here's a quick guide
---

# Migrating between ElfHosted datacenters

ElfHosted's default datacenter is located in the EU, which may not result in the best performance for users in other parts of the world.

We're expanding to other regions, and this guide will show you how to migrate your ElfHosted services between regions.

## What you need to know

1. Our hosting costs vary per-region. In order to maintain pricing parity across regions, resources may differ per-region (*for example, the US cluster has lower CPU limits but higher bandwith allocations*)
2. Data migration is based on daily 24h offsite backups, so if you migrate 23h after your last backup, you'll loose the most recent 23h of changes. To make a manual backup, run `elfbot backup offsite` from [ElfTerm][elfterm].
3. Your data persists on each individual cluster for 7 days. So if you migrate **back** to our default datacenter after 6 days, you'll "pick up where you left off" 6d ago, but if you migrate back after 8 days, you'll get your data restored as of the most recent daily backup.
What you should know

There are some discrepancies between the datacenters which you should be aware of, listed below.

### elfhosted.cc

Due to hardware differences, in this environment, users get 25% of RAM limits, and 50% of the CPU limits they'd get at elfhosted.com, but 200% of the bandwidth. To date, these limits have not impacted normal function of any of the apps of our power users / beta-testers.

## Process

1. (*optionally*) Trigger an offsite backup with [ElfBot][elfbot], and investigate any failures (*if you care about that particular app's data*)
2. Use [ElfBot] to export all apps' environment variables (a global command)
3. Use https://speed.elfhosted.com to identify your ideal datacenter
4. Add the "[Elf-spedition](https://store.elfhosted.com/product/regional-relocation)" subscription to your account, picking the appropriate datacenter
5. Your apps will be turned off on the primary cluster, and created on the target cluster - this may take 10-15 minutes, depending on the volume of data restored from offsite backup
6. Your apps will run from the new cluster, with a new domain suffix! (*i.e., instead of `https://batman.elfhosted.com`, you might be `https://batman.elfhosted.cc`*)
7. Use [ElfBot][elfbot] to import your ENV vars
8. If you're using any custom domain names, update your CNAMEs to point to the new cluster suffix

## FAQ

### Can I un-migrate?

Yes, cancel your subscription within 7 days to roll back to the original datacenter, where your volumes persist for 7 days. If it’s been more than 7 days, your volumes will have been cleaned up, and you’ll either get the latest cloud backup, or a fresh installation.

--8<-- "common-links.md"