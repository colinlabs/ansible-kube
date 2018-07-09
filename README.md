# Usage

## Install dependencies from ``requirements.txt``

```
sudo pip install -r requirements.txt
```

## Copy ``inventory/sample`` as ``inventory/mycluster``

```
cp -rfp inventory/sample inventory/mycluster
```

## Update Ansible inventory file with inventory builder
modify hosts.ini

## Review and change parameters under ``inventory/mycluster/group_vars``

```
cat inventory/mycluster/group_vars/all.yml
cat inventory/mycluster/group_vars/k8s-cluster.yml
```

## Deploy kubernetes with Ansible Playbook

```
ansible-playbook -i inventory/mycluster/hosts.ini cluster.yml
```

## Deploy with vagrant
modify Vagrantfile

```
vagrant up
ansible-playbook -i inventory/mycluster/hosts.ini cluster.yml
```