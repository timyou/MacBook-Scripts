#!/bin/bash
# 

echo ""
echo ""
echo "-- Gateway & Routes -----------------------------------"

echo ""
netstat -rn | awk '$3~"UGSc" { a[$2]++ ; b[$2]=$1; c[$2]=$4 } END{ for(x in a) printf "%3d\t%12s\t%s\t%s\n", a[x], x, c[x], b[x] }'
echo ""

echo "-- MAC Address(es)  -----------------------------------"

echo ""
netstat -rn | awk '$1!~/::/ && $3~"LWI" { print }'
echo ""




# G       RTF_GATEWAY      Destination requires forwarding by intermediary
# S       RTF_STATIC       Manually added
# U       RTF_UP           Route usable
#
# 1       RTF_PROTO1       Protocol specific routing flag #1
# 2       RTF_PROTO2       Protocol specific routing flag #2
# 3       RTF_PROTO3       Protocol specific routing flag #3
# B       RTF_BLACKHOLE    Just discard packets (during updates)
# b       RTF_BROADCAST    The route represents a broadcast address
# C       RTF_CLONING      Generate new routes on use
# c       RTF_PRCLONING    Protocol-specified generate new routes on use
# D       RTF_DYNAMIC      Created dynamically (by redirect)
# H       RTF_HOST         Host entry (net otherwise)
# I       RTF_IFSCOPE      Route is associated with an interface scope
# i       RTF_IFREF        Route is holding a reference to the interface
# L       RTF_LLINFO       Valid protocol to link address translation
# M       RTF_MODIFIED     Modified dynamically (by redirect)
# m       RTF_MULTICAST    The route represents a multicast address
# R       RTF_REJECT       Host or net unreachable
# r       RTF_ROUTER       Host is a default router
# W       RTF_WASCLONED    Route was generated as a result of cloning
# X       RTF_XRESOLVE     External daemon translates proto to link address
# Y       RTF_PROXY        Proxying; cloned routes will not be scoped

# netstat -rn | awk '$0!~/::/ && $4!="lo0" { a[$2]++ } END{ for(x in a) print a[x], x }
# netstat -rn | awk '$0!~/:|Gateway|tables/ && $4!="lo0" { a[$2]++ } END{ for(x in a) print a[x], x }'
# netstat -rn | awk '$1!~/::/ && $4!="lo0" && $3~/UH/ { print }' | sort -k1
