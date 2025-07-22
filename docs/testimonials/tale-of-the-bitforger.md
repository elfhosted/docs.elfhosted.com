---
title: The Tale of the Bitforger (The Gospel of Puks) 
---

# The Tale of the Bitforger (The Gospel of Puks) 

(*This is an anonymized origin story, originally posted in [#elf-origins](https://discord.com/channels/396055506072109067/1394791429854728263/1394802978245972120) in Discord*)

---

In the beginning, there was only chaos. And Google Drive.

I was deep in the hoarding life—rclone mounts, unionfs overlays, mergerfs madness. I danced with [Plex][plex] and wrestled with [Sonarr][sonarr] in the dead of night. Unlimited GDrive was my kingdom, and I ruled it with cron jobs and bash scripts.

Until Google turned off the tap.

One by one, my Team Drives vanished. Plex started spinning forever on “Preparing metadata…” and I knew—I had flown too close to the sun.

So I did what every desperate hoarder does. I dug into the closet and cobbled together a backup rig: dusty NUC, half-dead spinning rust, and a Docker stack that looked like a Lovecraftian horror story.

It limped along… for a while.

Then summer came.

I was a thousand miles from home on a week-long volunteer project, building trails, hauling rocks, living the unplugged life. No SSH. No rescue. Just sweat, sunscreen, and good people.

That’s where I met [Puks](https://savvyguides.wiki/).

We were stacking logs when he casually mentioned he used to self-host too. I told him about my setup, the crash, the notification that ruined my hike—“disk failure”—and how I couldn’t do a thing about it.

Puks chuckled.

“Dude… you still do all that yourself?”

“Yeah,” I muttered, ashamed. “Well, I did. It’s probably on fire by now.”

“That’s your first mistake,” he said. “You heard of ElfHosted?”

I hadn’t.

So that night, under the stars, Puks told me the tale: a setup powered by Real-Debrid, automated end-to-end. [Radarr][radarr] pulls the release, it gets downloaded, scanned into Plex, and ready to stream in under a minute. No mounts. No containers. No cryptic logs at 2am.

So I clicked the glowing link: [elfhosted.com](https://store.elfhosted.com)

15 minutes later, I’m running lean. My RD library is massive. Stremio saves the day. No NUCs, no Docker stacks, no fire drills. I just open the app, and it’s there.

--8<-- "common-links.md"