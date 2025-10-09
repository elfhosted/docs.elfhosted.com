---
title: ElfBot, your helpful ElfHosted management tool
description: ElfBot is a custom-built UI for ElfHosted users, providing self-service functions such as app logs, restarts, backups, and Plex claims
slug: ElfBot
---

# ElfBot

![Screenshot of {{ page.meta.slug }}](/images/screenshots/{{ page.meta.slug | lower }}.png){ loading=lazy }

ElfBot is a custom-built tool for ElfHosters, which provides self-service functions, including:

1. View app logs
2. Pause apps
3. Restart apps
4. Reset apps (*wipe config and restore original pre-setup where applicable*)
5. Backup apps (*restart and create an offline backup*)
6. Claim a plex server
7. Set an arbitrary ENV var for an app (*advanced, beta feature*)
8. Report on and optionally delete broken symlinks

## Using ElfBot

ElfBot lives in the "Tools" section of your ElfHosted apps dashboard, or directly at `https://<username>-elfbot.elfhosted.com`.

### App Commands

#### View app logs

Shows you the current app logs, along with the option to "live stream" the logs so you can watch future changes

![Viewing app logs in ElfBot](/images/elfbot-ui-view-app-logs.png)

#### Restarting apps

Issues a restart to an app (*no confirmation requested*)

![Restarting an app in ElfBot](/images/elfbot-ui-restart-app.png)

!!! warning "No confirmation"
    Clicking "Restart" will restart an app with no further confirmation

#### Setting environment variables

Used to configure environment variables per-app

![Setting environment variables in ElfBot](/images/elfbot-ui-set-app-env-vars.png)

!!! warning "Setting ENV vars restarts apps"
    Setting an env var will result in an app restart

ENV vars can also be exported / imported on a per-app basis

![Setting environment variables in ElfBot](/images/elfbot-ui-set-app-env-vars-details.png)

#### Backup app

Triggers a one-time restart-and-backup of the app's `/config` folder to `/backups`.

![Backing up an app in ElfBot](/images/elfbot-ui-app-backup.png)

!!! warning "Backups restart apps"
    Performing a backup will result in an app restart, to ensure consistency

#### Claim Plex Server

ElfBot has a special feature just for Plex instances.. use it to "claim" your Plex server. For details, see the instructions at [Plex][plex]

![Claim Plex server using ElfBot](/images/elfbot-ui-claim-plex.png)

![Claim Plex server using ElfBot](/images/elfbot-ui-claim-plex-details.png)

### Global Commands

While app-level commands are executed on an individual app basis, ElfBot also provides global commands which affect your entire ElfStack:

#### Restart All

This will trigger all apps to restart immediately. A seldom-necessary action, but may be useful if you're untangling a storage mounting problem (*expired RD keys, external rclone mount, etc*).

![](/images/elfbot-ui-restart-all.png)

#### Reset All

!!! warning "This will remove ALL data from ALL your ElfHosted apps"

Hardly ever intended to be used, a Reset All will... reset all the stuff!

![](/images/elfbot-ui-reset-all.png)

You will be asked to confirm this destructive action:

![](/images/elfbot-ui-reset-all-confirm.png)


#### Environment Variables

![](/images/elfbot-ui-global-env-vars.png)

Provides an option to bulk export/import your environment variables, an necessary step when migrating between datacenters.

![](/images/elfbot-ui-global-env-vars-details.png)

#### Broken Symlink Report

![](/images/elfbot-ui-broken-symlink-report.png)

Uses filesystem tools to identify broken symlinks, and generate a report.

#### Delete Broken Symlinks

![](/images/elfbot-ui-delete-broken-symlinks.png)

Uses the same logic as the symlink report to delete matching, broken symlinks

![](/images/elfbot-ui-delete-broken-symlinks-confirm.png)

#### Backup All Apps

Triggers a restart-and-backup of all apps. The backups will be stored in your `/backups` volume, and be downloaded or moved elsewhere using [FileBrowser][filebrowser].

#### Backup Symlinks

Unlike apps (above) this option triggers a backup of all your symlinks. There's no user-facing option to restore these (*admin intervention would be required*), but it's occasionally a useful safeguard when migrating between tools.

#### Backup Offsite

Triggers an immediate offsite backup (*usually these run every 24 hours*). Usually used in combination with bulk ENV var exports to prepare for a datacenter migration.

#### How to manage symlinks

If you've attached read-only external storage, which is managed outside of your ElfHosted tools (*[Real-Debrid][real-debrid] with [Debrid Media Manager](https://debridmediamanager.com/), for example*), then you may find that you have content in `/storage/<provider>` which you can't change (*rename, move, organize, etc*).

This read-only content can be cumbersome to manage via [Radarr][radarr] / [Sonarr][sonarr] for example, which require read/write access to rename files, delete old files on quality upgrade etc.

ElfBot can help with this by creating a symlink to the remote content, in `/storage/symlinks/import/`. You can then manipulate this symlink as if it's a regular file (*rename, move into subfolders, etc*), but when accessed, it'll point to the original (*read-only*) content.

#### Manually creating symlinks

To perform a symlink import, use [ElfTerm][elfterm] to run `elfbot symlink <path to read-only storage>`, or navigate using FileBrowser to a specific folder, and run `elfbot symlink here` to import from the current directory specifically. 

ElfBot will symlink any **new**  content in the target directory to `/storage/symlinks/import/<directory>`. After this, you point the Aars at the `/storage/symlinks/import/` path, and tell them to perform an interactive import.

For app-specific details, see:

* [Radarr](/app/radarr/#import-existing-remote-media)
* [Sonarr](/app/sonarr/#import-existing-remote-media)

ElfBot keeps track of the content it's already symlinked - it won't re-create a symlink which you've already created, and then moved/renamed elsewhere. If you'd like to wipe ElfBot's memory, and recreate **all** symlinks, then delete the `/storage/symlinks/.symlinks_cache` folder!

#### Automatically creating symlinks (blackhole)

Another way to manage the importing of symlinks is to create a "Usenet Blackhole" downloader in Radarr/Sonarr, and then have ElfBot import your downloads directly into that folder, for the Aars to scrape. "Blackholed" imports work a little differently to symlink imports, in that the parent folder is not recreated within the blackhole target, but the contents of the current path in filebrowser are symlinked directly into the target.

For example, navigating to `storage/realdebrid-zurg/shows/My Favorite Show - Season 1`, and running `elfbot blackhole sonarr`, will result in all files **under** `storage/realdebrid-zurg/shows/My Favorite Show - Season 1` being symlinked into `/storage/symlinks/blackhole/sonarr/` (*and subsequently "sucked up" by Sonarr, if it's configured*)

See Aar-specific details here:

* [Radarr](/app/radarr/#import-existing-remote-media)
* [Sonarr](/app/sonarr/#import-existing-remote-media)

--8<-- "common-links.md"