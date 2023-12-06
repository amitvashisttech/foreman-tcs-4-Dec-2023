## Foreman & Katello Installation 


### 1. Update the existing centos 7 
```
yum update -y ; reboot
```

### 2. Clean All
```
yum clean all 
```

### 3. Install foreman, Katello, Puppet & Relase Repos & Package 
```
yum install https://yum.theforeman.org/releases/3.3/el7/x86_64/foreman-release.rpm -y 
```
```
yum install https://yum.theforeman.org/katello/4.5/katello/el7/x86_64/katello-repos-latest.rpm
```
```
yum install https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
```

```
yum install epel-release centos-release-scl-rh
```

### 4. Run the yum update 
```
yum update -y 
```

### 5. Install the foreman-katello installer utils.
```
yum install foreman-installer-katello -y 
```

### 6. Run foreman-installer with additional parameters:
```
foreman-installer --scenario katello \
--foreman-initial-admin-password redhat@123 \
--foreman-initial-admin-username admin \
--foreman-proxy-dns true \
--foreman-proxy-dns-interface eth2 \
--foreman-proxy-dns-zone example.com
--foreman-proxy-dns-forwarders 192.168.0.1 \
--foreman-proxy-dns-reverse 0.168.192.in-addr.arpa \
--foreman-proxy-dhcp true \
--foreman-proxy-dhcp-interface eth2 \
--foreman-proxy-dhcp-range "192.168.0.100 192.168.0.200" \
--foreman-proxy-dhcp-gateway 192.168.0.1 \
--foreman-proxy-dhcp-nameservers 192.168.0.1 \
--foreman-proxy-tftp true \
--foreman-proxy-tftp-servername $(hostname)
```

### 7. Wait for the install to complete, post the will get login URL. 
