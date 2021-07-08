#!/bin/sh

. ./config.sh

mtr_cmd() {
    echo $INSTALL_DIR/mtr --report -c 5 -i 1 --json --no-dns 8.8.8.8
}

speedtest_cmd() {
    echo $INSTALL_DIR/speedtest --json
}

run_mtr() {
    echo "Running $(mtr_command)"
    eval $(mtr_cmd)
}

run_speedtest() {
    echo "Running $(speedtest_cmd)"
    eval $(speedtest_cmd)
}

run_agent() {
    if [ "$SCOPE_CRIBL" = "default" ]; then
        echo "error: SCOPE_CRIBL still default. Please edit config.sh."
        exit 1
    fi
    nohup $INSTALL_DIR/scope watch -i 15s -c $SCOPE_CRIBL -- $(mtr_cmd) >/dev/null 2>/dev/null &
    nohup $INSTALL_DIR/scope watch -i 4h -c $SCOPE_CRIBL -- $(speedtest_cmd) >/dev/null 2>/dev/null &
}

case $1 in
    agent)
    run_agent
    ;;

    mtr)
    run_mtr
    ;;

    speedtest)
    run_speedtest
    ;;

    *)
    echo "error: invalid input $1"
    echo "usage: run.sh (agent|mtr|speedtest)"
esac
