#!/bin/bash
echo "============================="
set -eo pipefail
shopt -s nullglob
ansible --version
echo "============================="
init_config_path() {
  if [ ! -d "/etc/ansible" ]; then
    mkdir -p /etc/ansible
  fi
}

init_ansible_cfg() {
  if [ ! -d "/etc/ansible/ansible.cfg" ]; then
    echo "Create /etc/ansible/ansible.cfg"
    echo "[defaults]" > /etc/ansible/ansible.cfg
    echo "host_key_checking=false" >> /etc/ansible/ansible.cfg
    echo "command_warnings=false" >> /etc/ansible/ansible.cfg
  else
    echo "Load /etc/ansible/ansible.cfg"
  fi
}

init_ansible_hosts() {
  if [ ! -d "/etc/ansible/hosts" ]; then
    if [ "$ANSIBLE_SSH_HOSTS" != "" ]; then
      echo "Create /etc/ansible/hosts"

      echo "[default]" > /etc/ansible/hosts

      IFS=', ' read -r -a ANSIBLE_SSH_HOSTS_ARRAY <<< $ANSIBLE_SSH_HOSTS
      IFS=', ' read -r -a ANSIBLE_SSH_PORTS_ARRAY <<< $ANSIBLE_SSH_PORTS
      IFS=', ' read -r -a ANSIBLE_SSH_USER_ARRAY <<< $ANSIBLE_SSH_USERS
      IFS=', ' read -r -a ANSIBLE_SSH_PASS_ARRAY <<< $ANSIBLE_SSH_PASSS
      IFS=', ' read -r -a ANSIBLE_SU_PASS_ARRAY <<< $ANSIBLE_SU_PASSS

      for index in "${!ANSIBLE_SSH_HOSTS_ARRAY[@]}"
      do
        NAME=${ANSIBLE_SSH_HOSTS_ARRAY[index]}
        HOST=${ANSIBLE_SSH_HOSTS_ARRAY[index]}
        PORT=${ANSIBLE_SSH_PORTS_ARRAY[index]}
        USER=${ANSIBLE_SSH_USER_ARRAY[index]}
        PASS=${ANSIBLE_SSH_PASS_ARRAY[index]}
        SU_PASS=${ANSIBLE_SU_PASS_ARRAY[index]}
        echo "add hosts $NAME"
        echo "$NAME ansible_ssh_host=$HOST ansible_ssh_port=$PORT ansible_ssh_user=$USER ansible_ssh_pass=$PASS ansible_become_pass=$SU_PASS" >> /etc/ansible/hosts
      done
    fi
  else
    echo "Load /etc/ansible/hosts"
  fi
}

init_config_path
init_ansible_cfg
init_ansible_hosts
exec "$@"
