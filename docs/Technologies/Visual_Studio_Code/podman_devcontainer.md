---
title: Podman & DevContainers
status: wip
---
# Podman & Dev Containers: when someone overcomplicates a problem...

I sometimes tend to overcomplicate problems u.u

## Key points:
* Install Podman Desktop
* Make sure that everything is working
* Make changes to VSCode in order to make it using Podman instead of Docker
* Miscellaneus topics

## Install Podman Desktop
Well, the installation process should be pretty straight forward.... Go to Podman Desktop website ([Link](https://podman-desktop.io/)), download the software and install it.
<div class="image-article"><img src="https://stdigitalgardenmaggiolon.blob.core.windows.net/maggiolonetimages/2025/10/14/easy-peasy-lemon-squeezy-lettering-design-greeting-banners-mouse-pads-prints-cards-post_862129-836.jpg"></div>
Then launch Podman Desktop and follow the instruction to configure Podman itself, Kubectl and Compose, aka the main tools that will allow you 

## Docker compability

Not sure if necessary (some says yes, some others says no), therefore I configure it anyway.
Go in Settings -> Preferences -> Docker Compability and enable it:
<div class="image-article"><img src="https://stdigitalgardenmaggiolon.blob.core.windows.net/maggiolonetimages/2025/10/26/20251026-Docker_compability.png"></div>

## Make sure that everything is working
Also this one should be pretty straight forward: launch Podman desktop and if you see this:

<div class="image-article"><img src="https://stdigitalgardenmaggiolon.blob.core.windows.net/maggiolonetimages/2025/10/15/Screenshot_2025-10-15_at_23.12.42.png"></div>

And to make sure that the docker compability layer has been enabled, go to Settings -> Docker Compability, you should see something like this:
<div class="image-article"><img src="https://stdigitalgardenmaggiolon.blob.core.windows.net/maggiolonetimages/2025/10/26/20251026-Docker_compability_enabled.png"></div>

If everything is like this it means that everything is working propertly!
Otherwise... Let the curse party begin! XD

## Make changes to VSCode in order to make it using Podman instead of Docker

Simplicity is the key: just change a couple of references in the Settings:
``` json title="settings.json"
    "dev.containers.dockerComposePath": "podman-compose",
    "dev.containers.dockerPath": "podman",
```
And voila', everything should be working!
If you want to test that everything is working, just spawn a test environment 

## Miscellaneus topics
