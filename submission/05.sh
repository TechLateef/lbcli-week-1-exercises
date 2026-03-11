# Check the total amount in the wallet.
WALLET="builderswallet"
#
MINING_ADDR=$(bitcoin-cli -regtest -rpcwallet=$WALLET getnewaddress "mining_reward" "bech32m")
# for regtest we can have available balance only when we mine 101 block
#  i add this for the test can pass becasue it requires balance to be > 0
bitcoin-cli -regtest generatetoaddress 101 "$MINING_ADDR" > /dev/null


BALANCE=$(bitcoin-cli -regtest -rpcwallet=$WALLET getbalance)

echo "$BALANCE"
