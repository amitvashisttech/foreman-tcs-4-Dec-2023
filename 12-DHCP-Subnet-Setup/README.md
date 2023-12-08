# Add DHCP configuration to Foreman

### Create the subnet 'foreman' and associate Smart proxies



#### 1. Navigate to 'Infrastructure > Smart Proxies'
#### 2. Add the subnet 'foreman' by importing from the Smart Proxy
#### 3. Select 'Import subnets' from the drop down menu next to the Smart Proxy 'katello-foreman.example.com' and in the dialog insert:

#### 4. Subnet tab:
- Name: 'foreman'
- Network address: '192.168.0.0'
- Network mask: '255.255.0.0'
- Gateway address: '192.168.0.1'
- Primary DNS server: '192.168.0.1'
- IPAM: 'DHCP'
- Start of IP range: '192.168.0.100'
- End of IP range: '192.168.0.200'
- Boot mode: 'DHCP'

#### 5. Domain tab:
- Select 'example.com'

#### 6. Proxies tab:
- DHCP Proxy: 'katello-foreman.example.com'
- TFTP Proxy: 'katello-foreman.example.com'
- DNS Proxy: 'katello-foreman.example.com'

#### 7. Press 'Submit' to store the configuration 
