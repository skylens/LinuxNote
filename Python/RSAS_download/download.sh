#!/usr/bin/env bash
set -e

for url in `cat ./downloadurl.txt`
do
    aria2c $url
done
