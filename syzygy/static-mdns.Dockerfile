from python:3.8.14-bullseye

RUN apt-get update && apt-get install -y libdbus-1-dev libdbus-glib-1-dev \
&& rm -rf /var/lib/apt/lists/*

run pip install mdns-publisher

#cmd bash -c 'cat /cnames & mapfile -t </cnames & echo "Mapping:" "${MAPFILE[@]}" & mdns-publish-cname "${MAPFILE[@]}"'
#cmd ["bash", "-c", 'echo hi']
cmd bash -c 'mdns-publish-cname `cat /cnames`'
