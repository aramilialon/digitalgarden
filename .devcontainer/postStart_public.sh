#!/bin/bash
pipx install mkdocs-material[imaging] --include-deps
sudo apt-get update
sudo apt-get -y install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean