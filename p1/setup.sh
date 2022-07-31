#!/bin/bash
sudo usermod -a -G docker bgp
# Pulling a router image with BGP, OSPF and ISIS on (from frrouting + daemons file modified)
docker pull deyaberger/router_dberger
# Pulling a busybox alpine
docker pull alpine
