# VM server setup

```
sudo sed -i.bk -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list
```

```
git clone https://github.com/hi120ki/server-setup.git ; cd server-setup
make ansible
make install
```

```
sudo apt purge -y ansible ; sudo apt autoremove -y
pyenv global 3.8.13 ; python -m pip install --user pipx ; python -m pipx ensurepath ; exec $SHELL -l
pipx install ansible --include-deps
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.bashrc ; echo 'export PATH="~/.local/bin:$PATH"' >> ~/.zshrc
```
