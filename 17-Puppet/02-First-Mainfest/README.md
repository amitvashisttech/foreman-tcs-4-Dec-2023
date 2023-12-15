## Create our Mainfest 

#### 1. Puppet has create a default production environments
```
ls /etc/puppetlabs/code/environments/
```
```
cd /etc/puppetlabs/code/environments/production/mainfests
```

#### 2. Let's create out first mainfest which target nodes. 
```
cat nodes.pp
```
```
node 'katello-foreman.example.com' {
  file {'/etc/motd':
    ensure => 'present',
    content => 'This Host is Managed by Puppet.',
  }
}
```

#### 3. Let's run the puppet in noop to test syntax check. 
```
puppet apply nodes.pp --noop
```


#### 4. Let's run the puppet & make the changes. 
```
puppet apply nodes.pp 
```

#### 5. Managing files
```
[root@puppet manifests]# cat nodes.pp
node 'agent1' {
  file {'/etc/motd':
    ensure => 'present',
    content => 'This Host is Managed by Puppet.',
  }

  file { '/info.txt':
    ensure => 'present',
    content => inline_template("Create by Puppet at <%= Time.now %>\n"),
  }
}
[root@puppet manifests]#
```

#### 6. Managing Packages
```
 package { 'ntp':
   ensure => 'installed',
 }
```

#### 7. Manage Service
```
 service { 'ntpd':
  ensure => 'running',
  enable => 'true',
 }
```
