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

_A small detail:_ everything is written for Debian, in case of other distro... Well... Look for yourself or start using the **right** distro :smile:

## Install apache and certbot

Easy then ever:
``` bash
apt-get install -y apache2 python3-certbot-apache pipx
pipx install certbot certbot-dns-azure --include-deps
```
Once the commands ran, you should have installed Apache with its default page and certbot

## Create the DNS zones using CNAME structure

The idea is to have a third-level domain that will be modified by certbot (authorized via an [application registration](https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-register-app)) and, in the main domain, a bunch of CNAMEs that redirect to the third-level domain in order to obtain this behavior:

``` mermaid
sequenceDiagram
    Let's Encrypt->>+maggiolo.net:TXT _acme-challange.digitalgarden.maggiolo.net
    maggiolo.net->>+acmechallange.maggiolo.net:TXT _acme-challange.digitalgarden.maggiolo.net.acmechallange.maggiolo.net
    acmechallange.maggiolo.net-->>-maggiolo.net:<VALUE>
    maggiolo.net-->>-Let's Encrypt:<VALUE> 
```
(here I have used this domain website as example, the real domains _might_ be different)

In my environment everything is done via Terraform (and for Azure using the [AVM](https://azure.github.io/Azure-Verified-Modules/indexes/terraform/) modules), so those are the configuration:

``` terraform title="acmechallenge.maggiolo.net"
module "acmechallenge_maggiolo_net_dns" {
    source              = "Azure/avm-res-network-dnszone/azurerm"
    name                = "acmechallenge.maggiolo.net"
    resource_group_name = module.avm-res-resources-resourcegroup.name
    tags                = var.tags
}
```

``` terraform title="maggiolo.net"
module "maggiolo_net_dns" {
    source              = "Azure/avm-res-network-dnszone/azurerm"
    name                = "maggiolo.net"
    resource_group_name = module.avm-res-resources-resourcegroup.name
    # [...]
    ns_records          = {
        # [...]
        "acmechallenge_maggiolo_net" = {
            name                = "acmechallenge"
            ttl                 = 3600
            records             = module.acmechallenge_maggiolo_net_dns.name_servers
            zone_name           = "maggiolo.net"
            resource_group_name = module.avm-res-resources-resourcegroup.name
            tags                = var.tags
        }
    }
    tags                = var.tags
}
```

Since the _acmechallenge.maggiolo.net_ will be automatically managed, I won't create any specific record in there, but only the definition + configure in the second-level domain the nameservers.
Doing so I can guarantee that Certbot can work autonomously without touching precious records in the second-level; furthermore, I still keep track of what domains are managed automatically and which are, instead, manually updated.

## Configure certbot to use Azure

### Sources
* [Configuration of Certbot using Azure DNS](https://docs.certbot-dns-azure.co.uk/en/latest/)

## See everything in action

