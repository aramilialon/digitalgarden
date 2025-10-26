---
title: My personal lab
status: wip
---
# My personal lab

## Introduction
Yep, from time to time I need to develop things... Ok, I don't wanna fool anyone, I need to try things just for the pleasure to do so from time to time, so I need a mini lab somewhere :P
So starting from that need I wanted to have somewhere a small virtualization farm in order to.... Well, have fun ;)

## Tools
Currently my personal lab is pretty simple, made with:

* [Intel NUC](https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/nuc-kit-nuc7i3dnke-nuc7i3dnhe-board-nuc7i3dnbe-brief.pdf)
    * **CPU**: Intel(R) Core(TM) i3-7100U @ 2.4Ghz
    * **RAM**: 2x16GB sticks
    * **SSD**:
        * 1x Samsung SSD 970 EVO Plus - 1TB
        * 1x SEAGATE ST1000LM024 - 1TB
    * **OS**: Debian 13 (Trixie) + Proxmox CE 9.0.11
* [Mikrotik RB4011iGS+5HacQ2HnD](https://mikrotik.com/product/rb4011igs_5hacq2hnd_in)

## Networking

_TODO: describe the network configuration_

## VMs

* **Pihole**: a simple Pihole installation because.... Why not?
* **Proxy**: since my provider is kind enough to provide me a static IP address, why not use it to publish something from here instead of using cloud resources?