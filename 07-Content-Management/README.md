# Content Management

## Create a Product

### The first step is to create a product in Foreman. The product functions as an internal label to store the CentOS Stream repositories.

### 1. In the Foreman web UI, navigate to Content >Products, and click Create Product.
### 2. In the Name field, enter a name for the product. Foreman automatically completes the Label field based on what you have entered for Name, and this can't be changed later.




## Add the CentOS Stream repositories to the Product

### Now that you have a product, you can use the URLs for the AppStream and BaseOS repositories and add them to your new product.

### 1. In the Foreman web UI, navigate to Content > Products, select the product you want to use, and then click New Repository.
### 2. In the Name field, enter a name for the repository; for example, Centos8StreamBaseOS. Foreman automatically completes the Label field based on what you have entered for Name.
### 3. From the Type list, select the type of repository, and then select Yum.
### 4. In the URL field, enter the URL of the CentOS Stream Baseos repository to use as a source: "http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/"
### 5.Select the Download Policy list. The default is On Demand - this means that Katello will only download metadata. If you want to download all the packages, change to Immediate, which downloads all the packages, which might run into 20-30 GB.
### 6. Click Save.


### Repeat these steps to add the AppStream repositories with URLs, for example, "http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/". Ensure that you use the closest official CentOS mirror instead.

## Sync the Repos.

### 1. To perform an immediate synchronization, in your product window, click Sync Now. 

### 2. The initial synchronization can take some time. You can watch the synchronization status from Content > Sync Status.
