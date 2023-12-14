
## Install and Configure Puppet Agent

#### Install Puppet Agent Pkg
```
apt-get update 
apt-get install puppet -y 
```

#### Genrate Puppet Agnet Certificate 
```
puppet agent -t --server=katello-foreman.example.com
```

#### On the Master Server List the Agent / Client Certificate 
```
puppetserver ca list
```
```
puppetserver ca sign --certname worker1.example.com
```

#### Now Run the puppet
```
puppet agent -t 
```

