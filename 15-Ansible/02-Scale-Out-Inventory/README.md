Hosts [ Prod & Test]

172.31.0.100 
172.31.0.200 

[web]
172.31.0.101

[db]
172.31.0.102
172.31.0.100

[web:vars]
ansible_user_name = webserver

[db:vars]
ansible_user_name = dbserver 




production 
 - prod_hosts [ALL Prod CI ] [20]
 group_vars
   - all [ username: all_user]
   - web [ username: web_user]
   - db  [ username: db_user]
 host_vars
   -  172.31.0.100 [ username: ansible_user ]



testing 
 - test_hosts [ALL Prod CI ] [10]
 group_vars
   - all [ username: test_all_user]
   - web [ username: test_web_user]
   - db  [ username: test_db_user]
 host_vars
   -  172.31.0.100 [ username: test_ansible_user ]

 
 
ansible all -i prod_hosts -m user -a "name={{username}} password=12345" -b -u vagrant -k 

-> On all the 20 hosts -> all_user will be considred 

ansible all -i prod_hosts -m user -a "name={{username}} password=12345" -b -u vagrant -k 

-> out of 20, on 18 hosts - all_user, the ci belogs db group will have username : db_user , the ci belogs web group will have username : web_user 


ansible all -i prod_hosts -m user -a "name={{username}} password=12345" -b -u vagrant -k 

-> out of 20, on 17 hosts - all_user, the ci belogs db group [102 & 100 ] will have username : db_user , the ci belogs web group will have username : web_user 



ansible all -i prod_hosts -m user -a "name={{username}} password=12345" -b -u vagrant -k 

-> out of 20, on 17 hosts - all_user, the ci belogs db group [102] will have username : db_user , the ci belogs web group will have username : web_user ; max precedence will given to host variable over indvidual group & all group, as a result username variable values is going to be : ansible_user



commands: 
```
ansible all -i hosts -m user -a "name={{username}} password=12345"  -u vagrant -k -b
```