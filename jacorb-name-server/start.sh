#!/usr/bin/env bash

java -Djava.endorsed.dirs=/jacorb-3.9/lib \
-Djacorb.home=/jacorb-3.9 \
-DOAIAddr=0.0.0.0 \
-DOAPort=12000 \
-Djacorb.dns.enable=off \
-Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB \
-Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton \
-Djacorb.naming.purge=on \
-Djacorb.naming.ior_filename=ns.ior \
org.jacorb.naming.NameServer