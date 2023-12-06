### 1. Power off your existing VM's Form Virtual Box

### 2. Let go to vagrant-setup folder 
```
cd devops-lab\vagrant-setup
```

### 3. Create a new folder "katello-foreman"
```
mkdir katello-foreman
```

### 4. Copy the existing Vagrantfile & bootstrap script from DevOps folder

```
cp -rf ..\devops\Vagrantfile . 
```

### 5. Update the vagrantfile with the OS Type, Memory & VM Name.
```

Name     : katello-foreman
OS / Box : centos/7
Memory   : 9048
```

### 6. Bring up katello-foreman node. 
```
vagrant up katello-foreman
```
### 7. Export the "xterm" 
```
export TERM=xterm >> ~/.bashrc
sourc ~/.bashrc
```


### 8. Login to katello-foreman instance & update the local resolver file "/etc/hosts"
```
vi /etc/hosts
```

Add the following lines 
```
172.31.0.110 katello-foreman.example.com katello-foreman
```

Check the resolutions 
```
hostname -f 
hostname -i 
ping -c2 katello-foreman
```

### 9. Now we need to a new network interface, which will be used for "Internal Network Communication" & for our proxy setup. 

```
1. Power off the VM from Virtual Box 
2. Select the "katello-foreman" --> Settings --> Network --> Adaptor 3 
[*] Enable Network Adapter
    Attached to : "Internal Network"
    Save. 

3. Power on the VM from Virtual Box Only 
```
Note : Don't use vagrant up katello-foreman command, else it will delete the exiting "Internal Network" Interface. 




    
