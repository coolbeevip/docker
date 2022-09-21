#!/usr/bin/env bash

PARAM=''
if [ "$JACORB_IOR_PROXY_HOST" == "" ]; then
  JACORB_IOR_PROXY_HOST='localhost'
fi
if [ "$JACORB_IOR_PROXY_PORT" == "" ]; then
  JACORB_IOR_PROXY_PORT=12000
fi

echo 'JACORB_IOR_PROXY_HOST='$JACORB_IOR_PROXY_HOST
echo 'JACORB_IOR_PROXY_PORT='$JACORB_IOR_PROXY_PORT

nohup java \
-Djava.endorsed.dirs=/jacorb-3.9/lib \
-Djacorb.home=/jacorb-3.9 \
-DOAIAddr=0.0.0.0 \
-DOAPort=$JACORB_IOR_PROXY_PORT \
-Djacorb.dns.enable=on \
-Djacorb.ior_proxy_host=$JACORB_IOR_PROXY_HOST \
-Djacorb.ior_proxy_port=$JACORB_IOR_PROXY_PORT \
-Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB \
-Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton \
-Djacorb.naming.purge=on \
-Djacorb.naming.ior_filename=ns.ior \
org.jacorb.naming.NameServer > /dev/null 2>&1&

java -Djava.endorsed.dirs=/jacorb-3.9/lib	\
-Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB \
-Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton \
-Djacorb.log.default.verbosity=4 \
-DORBInitRef.NameService=corbaloc:iiop:0.0.0.0:$JACORB_IOR_PROXY_PORT/NameService \
-Djacorb.dns.enable=on \
-Djacorb.ior_proxy_host=$JACORB_IOR_PROXY_HOST \
-Djacorb.ior_proxy_port=$JACORB_IOR_PROXY_PORT \
-Djacorb.debug.dump_outgoing_messages=on \
-Djacorb.debug.dump_incoming_messages=on \
org.jacorb.notification.ConsoleMain -registerName NotifyEventChannelFactory
