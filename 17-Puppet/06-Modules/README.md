# Puppet Modules Development


## Install PDK for Puppet Dev. 

### For Ubuntu  
```
wget https://apt.puppet.com/puppet-tools-release-focal.deb
sudo dpkg -i puppet-tools-release-focal.deb
sudo apt-get update
sudo apt-get install pdk -y 
```

### For Redhat 
```
sudo rpm -Uvh https://yum.puppet.com/puppet-tools-release-el-7.noarch.rpm
sudo yum install pdk
```

### Genrate Module
```
pdk new module motd
```


### Build Puppet Modules
```
cd modules/motd 
pdk build 

ls pkg/y-motd-0.1.0.tar.gz
```

### Apply Modules 
```
puppet apply nodes.pp 
```
