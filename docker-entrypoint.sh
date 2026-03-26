#!/bin/bash
set -e;
cd /build/workdir/;
./configure;
make;
make check;
make install PREFIX=/opt/teragrep/sod_01/ DESTDIR=/build/release/;
