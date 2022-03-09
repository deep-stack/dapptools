#!/bin/bash

# This bash script will setup a local dapptools environment.
# 1. Create a geth binary based on a local repository
# 2. Use docker compose to build ipld-eth-db and dapptools container.
# 3. Start your private blockchain

set -e
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

####################################################################
# Update the variable below to your local vulcanize-geth repo!     #
####################################################################
local_path_to_geth="../go-ethereum-cerc/"
start_path=$(pwd)

if grep "src = ../../geth-linux-amd64"  src/go-ethereum-statediff/default.nix | grep -vq "#"; then
    echo -e "${GREEN}You've properly Updated: src/go-ethereum-statediff/default.nix${NC}"
else
    echo -e "${RED}You need to updated src/go-ethereum-statediff/default.nix based on the documentation!!!${NC}"
    echo -e "${RED}Comment the fetchurl block and reference local geth${NC}"
    exit 1
fi

cd $local_path_to_geth
echo -e "${GREEN}Building geth!${NC}"
docker build -t vulcanize/go-ethereum -f Dockerfile .
docker run --rm --entrypoint cat vulcanize/go-ethereum /usr/local/bin/geth > geth-linux-amd64

echo -e "${GREEN}geth build complete!${NC}"

cd $start_path

mv ${local_path_to_geth}/geth-linux-amd64 .

echo -e "${GREEN}Running docker-compose up${NC}"
docker-compose -f docker-compose.localsetup.yml up --build