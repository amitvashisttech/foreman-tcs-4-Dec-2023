

1. Infra -> Smart Proxy -> Puppet -> Environment -> Class -> Import environmemt from foreman. 
2. Config -> Puppet EnC -> Config Groups -> New Group -> Include Classes ( apache & motd ).
3. Config -> Host Groups -> 
   Name: Puppet-Host-Group
   Lifecycle : Dev 
   Content View : CentOS_View_1
   Content Source : katello-forman.example.com
   Environment    : Production
   Puppet Proxy   : katello-forman.example.com
   Puppet CA Proxy : katello-forman.example.com
   Ansible Role  : motd
   Network : 
    - Domain: Example.com
    - Subnet : Foreman(192.168.0.0/24) 

   Operating System: 
    - Architecture : x86_64
    - OS           : CentOS_Stream 8
    - Media        : Synced Content
    - Content      : CentOS8SteamBaseOS
    - Partition Table: Kickstart Default 
    - PXE Loader     : PXELinux BIOS
    - Root Password  : redhat@12345


  Parameters: 
    - kt_activation_key : Your_Activation_Name
 
  Puppent ENC 
    - Select -> Puppet Config Group + Add -> Should be Include 
  
  Location: 
   - Default 
 
  Organiztaion: 
   - Default 

  Activation_Keys: 
   - Select Your Activation Key 

 
Submit.


4. Hosts -> Select ( katello-foreman.example.com) -> Edit -> 
   Update the following 

   Host Group -> 
   Lifecycle Env -> 
   Content View -> 
   Puppet Proxy -> 

   Interface -> Edit -> eth0 -> Unselect the Domain -> Example.com.

Submit


5. Check your foreman-proxy ssh access is working on the katello-foreman host. 
```
ssh -i /var/lib/foreman-proxy/ssh/id_rsa_foreman_proxy root@katello-foreman.example.com
```

6. Hosts -> Select ( katello-foreman.example.com) -> Schedule Job -> Execute Command Script -> Command : ( ls -ltr / ) -> Submit. 


7. Hosts -> Select ( katello-foreman.example.com) -> Schedule Job -> Puppet Run Onec -> Submit. 
