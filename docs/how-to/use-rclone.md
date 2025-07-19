---
title: How to use rclone
description: How to use rclone to mount your cloud storage
---

# How to use rclone

ElfHosted provides storage for users' application data, but user content provided by attaching users' existing cloud / debrid / network storage (*exceptions are RealDebrid, AllDebrid, and DebridLink, for whom dedicated mount products are built in*).

Here's a video illustrating how to do rclone mounts:

<iframe width="560" height="315" src="https://www.youtube.com/embed/wp6z0zTXkOI?si=sD80tgoA21xihOsb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Meet the tools

### RcloneUI

[RcloneUI][rcloneui] is the native UI provided by Rclone. It offers a beginner-friendly interface to configuring "configs" or "remotes" (*what rclone calls your remote storage volumes*). 

RcloneUI's most important task for us is the UI-driven configuration of remotes.

It does also allow simple drag/drop transfer of files to/from remotes, but lacks the ability to **stop** a transfer.

![Screenshot of Rclone UI](/images/screenshots/rcloneui.png){ loading=lazy }

### RcloneFM

[Rclone FM][rclonefm] ("File Manager") is an alternative rclone web UI. You can't use it to configure remotes (*use [RcloneUI][rcloneui] for this*), but you can use it for simple side-by-side filemanager-type operations.

![Screenshot of Rclone FM](/images/screenshots/rclonefm.png){ loading=lazy }

!!! warning
    Rclone FM maintains its own queue which you can manage (*even deletes are queued*), but be aware that this queue persists only in your browser tab, and closing the tab will cause you to loose the queue. The active transfer will still complete though.

## Setup config

### Setup remote (Rclone UI)

Launch [RcloneUI][rcloneui] from your dashboard, and login (*any user/pass will work*):

Create a new config for your provider. Name your remote (*can be anything, but make it sensible because it'll be the file path to your content*), and choose your provider type:

![Screenshot of Rclone UI adding new remote step 1](/images/rcloneui-example-1.png){ loading=lazy }

Enter your provider-specific details. Refer to the [rclone docs](https://rclone.org/overview/) for help:

![Screenshot of Rclone UI adding new remote step 2](/images/rcloneui-example-2.png){ loading=lazy }

RcloneUI will automatically take you to the "Explorer" window. Type the name of your new remote, and click "Open" to test that it's working correctly.

![Screenshot of Rclone UI adding new remote step 3](/images/rcloneui-example-3.png){ loading=lazy }

If you can see your files, it's setup! If not, go back to "Configs" and edit it until you **can** see your files.

## Magic Mounting 🪄

Primarily, users want to permanently mount their network storage using rclone. ElfHosted will automatically mount any configured "remote" ("config") into `/storage/rclone/<remote name>`, visible to all your apps.

If you change the parameters of a mount (*say, you need to fix the credentials*), you may need to restart rcloneui with [ElfBot][elfbot] for the changes to apply

### Mounting via SSH

When setting up an SSH remote, it's not possible to specify a non-default path in the remote config - rclone expects you to pass this path as part of the `rclone mount` command, which we don't do.

A workaround for this scenario is to create your SSH remote like thi, and to use `sftpalias` as the intended remote:

```
[sftpbase]
type = sftp
host = sftp.example.com
user = myuser
pass = <encrypted>

[sftpalias]
type = alias
remote = sftpbase:/desired/default/path
```

--8<-- "common-links.md"