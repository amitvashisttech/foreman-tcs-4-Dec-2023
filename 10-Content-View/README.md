# Create and publish a Content View

## In Foreman, a Content View is a snapshot of your repositories at a particular point in time. Content Views provide the mechanism for isolating package versions in a state that you want to preserve. Content Views have a lot of configurable features that you can use for further refinement. For the purposes of this tutorial, let's keep things simple.

  ### Step 1. In the Foreman web UI, navigate to Content > Content Views and click Create New View.
  ### Step 2. In the Name field, enter a name for the view. Foreman automatically completes the Label field from the name you enter.
  ### Step 3. In the Description field, enter a description of the view.
  ### Step 4. Click Save to create the Content View.
  ### Step 5. In your new Content View, click Yum Content > Add Repositories in the Repository Selection area, click Add. For both the BaseOS and Appstream repositories, select packages you want to include, then click Add Repositories.
  ### Step 6. Click Publish New Version and in the Description field, enter information about the version to log changes.
  ### Step 7. Click Save.

### When you click Publish New Version, you create a snapshot of all the content that you have synchronized. This means that every server you subscribe to this Content View will have access only to the package versions in the Content View associated with this lifecycle environment.

### Every new Content View and subsequent versions are published first to the Library environment, where you can then promote to additional environments.


#Promote content across lifecycle environments

## If you have tested new packages and are satisfied that everything is stable, you can promote your Content View to another lifecycle environment.

  ### Step 1. Navigate to Content > Content Views and select the Content View that you want to promote.
  ### Step 2. Click the Versions tab for the Content View.
  ### Step 3. Select the version you want to promote, and in the Actions column, click Promote.
  ### Step 4. Select the environment where you want to promote the Content View and click Promote Version.
  ### Step 5. Click the Promote button again. This time select the lifecycle environment, for example, Test, and click Promote Version.
  ### Step 6. Click on the Promote button again. For example, select the Production environment and click Promote Version.

## The servers that are assigned to that particular environment can now pull from an updated set of packages.
