#!/bin/sh

. ./config.sh

run_agent() {
    if [ "$SCOPE_CRIBL" = "default" ]; then
        echo "error: SCOPE_CRIBL still default. Please edit config.sh."
        exit 1
    fi
    nohup $INSTALL_DIR/scope watch -i 15s -c $SCOPE_CRIBL -- $INSTALL_DIR/mtr --report -c 5 -i 1 --json --no-dns 8.8.8.8 >/dev/null 2>/dev/null &
    nohup $INSTALL_DIR/scope watch -i 4h -c $SCOPE_CRIBL -- $INSTALL_DIR/speedtest --json >/dev/null 2>/dev/null &
}

case $1 in
    agent)
    run_agent
    ;;

    mtr)
    shift
    eval $INSTALL_DIR/mtr "$@"
    ;;

    speedtest)
    shift
    eval $INSTALL_DIR/speedtest "$@"
    ;;

    *)
    echo "error: invalid input $1"
    echo "usage: run.sh (agent|mtr|speedtest)"
esac
