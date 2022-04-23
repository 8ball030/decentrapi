#! /bin/bash

cd /home/agents/agent
echo -n $AEA_KEY ethereum_private_key.txt
aea -s run

