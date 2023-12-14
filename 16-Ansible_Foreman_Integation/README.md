# Configuring your Deployment to Run Ansible Roles

### 1. Ansible Required foreman proxy ssh-key public to be gernrated before we enable the plug-in.
```
sudo -u foreman-proxy ssh-keygen -t rsa -f /var/lib/foreman-proxy/ssh/id_rsa_foreman_proxy
```

### 2.Configuring your Deployment to Run Ansible Roles 
	   
In Foreman, you can import Ansible roles to help with automation of routine tasks. To enable the Ansible plug-in in Foreman, enter the following command:

Note: In our case we will be enableing ansible & katello puppet plugin as well.  
```
foreman-installer --scenario katello --foreman-initial-admin-password redhat@123 --foreman-initial-admin-username admin --enable-foreman-proxy --foreman-proxy-dns true --foreman-proxy-dns-interface eth2 --foreman-proxy-dns-zone example.com --foreman-proxy-dns-forwarders 8.8.8.8 --foreman-proxy-dns-forwarders 8.8.4.4 --foreman-proxy-dns-reverse 0.168.192.in-addr.arpa --foreman-proxy-dhcp true --foreman-proxy-dhcp-interface eth2 --foreman-proxy-dhcp-range "192.168.0.100 192.168.0.200" --foreman-proxy-dhcp-gateway 192.168.0.1 --foreman-proxy-dhcp-nameservers 192.168.0.1 --foreman-proxy-tftp true --foreman-proxy-tftp-servername 192.168.0.1 --enable-foreman-cli-ansible --enable-foreman-plugin-ansible --enable-foreman-proxy-plugin-ansible --foreman-proxy-content-enable-ansible true --enable-foreman-plugin-puppet --enable-foreman-cli-puppet --foreman-proxy-puppet true --foreman-proxy-puppetca true --foreman-proxy-content-puppet true --enable-puppet --puppet-server true --puppet-server-foreman-ssl-ca /etc/pki/katello/puppet/puppet_client_ca.crt --puppet-server-foreman-ssl-cert /etc/pki/katello/puppet/puppet_client.crt --puppet-server-foreman-ssl-key /etc/pki/katello/puppet/puppet_client.key 
```

### 3. Ansible paths
  
Foreman imports Ansible roles and variables from paths based on configuration in /etc/ansible/ansible.cfg. Foreman then runs imported roles from paths based on configuration in /etc/foreman-proxy/ansible.cfg. In both cases, Foreman reads the paths from roles_path and collections_path directives. Keep these two cfg files in sync, otherwise you might import roles that cannot be run or you will not see roles you can run.

```
- /etc/ansible/roles

- /usr/share/ansible/roles

- /etc/ansible/collections

- /usr/share/ansible/collections
```

### 4. Importing Ansible Roles and Variables

```
1. In the Foreman web UI, navigate to Configure > Roles.

2. Click Import to select the Smart Proxy from which you want to import.

3. Select the roles that you want to import.

4. Click Submit.
```


### 5. Remote Execution 
```
1. In the Foreman web UI, navigate to hosts > All Hosts.

2. Select the hosts "katello-foreman.example.com"

3. Select Sechedule Remote Job.

4. In the Job Invocaton, fill the following details: 

    - Job Category : Commands 
	- Job Temaplete: Run Commands - SSH Defaults 
	- Search Query : name ^(katello-foreman.example.com)
	- Command      : ls /
5. Click Submit.	

6. Check the Progress of the Job. 

7. For more details, click on the CI name & you will see the output of previous execution. 

8. If DNS Resolution didn't work then, update the /etc/resolve.conf - nameserver to point to foreman proxy ip.  ( nameserver : 192.168.0.1 )

9. ReCall the Password of the Root User or reset 
```
```
passwd
```
``` 
10. Enable Root SSH Password Login. 
```
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/sshd/sshd_config
systemctl restart sshd 
```


11. Copy the ssh public key in the authorized key. 
```
ssh-copy-id -i /var/lib/foreman-proxy/ssh/id_rsa_foreman_proxy.pub root@katello-foreman.example.com
```

12. ReRun the Job - It Should work post SSH Connection.  

11. Now Re-Run the Job. 
