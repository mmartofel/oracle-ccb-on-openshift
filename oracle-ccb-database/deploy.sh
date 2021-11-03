
# Delete all components of application named oracle-ccb-database at the current project
oc delete all --selector app=oracle-ccb-database

# Prevent Permission denied error as oracle user and group are defined by Oracle as ID 54321
oc adm policy add-scc-to-user privileged -z default

oc apply -f deployment-oracle-ccb-database.yml
oc apply -f service-oracle-ccb-database.yml

