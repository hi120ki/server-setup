# VM server setup

```
sudo sed -i.bk -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list
```

```
git clone https://github.com/hi120ki/server-setup.git
sudo apt-add-repository -y -u ppa:ansible/ansible ; sudo apt install -y ansible
ansible-playbook -i local, server-setup/local.yml --ask-become-pass
```
