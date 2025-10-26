---
status: draft
title: Automating Certbot with Azure DNS zones
---
# Azure Public DNS Zones & Certbot: yeeeeah......

## Introduction
Because I'm lazy, I want to try to automate Certbot as much as possible in order to fully automate the renewal and applications on a proxy (and subsequent servers eventually).
The idea therefore is to:

* [Install apache and certbot](#install-apache-and-certbot)
* [Create the DNS zones using CNAME structure](#create-the-dns-zones-using-cname-structure)
* [Configure certbot to use Azure](#configure-certbot-to-use-azure)
* [See everything in action](#see-everything-in-action)

_A small detail:_ everything is written for Debian, in case of other distro... Well... Look for yourself or start using the **right** distro :squinting-face-with-tongue:

## Install apache and certbot

Easy then ever:
``` bash
apt-get install -y apache2 python3-certbot-apache pipx
pipx install certbot certbot-dns-azure --include-deps
```
Once the commands ran, you should have installed Apache with its default page and certbot

## Create the DNS zones using CNAME structure

``` mermaid
sequenceDiagram
    participant Proxy
    participant Let's Encrypt
    participant maggiolo.net
    participant acmechallange.maggiolo.net
    Proxy->>acmechallange.maggiolo.net: TXT _acme-challange.digitalgarden.maggiolo.net.acmechallange.maggiolo.net <VALUE>
    acmechallange.maggiolo.net-->>Proxy: <Done>
    #destroy Proxy
    Let's Encrypt->>+maggiolo.net:TXT _acme-challange.digitalgarden.maggiolo.net
    maggiolo.net->>+acmechallange.maggiolo.net:TXT _acme-challange.digitalgarden.maggiolo.net.acmechallange.maggiolo.net
    acmechallange.maggiolo.net-->>-maggiolo.net:<VALUE>
    maggiolo.net-->>-Let's Encrypt:<VALUE> 
```

## Configure certbot to use Azure

### Sources
* [Configuration of Certbot using Azure DNS](https://docs.certbot-dns-azure.co.uk/en/latest/)

## See everything in action

