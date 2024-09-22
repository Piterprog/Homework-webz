# Here are the steps to set up a cluster with Pacemaker and Corosync on Docker containers using Ubuntu 18.04 and Apache2 server, managed by pcs and configure FloatingIP to move between nodes.


pcs status 

pcs property set stonith-enabled=false


pcs resource create FloatingIP ocf:heartbeat:IPaddr2 ip=172.18.0.100 cidr_netmask=16 op monitor interval=30s

pcs constraint location FloatingIP prefers webz-001=INFINITY

pcs constraint location FloatingIP prefers webz-001=100
pcs constraint location FloatingIP prefers webz-002=50
pcs constraint location FloatingIP prefers webz-003=10

pcs constraint


