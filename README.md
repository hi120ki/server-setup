# VM server setup

```
sudo sed -i.bk -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list
git clone https://github.com/hi120ki/vm-setup.git
sudo apt update ; sudo apt install -y ansible
ansible-playbook -i local, vm-setup/local.yml --ask-become-pass
```
