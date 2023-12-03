## Environment Setup 

### Step1 : Open the GitBash / console / cmder / powershell 

### Step2 : cd devops-lab/vagrant-setup/devops

### Step3 : Now check the Vagrant Status 
```
vagrant.exe status 
```

### Step4 : Bring up the master virtalbox instances 
```
vagrant.exe up master
```

### Step5 : Let's Login to master node.
```
vagrant.exe ssh master
```

### Step6 : Become a super user
```
sudo su - 
```

### Step7 : Repositories - Enable Puppet's 7.x repository:

```
sudo apt-get -y install ca-certificates
cd /tmp && wget https://apt.puppet.com/puppet7-release-focal.deb
sudo apt-get install /tmp/puppet7-release-focal.deb
````

### Step 8: Enable the Foreman repositories:
```
sudo wget https://deb.theforeman.org/foreman.asc -O /etc/apt/trusted.gpg.d/foreman.asc
echo "deb http://deb.theforeman.org/ focal 3.8" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 3.8" | sudo tee -a /etc/apt/sources.list.d/foreman.list
```

### Step 9: Downloading the installer
```
sudo apt-get update && sudo apt-get -y install foreman-installer
```

### Step 10: Running the installer - Ensure the FQDN Resolution ( ping $(hostname -f)
```
sudo foreman-installer
```


### Step 11: Wait for the installation to be completed, post complaition will find a messgae like belwo on sceen: 
```
  * Foreman is running at https://theforeman.example.com
      Initial credentials are admin / 3ekw5xtyXCoXxS29
  * Foreman Proxy is running at https://theforeman.example.com:8443
  The full log is at /var/log/foreman-installer/foreman-installer.log
```



 
## Extra Vagrant Command  :
### Bring up a specific virtalbox instances 
```
vagrant.exe status 
vagrant.exe up docker 
```
### Bring down a specific virtalbox instances 
```
vagrant.exe status 
vagrant.exe halt docker 
```

### Destroy a specific virtalbox instances 
```
vagrant.exe status 
vagrant.exe destroy docker 
```
