#!/bin/bash
sudo usermod -a -G docker bgp
docker pull deyaberger/router_dberger
docker pull alpine
