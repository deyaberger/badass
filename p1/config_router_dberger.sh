ps
vtysh
sh int
conf t
int lo
ip addr 1.1.1.1/32
int eth0
ip addr 10.1.1.1/30
router ospf
network 0.0.0.0/0 are 0
do sh ip ospf neighbor
do sh ip route
router isis 1
net 49.0000.0000.0001.00
int lo
ip router isis 1
int eth0
ip router isis 1
do sh isis int
do sh isis neighbor
