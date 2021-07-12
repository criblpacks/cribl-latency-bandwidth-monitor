# Latency and Bandwidth Monitor
---

This repo contains scripts to easily turn any Linux instance into an agent that can monitor internet latency and bandwidth. These scripts wrap around [`mtr`](https://github.com/traviscross/mtr), [`speedtest-go`](https://github.com/showwin/speedtest-go), and [AppScope](https://appscope.dev/). Data is sent to [Cribl.Cloud](https://cribl.cloud) and from there to [Grafana Cloud](https://grafana.com/products/cloud/) for visualization.

## Agent Installation

To setup Latency and Bandwidth Monitor data collector on any Linux instance, simply run `install.sh`:

```
./install.sh
```

This will download `mtr`, `speedtest` and `scope` by default to `$HOME/.lbm`. To run `mtr` or `speedtest` CLIs, to see sample human readable output:

```
./run.sh mtr
./run.sh speedtest
```

`run.sh agent` will run `mtr` and `speedtest` in the background, capturing JSON output via [AppScope](https://appscope.dev/) to send to Cribl.Cloud. To setup the agent, we need to edit `config.sh` to point to Cribl.Cloud. To get the value for your instance, click copy next to the AppScope TLS source on the `Data Sources` tab in the LogStream Workspace in [Cribl Cloud](https://cribl.cloud). In Config.sh, set `SCOPE_CRIBL` equal to the value you got from Cribl.Cloud. To run in the background, run:

```
./run.sh agent
```

## Installing this Pack

Install this pack in LogStream by clicking "Configure" then click "Packs". Click "Import from Git / URL" and paste the URL of this repo. Send data to Grafana Cloud by setting up a route to that destination with the following Filter Expression:

```
(proc=='mtr' || proc=='speedtest') && sourcetype=='console'
```

To learn more about routes and configuring LogStream, check out the [LogStream Fundamentals Sandbox](https://sandbox.cribl.io/course/fundamentals).


## Release Notes
---
### Version 0.1.0 - 2021-07-11
Latency & Bandwidth Monitor pack initial release! 

## Contributing to the Pack
---
Discuss this pack on our [Community Slack channel](https://cribl.io/community)

## Contact
---
The author of this pack is Clint Sharp and can be contacted at <clint@cribl.io>.

## License
---
This Pack uses the following license: [`Apache 2.0`](https://github.com/criblio/appscope/blob/master/LICENSE).
