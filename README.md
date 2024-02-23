# VM server setup

```
$ sudo apt update ; sudo apt install -y make
$ git clone https://github.com/hi120ki/server-setup.git ; cd server-setup
$ make ansible
$ make install
```

## Expand disk

```
$ df -h
$ sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
$ sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

## Install tailscale

```
$ curl -fsSL https://tailscale.com/install.sh | sh
$ sudo tailscale up
$ sudo tailscale status
```

> If you want to launch an exit node, run `sudo tailscale up --advertise-exit-node`
