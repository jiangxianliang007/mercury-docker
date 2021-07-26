# mercury-docker

wget https://github.com/nervosnetwork/mercury/blob/main/devtools/config/testnet_config.toml

Modify the ckb_uri address in the configuration file
```
docker run \
 -d -it -p 8118:8116 \
 --name ckb-testnet-mercury \
 -v $PWD/testnet_config.toml:/config/testnet_config.toml \
 -v $PWD/mercury-data:/data/ \
 jiangxianliang/mercury:0.1.0-rc.2 -c /config/testnet_config.toml run
```

https://github.com/nervosnetwork/mercury