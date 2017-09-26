#!/bin/bash

if [ ${MODE} = "master" ]; then
    squid3 -f /etc/squid3/squid_master.conf -z
    squid3 -f /etc/squid3/squid_master.conf -N
else
    squid3 -f /etc/squid3/squid_worker.conf -z
    squid3 -f /etc/squid3/squid_worker.conf -N
fi
