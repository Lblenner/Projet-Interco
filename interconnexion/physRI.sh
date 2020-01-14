sudo docker network create -d bridge --subnet 120.0.53.0/24 out
sudo docker network connect --ip 120.0.53.3 out RI

sudo docker exec parefeu bash -c "ip route del default; " # + bgp


#Redirection vers et depuis l'interface indiqué
sudo iptables -t nat -A POSTROUTING --out-interface $1 -j MASQUERADE  
sudo iptables -A FORWARD --in-interface br-$(docker network ls --filter name=out --quiet) -j ACCEPT

sudo iptables -t nat -A POSTROUTING --out-interface br-$(docker network ls --filter name=out --quiet) -j MASQUERADE  
sudo iptables -A FORWARD --in-interface $1 -j ACCEPT