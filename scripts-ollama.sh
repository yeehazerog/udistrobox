#!/bin/bash

ln -fs /bin/sh /usr/bin/sh
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
#ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
#ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
#ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update

# Update the container and install packages
apt-get update && apt-get upgrade -y

echo "Install ollama"
curl -fsSL https://ollama.com/install.sh | sh
ollama --version

docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
