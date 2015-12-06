Proxy through an OpenVPN client connection.

## Usage

```console
docker run \
  --name vpn \
  --cap-add=NET_ADMIN \
  --publish 8118:8118 \
  --env VPN_USER=xxx \
  --env VPN_PASS=xxx \
  --env VPN_GATEWAY=ch1.vpn.giganews.com \
  --env VPN_CERTIFICATE=ca.vyprvpn.com.crt \
  --detach \
  pbrisbin/openvpn-proxy
```

**Note**: `VPN_CERTIFICATE` can be an absolute path or relative to
`/etc/openvpn`. If the cert you intend to use is not present on the basic Alpine
system, be sure to pass it in via `--volume`.

```console
% curl ifconfig.me
<your actual public IP>
% http_proxy=http://localhost:8118 curl ifconfig.me
<something completely different>
```
