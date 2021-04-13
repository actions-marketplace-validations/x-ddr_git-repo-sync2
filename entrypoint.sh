#!/bin/sh

set -e

if [[ -n "$SSH_KEY" ]]
then
  mkdir -p /root/.ssh
  echo "$SSH_KEY" > /root/.ssh/id_rsa
  echo "$SSH_KEY1" > /root/.ssh/id_rsa1
  mv config /root/.ssh/
  chmod 600 /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa1
  chmod 600 /root/.ssh/config
  ssh-agent bash
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_rsa
fi

mkdir -p ~/.ssh
cp /root/.ssh/* ~/.ssh/ 2> /dev/null || true

sh -c "/gitee.sh $*"
