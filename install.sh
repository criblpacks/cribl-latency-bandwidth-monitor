#!/bin/sh -e

. ./config.sh

echo "Installing mtr and speedtest binaries to $INSTALL_DIR..."
if [ ! -d $INSTALL_DIR ]; then
    mkdir $INSTALL_DIR
fi
curl -Lso $INSTALL_DIR/mtr https://github.com/criblio/latency-bandwidth-monitor-tools/releases/download/0.1.2/mtr
curl -Lso $INSTALL_DIR/speedtest https://github.com/criblio/latency-bandwidth-monitor-tools/releases/download/0.1.2/speedtest
LATEST=$(curl -Ls https://cdn.cribl.io/dl/scope/latest)
curl -Lso $INSTALL_DIR/scope https://cdn.cribl.io/dl/scope/$LATEST/linux/scope
chmod 755 $INSTALL_DIR/scope $INSTALL_DIR/mtr $INSTALL_DIR/speedtest 

echo "Installed Latency and Bandwidth Monitor in $INSTALL_DIR."
