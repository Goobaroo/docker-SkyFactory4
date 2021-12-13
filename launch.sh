#!/bin/bash

set -x

cd /data

if ! [[ -f SkyFactory_4_Server_4.2.2.zip ]]; then
	rm -fr config defaultconfigs global_data_packs global_resource_packs mods packmenu
	curl -o SkyFactory_4_Server_4.2.2.zip https://media.forgecdn.net/files/3012/800/SkyFactory-4_Server_4.2.2.zip && unzip -u SkyFactory_4_Server_4.2.2.zip -d /data
	echo "eula=true" > eula.txt
	chmod +x Install.sh
	./Install.sh
fi

if [[ -n "$MOTD" ]]; then
    sed -i "/motd\s*=/ c motd=$MOTD" /data/server.properties
fi
if [[ -n "$LEVEL" ]]; then
    sed -i "/level-name\s*=/ c level-name=$LEVEL" /data/server.properties
fi
if [[ -n "$OPS" ]]; then
    echo $OPS | awk -v RS=, '{print}' >> ops.txt
fi

. ./settings.sh
JVM_OPTS = $JVM_OPTS $JAVA_PARAMETERS
curl -o log4j2_112-116.xml https://launcher.mojang.com/v1/objects/02937d122c86ce73319ef9975b58896fc1b491d1/log4j2_112-116.xml
java -server $JVM_OPTS -Dfml.queryResult=confirm -Dlog4j.configurationFile=log4j2_112-116.xml -jar $SERVER_JAR nogui