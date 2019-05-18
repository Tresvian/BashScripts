#! /bin/bash
# the variables $0 is argv[0], the $@ and $* return all args. argc is $#

if [ $# -lt 2 ]
  then
    echo "Usage: -a to disable. -b to enable."
    exit 1
fi

if [ $1 == '-a' ]
  then
    sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1
    sysctl -w net.ipv6.conf.lo.disable_ipv6=1
    sysctl -p
    exit 0
fi

if [ $1 == '-b' ]
  then
    sysctl -w net.ipv6.conf.all.disable_ipv6=0
    sysctl -w net.ipv6.conf.default.disable_ipv6=0
    sysctl -w net.ipv6.conf.lo.disable_ipv6=0
    sysctl -p
    exit 0
fi
exit 2
