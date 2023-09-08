#!/bin/bash

set -ex

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends ansible git sudo

GITDIR="/tmp/private-isu"
rm -rf ${GITDIR}
git clone --depth=1 https://github.com/catatsuy/private-isu.git ${GITDIR}
cd ${GITDIR}/provisioning/
ansible-playbook -i hosts -c local image/ansible/playbooks.yml --skip-tags nodejs -e 'allinone=True'

rm -rf ${GITDIR}
apt-get purge -y git ansible
apt-get autoremove -y

cat > /etc/wsl.conf <<EOF
[boot]
systemd = true

[user]
default = isucon
EOF
#
