#!/usr/bin/env bash

touch /usr/local/etc/step/password.txt /usr/local/etc/step/provisioner-password.txt
chmod 600 /usr/local/etc/step/password.txt /usr/local/etc/step/provisioner-password.txt
chown step:step /usr/local/etc/step/password.txt /usr/local/etc/step/provisioner-password.txt
PASS=$(pwgen -cnyB 23 1)
echo "${PASS}" |tee /usr/local/etc/step/password.txt
PASS=$(pwgen -cnyB 23 1)
echo "${PASS}" |tee /usr/local/etc/step/provisioner-password.txt

export STEPPATH="/usr/local/etc/step/ca"
grep -q STEPPATH ~/.bashrc || \
  echo "export STEPPATH=\"/usr/local/etc/step/ca\"" >> ~/.bashrc

#step ca init --ssh \
#             --name=ca1.linuxi86.net \
#             --dns=ca.linuxi86.net,ca1.linuxi86.net,ca2.linuxi86.net \
#             --address=10.11.12.10:1443 \
#             --password-file=/usr/local/etc/step/password.txt \
#             --provisioner-password-file=/usr/local/etc/step/provisioner-password.txt \
#             --with-ca-url="https://ca.linuxi86.net:1443"
#jeff.schmidt@linuxi86.com
#chown -R step:step /usr/local/etc/step/*
#ln -s /usr/local/etc/step/ca /etc/step #if you're lazy

#sed -i .bak s:templates/:/usr/local/etc/step/ca/templates/: /usr/local/etc/step/ca/config/ca.json
#service step-ca start

