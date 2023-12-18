Foreman Backup Procedure

1.Prepare your backup location:
```
[root@forman ~]# umask 0027;export BDIR=/backup; mkdir $BDIR; chgrp postgres $BDIR; chmod 770 $BDIR; cd $BDIR
```
2. Backup the configuration and data files:
```
[root@foreman backup]# tar --selinux -czvf config_files.tar.gz  /etc/candlepin  /etc/pulp  /etc/pki/katello   /root/ssl-build  /var/www/html/pub/*
```
3. Repositories Backup
```
[root@foreman backup]# tar --selinux -cvf pulp_data.tar /var/lib/pulp /var/www/pub
```

4. Offline Database Backup
```
[root@foreman backup]# tar --selinux -czvf mongo_data.tar.gz /var/lib/mongodb/
[root@foreman backup]# tar --selinux -czvf pgsql_data.tar.gz /var/lib/pgsql/data/
```

5. MongoDB Database Backup
Use online tools to backup the pulp database (MongoDB) while the database is running. Execute the following command in the backup directory
```
[root@foreman backup]# mongodump --host localhost --out $BDIR/mongo_dump
```
6. Katello Service Status
```
[root@foreman ~]# katello-service status
tomcat6 (pid 2902) is running...                           [  OK  ]
mongod (pid  3397) is running...
listening on 127.0.0.1:27017
connection test successful
qpidd (pid  3043) is running...
elasticsearch (pid  2754) is running...
celery init v10.0.
Using config script: /etc/default/pulp_resource_manager
node resource_manager (pid 3522) is running...
celery init v10.0.
Using config script: /etc/default/pulp_workers
node reserved_resource_worker-0 (pid 3585) is running...
celery init v10.0.
Using configuration: /etc/default/pulp_workers, /etc/default/pulp_celerybeat
pulp_celerybeat (pid 3460) is running.
httpd (pid  2999) is running...
dynflow_executor is running.
dynflow_executor_monitor is running.
[root@foreman ~]#
```
