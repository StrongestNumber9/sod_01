#!/bin/bash
set -e;
cd /build/workdir/;
./configure --prefix=/opt/teragrep/sod_01/;
make;
make check;
make install DESTDIR=/build/release/;
