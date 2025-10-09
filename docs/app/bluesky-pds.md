---
title: Elf Hosted Bluesky Personal Data Server (PDS)
slug: Bluesky-PDS
description: Bluesky PDS (Personal Data Server) is "your" Bluesky server, seamlessly federating with the larger network while securely storing your content and account, fully under your control
upstream: https://github.com/bluesky-social/pds
links:
- name: GitHub
  uri: https://github.com/bluesky-social/pds
- name: AT Protocol PDS Admins Discord
  uri: https://discord.gg/e7hpHxRfBP
---

# {{ page.meta.slug }}

Bluesky is an ambitious federated social network initially supported by Twitter, but is an independent public benefit corporation as of 2022 ([Wikipedia](https://en.wikipedia.org/wiki/Bluesky))

The network is federated with the ATProtocol, which allows all participating users to communicate through a series of relays, whether their account is "on" the primary bsky.social server, or on their own, independently-managed data server instance.

A Personal Data Server (PDS) is a small server which is the "home" for one or more accounts, and serves to manage all their data storage, "distributing" the data separately from the other components of the network (*relaying, scraping, etc*), and giving users control of the presentation and storage of their data.

{% include 'app.md' %}
{% include 'app_access.md' %}

!!! warning "Here be geeks"
    The Bluesky PDS stack in ElfHosted is experimental - we built it because we like playing with it. Users should be aware that this is a hosted implementation of the reference design, and while ElfHosted provides the **infrastructure** hosting, we can't provide support for your **use** of PDS outside ensuring that it's running, reachable, backed-up, and secure!

## How to setup PDS

PDS is configured using environment variables. In ElfHosted's configuration, environment variables are created either one-at-a-time using [ElfBot][elfbot], or in-bulk, using [Kubernetes Dashboard][kubernetes-dashboard] to edit the corresponding `elfbot-bluesky-pds` ConfigMap.

### Secure your instance

There are 3 values you need to set to properly secure your instance. Placeholders are configured to allow the app to start without error, but you should replace these and reset all data before continuing.

Values to be configured are:

* `PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX`: Generate a suitable value with openssl
* `PDS_JWT_SECRET`: use a strong password
* `PDS_ADMIN_PASSWORD`: use a strong password

The values can be applied using ElfBot, as follows:

``` title="Quick-paste into BlueSky PDS's environment variables using ElfBot"
PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX=bb1ed941a5a004f007441bd5bb297002f4e533fadba48e429f8350249315cf0c
PDS_JWT_SECRET=changemeelfie
PDS_ADMIN_PASSWORD=changemeelfie
```

After setting all 3 values, remove any existing databases / config, by doing a reset on BlueSky PDS, using ElfBot

### Setup email

Your PDS instance will need to be able to send emails in order to validate accounts (*unless you do some dirty log-file scraping*), so before creating an account, ensure that you've setup email per [the documentation](https://github.com/bluesky-social/pds?tab=readme-ov-file#setting-up-smtp)

!!! alert "Port 25 and 465 are blocked"
    Our datacenter blocks egress access on ports `25` and `465`, so ensure that your email configuration uses alternate ports. In the MailGun example below, port `587` works!

The following example sets:

* SMTP username: `bsky@mg.funkypenguin.co.nz` (*URL-encode @ signs if your username includes it*)
* SMTP password: `password`
* SMTP protocol: `smtp` (*not smtps, since we're using port 587*)
* SMTP host: `smtp.mailgun.org`
* SMTP port: `587`
* SMTP from address: `bsky@mg.funkypenguin.co.nz` (*same in this case but yours may be different*)

``` title="Quick-paste into BlueSky PDS's environment variables using ElfBot"
PDS_EMAIL_SMTP_URL=smtp://bsky%40mg.funkypenguin.co.nz:password@smtp.mailgun.org:587
PDS_EMAIL_FROM_ADDRESS=bsky@mg.funkypenguin.co.nz
```

Paste each elfbot command in, one-at-a-time. PDS will restart after each entry.

### Create account

The `pdsadmin` tool is included in the PDS CLI, linked to your ElfHosted dashboard. 

From the CLI, run `pdsadmin account create` to create your first account, and note the resulting identity, password, and DID.

``` title="Example account creation"
> pdsadmin account create
Enter an email address (e.g. alice@funkypenguin-bluesky-pds.elfhosted.com): test1@funkypenguin-bluesky-pds.elfhosted.com
Enter a handle (e.g. alice.funkypenguin-bluesky-pds.elfhosted.com): test1.funkypenguin-bluesky-pds.elfhosted.com

Account created successfully!
-----------------------------
Handle   : test1.funkypenguin-bluesky-pds.elfhosted.com
DID      : did:plc:ru2ohvq7uu3l5bhh5yx3mkvy
Password : <redacted>
-----------------------------
Save this password, it will not be displayed again.

elfie@funkypenguin-blueskypds-664564cd86-hmkq6 ~> 
```

### Change identifier

Your DID is your unique identifier on the Bluesky network, but you'll want to setup your "handle", which is easier to remember, looks better, and can be changed without changing your DID. 

Your handle can be any supported hostname, separate from your PDS server URL.

You'll need your own domain name for this part - your [identity needs to be a valid hostname](https://atproto.com/specs/handle), and you need to "prove" this by either a DNS TXT entry, or a .well-known HTTP path. 

The only supported method within the ElfHosted infrastruture is a DNS entry, so for every identity your PDS hosts, you need to create a TXT record `_atproto.<your identifier>`, with a value of `did=<your did>`. For example:

```
_atproto.batman.batcave.org: did=did:plc:z72i7hdynmk6r22z27h6tvur
```

Confirm the TXT record is created successfully using `dig txt +short <DNS recrod>`, as illustrated below:

```
dig txt +short _atproto.batman.batcave.org                                  
"did=did:plc:ru2ohvq7uu3l5bhh5yx3mkvy"
~ ❯
```

Once the DNS entry is added, either wait for the bluesky infrastruture to recognize the update, or try to force it using `pdsadmin request-crawl bsky.network` in the CLI.

### Setup object storage

!!! question "Why use object storage?"
    You may want to migrate your PDS off of ElfHosted in the future. Although you **could** simply store all your media content within your ElfHosted `/config` storage, this can (1) run out of space, and (2) be slow and time-consuming to relocate if you migrate. If you configure PDS for object storage however, then all the media is **already** on object storage under your control, and doesn't need to be migrated alongside your databases / account data.

PDS can use either local storage or S3 storage, but it won't do both, so in order to use object storage, you need to disable local storage, by setting `PDS_BLOBSTORE_DISK_LOCATION` to null, using `PDS_BLOBSTORE_DISK_LOCATION=`

Then apply the following with your own object storage config, to transition to object storage:

``` title="Quick-paste into BlueSky PDS's environment variables using ElfBot"
PDS_BLOBSTORE_DISK_LOCATION=''
PDS_BLOBSTORE_S3_BUCKET=bucket_name
PDS_BLOBSTORE_S3_REGION=us-east-1
PDS_BLOBSTORE_S3_ENDPOINT=https://s3.us-east-1.amazonaws.com
PDS_BLOBSTORE_S3_FORCE_PATH_STYLE=true
PDS_BLOBSTORE_S3_ACCESS_KEY_ID=secret
PDS_BLOBSTORE_S3_SECRET_ACCESS_KEY=secret
```

### Logs

PDS is configured by default with `LOGS_ENABLED=true`, so in order to see what it's doing, simply using Kubernetes Dashboard to watch the logs of your bluesky-pds pod.

### Updates

In ElfHosted's environment, PDS updates are automatically grabbed every time a [new PDS release is published](https://github.com/bluesky-social/atproto/releases?q=pds&expanded=true), and are rolled out during our daily "elf-glowup" maintenance window.

No manual updating is required.

### Backup / migrate

Your PDS data is stored in `config/bluesky-pds`, and can be backed up either by copying the contents of the folder manually, or running `elfbot backup bluesky-pds` using [ElfBot][elfbot].

{% include 'app_footer.md' %}