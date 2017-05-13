#!/bin/bash

# Initiates a screen session named myServers
screen -dmS myServers

# If your server's hostname follow the pattern server1.mydomain.com, server2.mydomain.com... servern.mydomain.com
# then domain=mydomain.com and hostname_pattern=server
domain="mydomain.com"
hostname_pattern="server"

# SSH port
ssh_port=22

# Iterate. Tune numbers 1 and 100 and 10 according to your servers volume
# {1..100..10} = {start..end..step}
for i in {1..100..10};
        do
                        echo "Opening window to $hostname_pattern$i.$domain"
                        screen -S myServers -X screen $i
                        screen -S myServers -p $i -X stuff 'ssh -p '$ssh_port' -l root -o StrictHostKeyChecking=no '$hostname_pattern$i.$domain''`echo -ne '\015'`
        done

# Reatach to screen session
screen -R myServers
