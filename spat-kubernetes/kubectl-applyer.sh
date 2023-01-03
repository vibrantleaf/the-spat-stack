#!/usr/bin/env bash
echo "DEBUG: Installing Spat with Kubernetes ..."
echo "DEBUG: Allowing ports with iptables ..."
echo "DEBUG: Allowing spat-traefik's ports ..."
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
echo "DEBUG: Allowing spat-crowdsec's ports ..."
sudo iptables -I INPUT -p tcp -m tcp --dport 808 -j ACCEPT
echo "DEBUG: Allowing spat-authentik's ports ..."
sudo iptables -I INPUT -p tcp -m tcp --dport 9000 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 9443 -j ACCEPT
echo "DEBUG: Saving iptables rules ..."
sudo service iptables save

echo "DEBUG: Running kubectl apply ..."
sudo kubectl apply \
  -f 00-role.yaml \
  -f 00-account.yaml \
  -f 01-role-binding.yaml \
  -f spat-stack-depolyment.yaml

echo "DEBUG: checking spat ..."
echo "DEBUG: checking spat-traefik ..."
curl http://localhost:80/
curl http://localhost:443/
curl http://localhost:8080/
echo "DEBUG: checking spat-crowdsec ..."
curl http://localhost:808/
echo "DEBUG: checking spat-authentik ..."
curl http://localhost:9000/
curl http://localhost:9443/