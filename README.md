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

## Interface Setup

`/etc/udev/rules.d/70-persistent-net.rules`

```
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:xx:xx:xx:xx:xx", NAME="eth0"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:xx:xx:xx:xx:xx", NAME="eth1"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="00:xx:xx:xx:xx:xx", NAME="eth2"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="f4:xx:xx:xx:xx:xx", NAME="sfp0"
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="f4:xx:xx:xx:xx:xx", NAME="sfp1"
```

`/etc/netplan/00-installer-config.yaml`

```yaml
network:
  ethernets:
    eth0:
      addresses:
        - 192.168.0.10/24
      routes:
        - to: default
          via: 192.168.0.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
    eth1:
      dhcp4: no
    eth2:
      dhcp4: no
    sfp0:
      dhcp4: no
    sfp1:
      dhcp4: no
  bridges:
    br0:
      interfaces: [eth1, eth2, sfp0, sfp1]
      addresses: [10.1.0.1/16]
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
  version: 2
```
