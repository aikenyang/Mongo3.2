use admin
rsconf = {
           _id: "RS1",
           members: [
                      {
                       _id: 0,
                       host: "dcs-opsmanager-01.sdi.trendnet.org:27017"
                      }
                    ]
         };
rs.initiate(rsconf);

##delay
sleep 10

rs.add("dcs-opsmanager-03.sdi.trendnet.org:27017");
rs.addArb("id-stg-mongo3.dev.cne2.cs-htc.co:27017")

