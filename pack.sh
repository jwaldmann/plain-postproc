#!/bin/bash

rm -rf bin lib

mkdir bin
cp $(which plain-postproc) bin/

mkdir lib
cp  /lib64/libgmp.so.10 lib

zip -r plain-postproc.zip process bin/ lib/
