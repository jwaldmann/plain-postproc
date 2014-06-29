#!/bin/bash

rm -rf bin lib

mkdir bin
cp $(which plain-postproc) bin/

mkdir lib
cp  /usr/lib/libgmp.so.3 lib

zip -r plain-postproc.zip process bin/ lib/
