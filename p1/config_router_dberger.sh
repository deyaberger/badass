# Enter vty shell
vtysh
# Enter configuration mode:
conf t
# Configure loopback interface:
int lo
ip addr 1.1.1.1/32
# configure ethernet interface:
int eth0
ip addr 10.1.1.1/30
# Enable OSPF process:
router ospf
network 0.0.0.0/0 are 0
# Enable ISIS process:
router isis 1
net 49.0000.0000.0001.00
# Enable ISIS on loopback:
int lo
ip router isis 1
# Enable ISIS on ethernet:
int eth0
ip router isis 1
