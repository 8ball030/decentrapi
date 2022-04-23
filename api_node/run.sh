#! /bin/bash
sudo chown -R $(whoami):$(whoami) ./
cd agent
echo -n $AEA_KEY ethereum_private_key.txt
aea -s run

