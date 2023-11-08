# VM server setup

```
sudo apt update ; sudo apt install -y make
git clone https://github.com/hi120ki/server-setup.git ; cd server-setup
make ansible
make install
```

## Expand disk

```
$ df -h
$ sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
$ sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```
