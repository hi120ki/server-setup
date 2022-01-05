# VM server setup

```
git clone https://github.com/hi120ki/vm-setup.git
sudo apt update ; sudo apt install -y ansible
ansible-playbook -i local, vm-setup/local.yml --ask-become-pass
```
