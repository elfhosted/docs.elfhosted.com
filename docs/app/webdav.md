---
title: Migrate your data using WebDAV
slug: WebDAV
description: Migrate data to / from ElfHosted using WebDAV
upstream: https://rclone.org/commands/rclone_serve_webdav/
---

# {{ page.meta.slug }}

You can use SFTP / FTP / WebDAV to move data in and out of a [Hetzner Storagebox][storagebox], relying only on Hetzner's infrastructure, and bypassing the ElfHosted infrastructure. 

However, to bulk-transfer files to / from [ElfStorage][elfstorage], you'll need something a little more robust than [Filebrowser][filebrowser], so we've added a product which exports **all** your storage (*including Storageboxes and rclone mounts*) using WebDAV.

[Get ElfHosted {{ page.meta.slug }}" :magic_wand:](https://store.elfhosted.com/product/webdav/){ .md-button .md-button--primary }

If you purchase a standalone WebDAV Export, you'll be prompted to choose an initial password (*bundled users are not prompted*), by running ` Your username is preset to your existing, ElfHosted, username. Your WebDAV url will be `https://<username>-webdav.elfhosted.com`

You can reset your password using [ElfBot][elfbot], like this:

``` title="Quick-paste into WebDav's environment variables using ElfBot"
WEBDAV_PASSWORD=yoursekritpassword
```

You can test the above with a web browser, but for robust file transfer, use one of the options below:

## Desktop File Manager

You'll want to tell your file client (*i.e. Windows Explorer or MacOS Finder*) to open `https://<username>-webdav.elfhosted.com` (*customized for your own username*), and enter your credentials when prompted.

Here are generic instructions for [Windows](https://windowsloop.com/map-webdav-drive-in-windows-10/) and [MacOS](https://support.apple.com/en-nz/guide/mac-help/mchlp1546/mac).

!!! warning "Windows being windows"
    Per the [rclone docs](https://rclone.org/commands/rclone_serve_webdav/#access-webdav-on-windows), to make WebDAV work with basic auth (which is what we're doing), you need to get your hands a little dirty, tinkering with the registry!

## Rclone

If you're more comfortable on the command line, or wanting to run long, batch transfers, then using rclone directly may be more suitable.

### CLI 

[Install Rclone](https://rclone.org/install/) on your local desktop, and create a new WebDAV remote using `rclone config`, like this:

```bash
[elfhosted]
type = webdav
url = https://<username>-webdav.elfhosted.com
vendor = other
user = <your elfhosted username>
pass = <your chosen webdav password>
```

Now you can treat `elfhosted:` just like any other rclone remote. Run `rclone ls elfhosted:` to confirm.

### Web UI

[Install rclone](https://rclone.org/install/), and fire up the UI, using 
`rclone rcd --rc-web-gui --rc-user=<pick a user> --rc-pass=<pick a pass>`

The web-gui should now be available at the url http://localhost:5572 - login using the credentials you picked above.

Either configure the remote via CLI as above, or use the UI to configure a similar WebDAV remote.

Use the Explorer interface to upload/download from ElfHosted.

## Expected speed

Note that our WebDAV share is rate-limited to ~5MB/s, or 40Mbit, outgoing, which represents 4% of our total 1Gbps per-node bandwidth. This restriction is in place in order to prioritize more realtime traffic over batch transfers.

A prioritized, higher-rate-limited WebDAV instance [is also available](https://store.elfhosted.com/product/webdav-access-plus), with speeds of up to 150Mbps or ~20MB/s.

--8<-- "common-links.md"