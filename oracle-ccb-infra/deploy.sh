
# Delete all components of application named oracle-ccb-infra at the current project
oc delete all --selector app=oracle-ccb-infra

# Prevent (AlreadyExists) error after deleting weblogic project and creating it again
sleep 10

# Prevent Permission denied error as weblogic user and group are defined by Oracle as ID 1000
oc adm policy add-scc-to-user privileged -z default

oc apply -f deployment-oracle-ccb-infra.yml
oc apply -f service-oracle-ccb-infra.yml
oc apply -f route-oracle-ccb-infra-admin.yml
oc apply -f route-oracle-ccb-infra-web.yml

ROUTE_ADMIN=`oc get route oracle-ccb-infra-route-admin -o template --template='{{ .spec.host }}'`
ROUTE_CCB=`oc get route oracle-ccb-infra-route-web -o template --template='{{ .spec.host }}'`

echo
echo Now you are ready to visit your new Oracle WebLogic v12.2.1.4 console at:
echo 
echo https://${ROUTE_ADMIN}/console
echo
echo Login as: weblogic / Weblogic123
echo
echo NOTICE: your admin account and password are fixed as well as DOMAIN_NAME which is ccb_domain.
echo

echo
echo Before you start with Oracle CCB you need to:
echo - start NodeManager using script /home/oracle/start-node-manager.sh
echo - start server ccbserver at the ccb_domain wls domain from WebLogic admin console
echo after couple of minutes you are ready to login to CCB at:
echo 
echo https://${ROUTE_CCB}/ouaf/cis.jsp
echo
echo Login as: SYSUSER / sysuser00
echo
echo NOTICE: database is populated with demo data delivered by Oracle
echo