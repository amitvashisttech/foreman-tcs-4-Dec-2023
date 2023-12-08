## Yum Config with Foreman

#### 1. Login with "root" to newly provisioned VM. 
#### 2. In the "root" home dir, you will find anaconda.ks.cfg which has been gerarted via foreman kickstart installation, check the foreman installation url in the same. 
#### 3. Go to /etc/yum.repo.d/ 
#### 4. Create an old dir & move all the old files in it
```
mkdir old
mv  * old
```

#### 5. Now create a new yum.repo file with following content, only thing you need to resplace is the baseurl, which points to your foreman config view. 
```
[root@john-schoborg ~]# cat /etc/yum.repos.d/yum.repo
[base]
name=CentOS-$releasever - Base
baseurl=http://katello-foreman.example.com/pulp/content/Default_Organization/Dev/MyCentOS-CCV-1/custom/Centos8SteamBaseOS/Centos8SteamBaseOS/
gpgcheck=0
[root@john-schoborg ~]#
```
#### 6. Now you can use yum with foreman.
```
yum install net-tools -y 
```


