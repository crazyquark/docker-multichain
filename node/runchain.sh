#!/bin/bash -x

echo "Sleep for 30 seconds so the master node has initialised"
sleep 30

echo "Setup /root/.multichain/$CHAINNAME/multichain.conf"
mkdir -p /root/.multichain/$CHAINNAME
cat << EOF > /root/.multichain/$CHAINNAME/multichain.conf
rpcuser=$RPC_USER
rpcpassword=$RPC_PASSWORD
rpcallowip=$RPC_ALLOW_IP
rpcport=$RPC_PORT
EOF

echo "Start the chain"
multichaind -txindex -printtoconsole -shrinkdebugfilesize $CHAINNAME@$MASTER_NODE:$NETWORK_PORT
