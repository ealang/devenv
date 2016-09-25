#!/bin/sh
PLAYBOOK=$(if [ -z $1 ]; then echo all.yml; else echo $1; fi)
ansible-playbook $PLAYBOOK -c local --ask-sudo-pass
