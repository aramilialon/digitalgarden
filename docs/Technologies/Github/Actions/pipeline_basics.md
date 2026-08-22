---
status: done
title: Pipelining this site!
---
# Github Actions: my very first pipeline

Let's see how did I created my very first pipeline!

## Key points
* [I'm lazy, I wanted to have a system that automagically would recompile the website for me](#im-lazy-i-wanted-to-have-a-system-that-automagically-would-recompile-the-website-for-me)
* [First tries of automation](#first-tries-of-automation)
* [Different iterations](#different-iterations)
* [The results](#the-results)

## I'm lazy, I wanted to have a system that automagically would recompile the website for me 

I had the brilliant idea (no, seriously) to use MKDocs to create this wonderful website. The reason behind this choice are:
1. I'm not a web programmer (or better, last time I wrote anything a web programming language was literally a decade ago), so the less code I have to write, the better
1. I would like to be able to host on GIT the source code, so I can apply merges protection (you may never know that by chance I upload something I would not like to be seen)
1. I would like a system that, once the pull request is automated, it automatically handles the publication process on the Web for me

## The results

The results are available here: [Digital Garden's Github workflow](https://github.com/aramilialon/digitalgarden/tree/main/.github/workflows).
I know, there's room for improvement, but the action done are simple:
* Prepare the Github runner with the environment made with:
    * Python
    * Some libraries required by MkDocs and the Material theme
    * MkDocs itself
    * The MkDocs Material theme and a specific plugin
* Checkout the repository and build the site
* Move it to the hosting server and make sure that the latest version is loaded

It's a pretty simple automation, but with this now I'm able to write something wherever I am (even from mobile, even from external computers) thanks to the source code hosted in Github and, once everything is validated with the help of Copilot, I can publish the changes in the website just forgetting how to do that.