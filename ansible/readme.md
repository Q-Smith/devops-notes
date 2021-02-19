# Installation

```bash
python get-pip.py
pip3 install docker docker-compose
pip3 install ansible
pip3 install "ansible-lint[yamllint]"
ansible-galaxy collection install -r requirements.yml
```

```bash
ansible-inventory -vvv -i hosts.ini --list
ansible-inventory -vvv -i hosts.ini --graph
ansible-config dump
ansible local -i hosts -m ping
```

# Playbooks

```bash
ansible-lint -v playbook.yml
ansible-playbook -i hosts.ini playbook.yml
```

# Notes

"Roles" are special kind of "Playbooks"
"Playbooks" contain "plays"
"Plays" contain "tasks"
"Tasks" call "modules"

"Tasks" run sequentially

"Handlers" are triggered by "tasks" and run once at end of "plays"

"Modules" structure
module: directive1=value directive2=value

# Research

- https://docs.ansible.com/ansible/2.10/collections/index_module.html
- https://docs.ansible.com/ansible/devel/porting_guides/porting_guide_2.10.html
