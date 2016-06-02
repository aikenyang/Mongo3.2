--create "system user administrator"
use admin
db.createUser(
  {
    user: "siteUserAdmin",
    pwd: "D3sCr3t3!@#",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

--RD user
db.createUser(
  {
    user: "RDUserAdmin",
    pwd: "abcd1234",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)

db.createUser(
  {
    user: "mms",
    pwd: "mms",
    roles: [ { role: "dbOwner", db: "mmsdb" } ]
  }
)

--administrator for a single database
use records
db.createUser(
  {
    user: "recordsUserAdmin",
    pwd: "password",
    roles: [ { role: "userAdmin", db: "records" } ]
  }
)

--account with unrestricted access
--http://docs.mongodb.org/manual/reference/built-in-roles/#root
use admin
db.createUser(
    {
      user: "dbadmin",
      pwd: "D3sCr3t3!@#",
      roles: [ "root","restore" ]
    }
)

use admin
db.createUser(
    {
      user: "rddba",
      pwd: "abcd1234",
      roles: [ "root","restore" ]
    }
)

use admin
db.createUser(
    {
      user: "root",
      pwd: "root",
      roles: [ "root","restore" ]
    }
)

-----
enableLocalhostAuthBypass

setParameter:
   enableLocalhostAuthBypass: true

   
-----MMS monitoring
use admin
db.createUser ( { 
user: "mms",
pwd: "mms",
roles: [ "clusterAdmin", "userAdminAnyDatabase", "clusterMonitor", "dbAdminAnyDatabase" ,"readWriteAnyDatabase" ] 
} )


db.createUser( { user: "ZenMon",
              pwd: "dbmon",
              roles: [ "clusterAdmin",
                       "readAnyDatabase",
                       "dbAdminAnyDatabase"
                     ]
             } 
           )
   
   
-----
mongo --authenticationDatabase admin -u siteUserAdmin -p 'D3sCr3t3!@#'
mongo --authenticationDatabase admin -u dbadmin -p 'D3sCr3t3!@#'
mongo --authenticationDatabase admin -u RDUserAdmin -p abcd1234
mongo --authenticationDatabase admin -u rddba -p abcd1234!

mongo --authenticationDatabase admin -u root -p root

---
xxx mongo --host ipattern-es04.iad1 --authenticationDatabase admin -u ZenMon -p dbmon
mongo admin --host ipattern-mongodb11.iad1 -u root -p root --port 27017
mongo admin -u root -p root