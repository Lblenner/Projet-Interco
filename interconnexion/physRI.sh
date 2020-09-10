sudo docker network create -d bridge --subnet 120.0.55.0/24 out
sudo docker network connect --ip 120.0.55.2 out RI

sudo docker exec parefeu bash -c "ip route del default;
    /etc/init.d/bgpd restart; " # + bgp


#Redirection vers et depuis l'interface indiqué
ip addr add 120.0.55.2/24 dev $1

iptables -t nat -A PREROUTING -i br-$(docker network ls --filter name=out --quiet) -j DNAT --to 120.0.55.3
iptables -t nat -A PREROUTING -i $1 -j DNAT --to 120.0.55.2