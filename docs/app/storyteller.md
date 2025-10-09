---
title: 🧝 Hosted AudioBookshelf 🎧
slug: Storyteller
upstream: https://storyteller-platform.gitlab.io/storyteller/
sponsorship: 
- name: Open Collective
  uri: https://opencollective.com/storyteller
links:
- name: GitLab Repo
  uri: https://gitlab.com/storyteller-platform/storyteller
- name: Discord server
  uri: https://discord.gg/KhSvFqcrza
- name: App (Google Play)
  uri: https://play.google.com/store/apps/details?id=dev.smoores.Storyteller
- name: iOS app
  uri: https://apps.apple.com/us/app/storyteller-reader/id6474467720
title: Storyteller
description: Storyteller is a platform for automatically aligning ebooks and audiobooks for immersive reading, with native Android / iOS apps
---

# {{ page.meta.slug }}

Storyteller is a platform for automatically aligning ebooks and audiobooks for immersive reading, with native [Android](https://play.google.com/store/apps/details?id=dev.smoores.Storyteller) / [iOS](https://apps.apple.com/us/app/storyteller-reader/id6474467720) apps.

{% include 'app.md' %}

### Align your audiobooks and ebooks

Switch back and forth between listening and reading without losing your place, or have Storyteller read aloud to you while highlighting the text!

### Read or listen however you choose

Storyteller produces EPUB 3 compliant ebook files. You can read them with any ebook reader (software or hardware!) that supports EPUB Media Overlays, or you can use the dedicated Storyteller mobile apps.

{% include 'app_access.md' %}

## How to use Storyteller

### Set STORYTELLER_SECRET_KEY

Storyteller uses the `STORYTELLER_SECRET_KEY` environment variable to secure its authentication. While we provide a strong default, that default is applied to all users, and so you should reset your key before you configure Storyteller.

To set your `STORYTELLER_SECRET_KEY`, generate a strong random string using or [1Password's online random password generator](https://1password.com/password-generator/), or by running `openssl rand -base64 32`

``` title="Quick-paste into StoryTeller's environment variables using ElfBot"
STORYTELLER_SECRET_KEY=<your string here>
```

Storyteller will restart, and you can now proceed to setup your admin account.

### Transcription services

ElfHosted's Storyteller instances are limited to 1 CPU core, since our platform is not optimized for bulk transcoding activities. The transcription of an audiobook will therefore be **very** slow.

A viable alternative is to use a cloud transcription service - indicative prices are below:

| Provider                         | Rate per Minute | Estimated Cost (600 mins) | Notes                                                                 |
|----------------------------------|-----------------|---------------------------|-----------------------------------------------------------------------|
| **OpenAI Whisper API**           | $0.006          | $3.60                     | Cost-effective; charges per second.                                  |
| **Google Cloud Speech-to-Text**  | $0.016          | $9.60                     | V2 API pricing; billed in 15-second increments.                      |
| **Amazon Transcribe**            | $0.024          | $14.40                    | Tier 1 pricing; up to 250,000 minutes.                               |
| **Azure Cognitive Services**     | $0.003          | $1.80                     | Batch transcription; billed per second.                              |
| **Deepgram**                     | $0.015          | $9.00                     | Pay-as-you-go pricing; offers $200 free credit for new users.        |



{% include 'app_footer.md' %}