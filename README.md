# [SkyFactory 4 Server](https://www.curseforge.com/minecraft/modpacks/skyfactory-4/files)
<!-- MarkdownTOC autolink="true" indent="  " markdown_preview="github" -->

- [Description](#description)
- [Requirements](#requirements)
- [Options](#options)
- [Adding Minecraft Operators](#adding-minecraft-operators)
- [Source](#source)

<!-- /MarkdownTOC -->

## Description

I attempted to make a container that could upgrade so this does require persistant storage.

The docker on first run will download the same version as tagged of SkyFactory 4 and install it.  This can take a while as the Forge installer can take a bit to complete.  You can watch the logs and it will eventually finish.

After the first run it will simply start the server.

## Requirements

* /data mounted to a persistent disk

## Options

These environment variables can be set at run time to override their defaults.

* JVM_OPTS "-Xms2048m -Xmx4096m"
* MOTD "A Minecraft (SkyFactory 4 v4.2.2) Server Powered by Docker"
* LEVEL world

## Adding Minecraft Operators

Set the enviroment variable `OPS` with a comma separated list of players.

example:
`OPS="OpPlayer1,OpPlayer2"`

## Source
Github: https://github.com/Goobaroo/docker-SkyFactory4
Docker: https://hub.docker.com/repository/docker/goobaroo/skyfactory4