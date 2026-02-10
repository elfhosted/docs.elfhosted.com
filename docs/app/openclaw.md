---
title: Elf Hosted OpenClaw 🦞
slug: OpenClaw
description: Your own AI agent, plumbed into a huge array of skills and providers. Make it your own!
upstream: https://openclaw.ai/
links:
- name: Discord
  uri: https://discord.com/invite/clawd
- name: Documentation
  uri: https://docs.openclaw.ai/getting-started
---

# {{ page.meta.slug }}

A specialized tool for managing anime, organizing media using AniDB, the authoritative record for anime information.

{% include 'app.md' %}
{% include 'app_access.md' %}

## How do I use it?

Since user configurations with OpenClaw can vary wildly, and the tooling is evolving rapidly, we will just explain below how to use the ElfHosted platform to manage your OpenClaw.

ElfHosted OpenClaw has both a web UI and a CLI UI, both of which are linked to your dashboard, as "OpenClaw" and "OpenClaw CLI".

Further, to watch OpenClaw's gateway logs, you can either use the OpenClaw UI, or watch the pod logs using [ElfBot][elfbot].

Any contents in `/home/node/.openclaw` (from OpenClaw's perspective) can be managed in [FileBrowser][filebrowser], at `config/openclaw/`

### Onboarding

The simplest way to get started with OpenClaw is to launch OpenClaw CLI, and run `openclaw onboard`, and follow the TUI prompts.

{% include 'app_footer.md' %}