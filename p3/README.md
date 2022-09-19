# Part 3: Decouverte de BGP avec EVPN

usefull commands:
do sh ip route
do sh bgp summary
do sh bgp l2vpn evpn

## BGP-EVPN
BGP is the routing protocol powering the Internet.
EVPN is an extension of BGP that advertise MAC addresses and the remote equipments they are attached to.

## Road reflector
The route reflector (RR) allows all IBGP speakers within your autonomous network to learn about the available routes without introducing loops.

## VTEP
VXLAN endpoints, which terminate VXLAN tunnels and may be either virtual or physical switch ports, are known as VXLAN tunnel endpoints (VTEPs)

## VNI
(virtual network instance) A unique VXLAN network ID

## Type 2 roads
When the connection is with an MAC address (host).

## Type 3 roads
When the connection is with an IP address (router).