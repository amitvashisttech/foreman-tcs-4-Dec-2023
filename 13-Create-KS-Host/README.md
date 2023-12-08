### Everything is now set up. With the content you have created contained in a content view, and promoted across lifecycles, you can now provision hosts with exactly the content you want to use and subscribe to the updates you want them to receive.

### To create a host in Foreman, navigate to Hosts > Create Host.

#### 1. In the Name field, enter a name for the host.
#### 2. Click the Organization and Location tabs to ensure that the provisioning context is automatically set to the current context.
#### 3. From the Deploy On list, select Bare Metal.
#### 4. Click the Operating System tab.
#### 5. From the Architectures list, select x86_64.
#### 6. From the Operating System list, select CentOS_Stream 8.
#### 7. Check the Build Mode box.
#### 8. For Media Selection, select Synced Content to use the CentOS Stream content you synced previously.
#### 9. From the Synced Content list, ensure that CentOS Stream is selected.
#### 10. From the Partition Table list, for this demo, select Kickstart default, but there are many available options.
#### 11. In the Root Password field, enter a root password for your new host.
#### 12. Click the Interface tab, and click Edit, and add a Mac address.
#### 13. Click the Parameters tab, and ensure that a parameter exists that provides an activation key. If not, add an activation key.
#### 14. Click Submit to save the host entry.



### Now Create a new vm in virtual box

#### 1. Create a new virtual machine in virtual box 
#### 2. Go to Setting -> Configure -> Network -> Disable NAT Adaptor 
#### 3. Go to Setting -> Configure -> Network -> Enable Intenal Nework Adaptor -> Copy the MAC Address, update the same in Foremane -> Host -> Interface Section. 
#### 4. Go to Setting -> System -> Change the Boot Order -> Enable Network Boot & Network Should be the first Option for booting up. 
#### 5. Go to Settings -> System -> Memory -> Should be 3G or Higher ( for the CentOS 8 Installation )
#### 6. Power On the VM -> And wait for the PXE Menu to be Kick In
#### 7. Now you can check the logs on foreman about DHCP Discovery, PXE Render & TFTP Boots. 
