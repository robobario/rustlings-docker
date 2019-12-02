#!/bin/bash
if [ ! -d /opt/rustlings/ ]; then
    echo "oh no, no /opt/rustlings dir"
    exit 1
fi
if [ ! -f /opt/rustlings/.initialised ]; then
    cp -r /rustlings/* /opt/rustlings/
    touch /opt/rustlings/.initialised
fi
cd /opt/rustlings
exec bash -c "rustlings $@"
