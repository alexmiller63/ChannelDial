# ChannelDial
Find Your Channel

ChannelDial

Find your channel.

ChannelDial is an open-source directory for discovering communities on radio and radio-like communication platforms.

The Problem

Some communication platforms make it remarkably easy to talk with people around the world, but surprisingly difficult to find them.

Zello is a good example.

Zello provides public push-to-talk channels covering many interests, locations, languages, and communities. But discovering those channels can be difficult. If you do not already know the name of a channel, finding a community that interests you may require searching the web, asking other users, or simply getting lucky.

ChannelDial exists to solve that discovery problem.

A radio is much more useful when you know where to tune.

The Idea

ChannelDial is intended to provide a simple, searchable directory of channels.

A user should eventually be able to search for something such as:

* Santa Claus
* amateur radio
* GMRS
* astronomy
* emergency preparedness
* Spanish conversation
* local communities

and discover relevant places to listen and participate.

The goal is not to replace the communities themselves. ChannelDial is simply the dial that helps people find them.

Community Culture

Communication channels are communities, not merely entries in a database.

Different channels develop their own rules, customs, moderators, personalities, and expectations. Some communities also consider promoting other channels during their conversations to be poor etiquette.

ChannelDial should respect those boundaries.

The directory provides neutral ground for discovery. Its purpose is not to enter existing channels and advertise competing communities. Channel information should be contributed and maintained outside the conversations taking place within those channels.

Users who discover a community through ChannelDial remain responsible for learning and respecting that community’s rules and culture.

Starting With Zello

The first ChannelDial directory will focus on public Zello channels.

Zello is a natural starting point because it combines the experience of push-to-talk radio with worldwide Internet connectivity, while its channel-discovery limitations create an immediate need for a directory.

ChannelDial is not affiliated with or endorsed by Zello.

Beyond Zello

ChannelDial is deliberately named for the broader idea of finding something worth tuning into rather than for one particular service.

Future versions could potentially include:

* shortwave radio stations and frequencies
* amateur-radio nets
* amateur-radio repeaters
* GMRS communities and repeaters
* Internet radio
* other push-to-talk networks
* other communication systems where discovery is difficult

The underlying question remains the same:

What can I tune into, and where can I find it?

Version 0.1

ChannelDial begins deliberately small.

There is no database, account system, crawler, API, or web application in Version 0.1.

The first working directory is simply:

channels.md

It contains real channel information in a consistent, human-readable format.

Each entry can contain information such as:

* channel name
* platform
* topic
* language
* region
* description
* date last verified

This gives ChannelDial useful information immediately while establishing a structure that can carry forward into later implementations.

Future Development

If the initial directory proves useful, ChannelDial can grow into a searchable website.

A future implementation may use Laravel and MySQL to provide searching, filtering, community submissions, verification, moderation, and other features.

The public interface should remain simple. People should not need to understand Git, GitHub, pull requests, or software development merely to find or suggest a channel.

GitHub can support the open-source project behind the scenes while ChannelDial provides an ordinary, accessible website for everyone else.

Design Principle

ChannelDial should be designed well from the beginning.

Version 0.1 is deliberately small, but small does not mean provisional or poorly designed. The initial data structure should anticipate the needs of the eventual searchable directory, so that later implementations can build naturally on a sound foundation.

Start small.

Design carefully.

Build on what works.

Status

ChannelDial is at the beginning.

The dial is just starting to turn.

