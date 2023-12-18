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
[root@foreman backup]# tar --selinux -cvf pulp_data.tar /var/lib/pulp /var/www/html/pub
```

4. Offline Database Backup
```
[root@foreman ]# foreman-maintain backup offline /backup 
```

5. Incremental backup
Take 1st incremental backup (this will create a new directory under /tmp/backups to house the new backup, just like the full backup directory):
```
foreman-maintain backup offline --incremental /backup/FULL_BACKUP_DIR /backup
```


6. Sample run of online backup
```
foreman-maintain backup online -y /backup
```

7. Restore Incremental Backups
```
foreman-maintain restore /backups/FULL_BACKUP
foreman-maintain restore -i /backups/FIRST_INCREMENTAL
foreman-maintain restore -i /backups/SECOND_INCREMENTAL
```
