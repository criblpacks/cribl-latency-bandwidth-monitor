# Latency and Bandwidth Monitor

This repo contains scripts to easily turn any Linux instance into an agent that can monitor internet latency and bandwidth. These scripts wrap around [`mtr`](https://github.com/traviscross/mtr), [`speedtest-go`](https://github.com/showwin/speedtest-go), and [AppScope](https://appscope.dev/). Data is sent to [Cribl.Cloud](https://cribl.cloud) and from there to [Grafana Cloud](https://grafana.com/products/cloud/) for visualization.

# Installation

To setup Latency and Bandwidth Monitor on any Linux instance, simply run `install.sh`:

```
./install.sh
```

This will download `mtr`, `speedtest` and `scope` by default to `$HOME/.lbm`. To run `mtr` or `speedtest`:

```
./run.sh mtr
./run.sh speedtest
```

This will output JSON from both utilities to stdout. To send data to Cribl.Cloud, edit `config.sh` to point to Cribl.Cloud. To get the value for your instance, click copy next to the AppScope TLS source on the `Data Sources` tab in the LogStream Workspace in [Cribl Cloud](https://cribl.cloud). In Config.sh, set `SCOPE_CRIBL` equal to the value you got from Cribl.Cloud. To run in the background, run:

```
./run.sh agent
```


