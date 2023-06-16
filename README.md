# VM server setup

```
sudo sed -i.bk -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list
sudo apt update ; sudo apt install -y make
```

```
git clone https://github.com/hi120ki/server-setup.git ; cd server-setup
make ansible
make install
```

```
sudo apt purge -y ansible ; sudo apt autoremove -y
python -m pip install --user pipx ; python -m pipx ensurepath ; exec $SHELL -l
pipx install ansible --include-deps
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc ; echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

## Expand disk

```
$ df -h
$ sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
$ sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
```
