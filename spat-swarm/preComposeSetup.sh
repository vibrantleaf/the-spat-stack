#!/usr/bin/env bash

echo "Generating spat-postgress-user"
tr -dc A-Za-z0-9 </dev/urandom | head -c 32 | sudo docker secret create spat-postgress-user -


echo "Generating spat-postgress-password"
tr -dc A-Za-z0-9 </dev/urandom | head -c 32 | sudo docker secret create spat-postgress-password -


read -sp "Please enter Your Crowdsec Bouncer Api Key" crowdsecBouncerApikeyVar
sudo docker secret create spat-Crowdsec-bouncer-api-key $spatCrowdsecBouncerApikeyVar