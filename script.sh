#!/bin/bash

set -e

echo Setting up tmate...

if [ -x "$(command -v brew)" ]; then
  brew install tmate
fi

if [ -x "$(command -v apt-get)" ]; then
  sudo apt-get install -y tmate openssh-client
fi

[ -e ~/.ssh/id_rsa ] || ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""


echo Running tmate...

tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

echo To connect to this session copy-n-paste the following into a terminal:
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

while [ -S /tmp/tmate.sock ]; do
  sleep 1
done


