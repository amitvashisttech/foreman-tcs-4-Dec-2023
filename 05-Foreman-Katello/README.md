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

### 7. Login to katello-foreman instance & update the local resolver file "/etc/hosts"
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
