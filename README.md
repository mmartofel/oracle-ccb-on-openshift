# Oracle Utilities Customer Care and Billing v2.8

At this repository I collected scripts that can help you to touch base with Oracle Utilities Customer Care and Billing v2.8 and run it on Red Hat OpenShift in the containers.
Scripts make use of Red Hat OpenShift command line utility 'oc' to create required deployments, services and routes.

Login to you desired Red Hat OpenShift cluster, for exmple:

`` oc login --token=sha256~[YOUR_TOKEN] --server=https://[YOUR_API_ROUTE]:6443 ``

then create new project to create CCB containers in:

`` oc new-project oracle ``

Now you are ready to create two containers forming your CCB install.

1. Run Oracle Database container.

First run Oracle Database container populated with demo data of Oracle Utilities Customer Care and Billing v2.8

`` cd ./oracle-ccb-database ``
`` ./deploy.sh ``

your container will start now

![ScreenShot](/screenshots/1.png)

after container will start as well as Oracle Database inside of it, container log should to show like the following

![ScreenShot](/screenshots/2.png)

now your demo database is ready

2. Run Oracle Fussion Middleware container.

Then run Oracle Fussion Middleware container preconfigured to connect to the database created at previous step.

`` cd ./oracle-ccb-infra ``
`` ./deploy.sh ``

your second container will start now

![ScreenShot](/screenshots/3.png)

after container will start as well as Oracle WebLogic inside of it, container log should to show like the following

![ScreenShot](/screenshots/4.png)

now your demo middleware is ready


