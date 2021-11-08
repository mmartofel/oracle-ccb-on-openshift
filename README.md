# Oracle Utilities Customer Care and Billing v2.8

At this repository I collected scripts that can help you to touch base with Oracle Utilities Customer Care and Billing v2.8 and run it on Red Hat OpenShift in the containers.
Scripts make use of Red Hat OpenShift command line utility 'oc' to create required deployments, services and routes.

If you don't have Red Hat OpenShift at your disposal it's easy to get it in form of Azure Red Hat OpenShift (ARO), please have a look at my other repo explaining the process:

[ https://github.com/mmartofel/azure_redhat_openshift ] (https://github.com/mmartofel/azure_redhat_openshift)


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

Now in your oracle-ccb-infra container you need to run NodeManager process using container terminal window (didn't found more convinient way to do that, sorry)

![ScreenShot](/screenshots/5.png)

Correct startup of NodeManager will be reported at the following log file:

`` /u01/oracle/user_projects/domains/ccb_domain/nodemanager/nodemanager.log ``

![ScreenShot](/screenshots/6.png)

Direct your browser to the link reported by deploy.sh script as an Oracle WebLogic Console link.
login credentials are:

`` weblogic / Weblogic123 ``

![ScreenShot](/screenshots/7.png)

Then head to Environment > Servers > Control and Start ccbserver instance.

![ScreenShot](/screenshots/8.png)

ccbserver server startup progress could be followed at the log:

`` /u01/oracle/user_projects/domains/ccb_domain/servers/ccbserver/logs/ccbserver.log ``

After successfull startup of ccbserver you are ready to login to CCB console itself (again the correct link was reported by deploy.sh script back at the point 2), for example:

`` https://oracle-ccb-infra-route-web-oracle.[YOUR_OCP_DOMAIN]/ouaf/loginPage.jsp ``

use demo credentials:

`` SYSUSER / sysuser00 ``

![ScreenShot](/screenshots/9.png)

Enjoy your Oracle CCB demo instance!

![ScreenShot](/screenshots/10.png)

![ScreenShot](/screenshots/11.png)

