---
title: Seamless Plex / Debrid automation with Riven
slug: Riven
description: Riven is a WIP rewrite of plex_debrid, supporting Plex torrent streaming through Real Debrid and 3rd party services like Overseerr, Mdblist, etc.
upstream: https://github.com/rivenmedia/riven
sponsorship:
- uri: https://github.com/dreulavelle
  name: GitHub Sponsors
links:
- name: Discord
  uri: https://discord.gg/wDgVdH8vNM
- name: project board
  uri: https://github.com/users/dreulavelle/projects/2
- name: GitHub repo
  uri: https://github.com/rivenmedia/riven
---

# {{ page.meta.slug }}

Riven is a re-imagining of original functions of [plex-debrid][plex-debrid], enabling Plex-based torrent streaming through Real Debrid and 3rd party services like Overseerr, Mdblist, etc.

!!! warning "Riven is also BETA software :scientist:"
    Be aware that Riven is under active, ongoing development. It’s suited to technical users who like to get “under the hood”, and enjoy tinkering on the “bleeding edge”, but it’s not a set-and-forget solution (yet!). Users seeking a simple, no-touch solution are encouraged to opt for the slow-and-steady Aarrs or [cli_debrid][cli-debrid] instead!

## How to use it

<iframe width="560" height="315" src="https://www.youtube.com/embed/ZHZAEhLuJqk?si=t5HJ5RT8UOfDDuXs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Unlike most ElfHosted apps, Riven is (currently) split into two - the frontend, and the backend:

### Meet the frontend UI

A lot of progress has been made on the frontend UI! It can be used for the entire on-boarding process, with the exception of the quality/ranking settings. These settings are currently configuired in the `settings.json` file found in `config/riven via [FileBrowser][filebrowser]. All of the other settings can be directly modified with the frontend UI, in addition to a number of Riven functions.

### Meet the backend

The Riven backend is what's functionally complete. On the backend, you'll see the logs displayed as Riven searches for your content, adds it to your RealDebrid library, symlinks it to `/storage/symlinks`, and updates Plex accordingly

![](/images/riven-backend.png)

To restart the backend, hit `CTRL-C` once in the ttyd/browser UI to terminate the process, and then hit `Enter` to reconnect to the session and watch it restart.

### Minimum requirements

At a minimum, Riven requires:

* [x] Your RealDebrid API key
* [x] A [claimed][elfbot] [Plex][plex] server
* [x] A [Plex token][plex-token]

And optionally, Riven will work with:

* [ ] An [Overseerr][overseerr] instance, for managing media requests
* [ ] A [Jackett][jackett] instance, to provide additional content scraping targets
* [ ] A [Prowlarr][prowlarr] instance, to provide additional content scraping targets
  
### Basic setup

#### Zurg

First and formost, you **must** first setup Zurg before any setup can be completed with Riven itself. 

1. Retrive your Real-Debrid API token via [their website](https://real-debrid.com/apitoken).
2. Navigate to Zurg's `config.yml` file found in `config/riven` via [FileBrowser][filebrowser].
3. Add your Real-Debrid token Zurg's `confiig.yml` file and save your changes.
4. Restart Zurg, either by using the Elfbot command `elfbot restart realdebird-zurg` or by deleting the pod for Zurg via [Kubernetes][kubernetes].

#### Plex

**Claim your Plex server:**

* See [this guide][plex-token] for instructions regarding claiming your Plex token.

**Create your Plex libraries:**

Using the Plex button on your Dashboard, go to your newly claimed Plex server.

1. Create a library for you Movies and set the path to `/storage/symlinks/movies/`.
2. Create a library for you TV Shows and set the path to `/storage/symlinks/shows/`.
   ***NOTE:*** *Make certain you are not enabling any of the features to generate thumbnails or intro/credit detection.*

#### Overseerr

  ***NOTE:*** *Some of the Overseerr setup is already done by default for new installations or following a reset of the Overseerr app.*

To integrate Overseerr with Riven, first setup Overseerr to integrate with Plex, and then...

1. Configure a webhook pointing to `http://riven:8080/webhook/overseerr`:

![](/images/riven-overseerr-2.png)

2. Enable your webhook for `Request Automatically Approved` and `Request Approved`:

![](/images/riven-overseerr-3.png)

3. Retrieve your Overseerr API key, which will be used in Riven:

![](/images/riven-overseerr-1.png)

#### Riven Frontend UI

To perform a basic Riven setup, use the frontend, and navigate to Settings:

![](/images/riven-settings-1.png)

**General Settings**
1.  Enable your chosen option in the `Downloaders` section.
2.  Input your API key for that downloader.
3.  Save your changes.
  
![](/images/riven-settings-2.png) 

**Media Server Settings**
1.  Enable `Plex Updater` in the `Updaters` section.
2.  Authenticate your Plex server within the `Plex Token` section.
3.  Save your changes.

![](/images/riven-settings-3.png)

**Content**
1.  Enable your preferred options (you must choose at least one) in the `Content Providers` section.
    *Please see the `Content Request Providers` sections found below.*
2.  Apply the relevant settings.
3.  Save your changes.

![](/images/riven-settings-4.png)

**Scrapers**
1.  Enable `Torrentio`, `Knightcrawler`, `Annatar`, `Mediafusion`, and `Zilean`. (up to you if you want use others)
2.  Enable `Ratelimit` for all scrapers.
3.  Save your changes.
  
![](/images/riven-scrapers-3.png)

**Ranking**
##### **Note:** *These settings will soon appear in the Riven frontend UI. Currently, these settings are configuired in the `settings.json` file found in `config/riven` via [FileBrowser][filebrowser].*

### Quality Rankings and Settings

Please refer to these guides:

* [**Frequently Asked Questions**](https://dreulavelle.github.io/rank-torrent-name/users/faq/)
* [**Language Support**](https://dreulavelle.github.io/rank-torrent-name/users/languages/)
* [**Quality Profiles**](https://dreulavelle.github.io/rank-torrent-name/users/profiles/)

### Content Request Providers *(you must choose at least one)*

#### Plex Watchlist

1. Navigate to the Watchlist section of your Plex Media Server settings.
  ```
  https://<username>-plex.elfhosted.cc/web/index.html#!/settings/watchlist
  ```
2. Copy the appropriate washlist RSS feed link(s)
3. Enable `Plex Watchlist` within the Riven frontend UI `Content` section of its settings.
4. Add the RSS feed link(s) to the `Plex Watchlist Rss` setting.
5. Save your changes.

#### Overseerr

1. Retrieve your Overseerr API key:

![](/images/riven-overseerr-1.png)

2. Enable `Overseerr` within the Riven frontend UI `Content` section of its settings.
3. Apply the relevant settings:
  - The Overseerr URL is `http://overseerr:5055`
  - Add your Overseerr API key.
  - Enable the `Use Webhook` setting.
4. Save your changes.
  
#### Trakt

1. Visit the [**Create a Trakt API app**](https://trakt.tv/oauth/applications/new) page.
2. Name it whatever you like.
3. For `Redirect uri:` use the default value of `urn:ietf:wg:oauth:2.0:oob`.
4. `Description:`, `Javascript (cors) origins:`, and `Permissions:`can be left blank/default.
5. Click on `SAVE APP`.
6. Enable `Trakt` within the Riven frontend UI `Content` section of its settings.
7. Apply the relevant settings:
  - Use the `Client ID:` provided is your `Trakt Api Key`.
  - The various Trakt functions are optional, but you should enable one or more of them if you wish to use Trakt with Riven.
8. Save your changes.

That's it, a minimal configuration! :partying_face: Now load the backend, and watch the magic! :magic_wand:

{% include 'app_footer.md' %}
