## Firewall

- check status fw
```
$ sudo ufw status
Status: inactive
```

- enable firewall
```
$ sudo ufw enable
Firewall is active and enabled on system startup
$ sudo ufw status
Status: active
```

## Allow setting port forwarding
```
sudo ufw allow 22
```
