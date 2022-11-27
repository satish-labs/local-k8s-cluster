#!/bin/bash

brew install lima coreutils kubectl kind docker docker-credential-helper
limactl stop default
limactl delete default
rm -rf ~/.lima
echo -ne '\n' | limactl start --name=default default.yaml
docker context create lima-default --docker "host=unix://${HOME}/.lima/default/sock/docker.sock"
docker context use lima-default
