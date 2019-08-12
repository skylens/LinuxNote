#!/usr/bin/env bash
set -e

while read line; do
    wget ${line}
    sleep 1
done < downloadurl01.txt
