# Partie 1 : Configuration de GNS3 avec Docker

Pour cette première partie, il faut configurer GNS3 et docker dans notre machine virtuelle.
Il faut ensuite creer deux images docker:
- Une première image avec un système de notre choix contenant au minimum busybox (nous avons choisit Alpine)
- Une seconde image utilisant un système de notre choix avec les contraintes suivantes :
• Un logiciel qui gère le routage de paquets (zebra ou quagga).
• Le service BGPD actif et configuré.
• Le service OSPFD actif et configuré
• Un service de moteur de routage IS-IS.
• Busybox ou une équivalance

Enfin, aucune adresse IP ne doit etre configuree par defaut.

Il faut utiliser les deux images docker dans GNS3 et realiser le schema du sujet et s'y connectant.


Notions:

## GNS3 :
GNS3 (Graphical Network Simulator) est un logiciel libre permettant la simulation de réseaux informatiques.

## Docker :
Docker est une plateforme permettant de lancer certaines applications dans des conteneurs logiciels.
(C'est ce qui va nous permettre de simuler l'existence d'un ordi ou d'un routeur dans notre projet)

## Busybox :
BusyBox est un logiciel qui implémente un grand nombre des commandes standard sous Unix, à l'instar des GNU Core Utilities.

## Alpine :
Alpine Linux est une distribution Linux ultra-légère, orientée sécurité et basée sur Musl (en) et BusyBox, principalement conçue pour un « utilisateur intensif qui apprécie la sécurité, la simplicité et l'efficacité des ressources ».
(Donc tres pratique pour faire des tests, plutot que de prendre une image Ubuntu par exemple)

## Routage de paquets :
Le routage réseau est le processus de sélection d'un chemin à travers un ou plusieurs réseaux.
Le paquet est l'unité de données qui est acheminée entre une origine et une destination sur un réseau.
Les routeurs se réfèrent à des tables de routage internes pour prendre des décisions d'acheminement des paquets le long des chemins du réseau.

## BGP:
Border Gateway Protocol (BGP) est un protocole d'échange de route externe (un EGP), utilisé notamment sur le réseau Internet. Son objectif principal est d'échanger des informations de routage et d'accessibilité de réseaux (appelés préfixes) entre Autonomous Systems (AS).

## OSPF:
Open Shortest Path First (OSPF) est un protocole de routage interne IP de type « à état de liens ».

## ISIS :
IS-IS (Intermediate system to intermediate system) est un protocole de routage interne multi-protocoles à états de lien.



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
```
ifconfig
```

To check which services are activated, do the folloing command in the auxiliary console:
```
ps
```
	
	
	

