ip addr show eth0
ip -d link show vxlan10
ip -d link show eth1
To open whiteshark: right click on top left link and "start capture"
brctl show


# Partie 2 : Découverte d’un VXLAN

Pour cette deuxieme partie, il s'agit de mettre en place notre premier reseau VXLAN, en dynamique puis en multicast.
Il faudra: un switch, deux routeur et deux hosts.

Il faut configurer ce réseau en utilisant un VXLAN avec pour ID 10, et un nom au choix.
Il faut mettre en place un bridge: br0.
Il faut aussi configurer les interfaces ethernet comme on le souhaite.


Notions:

## VLAN :
Un VLAN, pour Virtual Local Area Network, décrit un type de réseau local. On le traduit en français par réseau local virtuel.
Le VLAN regroupe, de façon logique et indépendante, un ensemble de machines informatiques. On peut en retrouver plusieurs coexistant simultanément sur un même commutateur réseau

## VXLAN :
Pareil que pour le VLAN, a la difference que le VXLAN propose jusqu'a 16 millions d'identifiants  possibles contre seulement 4094 pour le VLAN

## Switch :
Un switch Ethernet se présente sous la forme d’un boîtier doté de ports Ethernet RJ45. Cette solution matérielle assure ainsi la communication, la réception et la redistribution de messages, entre les différents ordinateurs et serveurs d’un même réseau. Contrairement à un hub, le switch opte pour une répartition « intelligente » de l’information. En se basant sur une table d’adressage (adresse MAC et port), il va ainsi redistribuer l’information uniquement aux appareils informatiques concernés. À l’inverse, un hub transmet la donnée à l’ensemble des appareils actifs sur le réseau local.

## Bridge :
Un pont permet de connecter un réseau local (LAN) à un autre réseau local utilisant le même protocole.
Un pont examine chaque message d'un LAN, de façon à transmettre ceux qui s'adressent au même LAN et à faire suivre ceux qui sont destinés à un ou plusieurs autres LAN interconnectés.


## Static vs Dynamique Multicast : 
Static routing uses preconfigured routes to send traffic to its destination, while dynamic routing uses algorithms to determine the best path.


# Configuration:

## 1 - Setup:
```bash
./setup.sh
```
What this setup does:
- pulls image "router_dberger":
Initially created from "frrouting/frr" (containing all the services needed for the exercise) + services BGP, OSPF and ISIS on

- pulls alpine image

launch the p1 projiect on GNS3:
You should see a host_dberger and router_dberger able to run
launch them and change the ip addresses with this configuration:

- Router config:
```bash
vtysh
```
```vtysh
conf t
int lo
ip addr 1.1.1.1/32
int eth0
ip addr 10.1.1.1/30
router ospf
network 0.0.0.0/0 are 0
router isis 1
net 49.0000.0000.0001.00
int lo
ip router isis 1
int eth0
ip router isis 1
```

To see the results:
```
vtysh
```
```
do sh int
do sh isis int
do sh ip ospf int
do sh ip route
```
- configure host:
```
ip addr add 10.1.1.2/30 dev eth0
ip addr add 1.1.1.2/30 dev lo
```
	
	
	


