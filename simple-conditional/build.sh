#!/bin/bash

REGISTRY=ghcr.io/atnog/poliflow-test-applications/simple-conditional
paths=(function-a function-b function-c entry-point)

for p in ${paths[@]}; do
    cd $p
    docker build -t="$REGISTRY/$p" .
    docker push "$REGISTRY/$p"
    cd ../
done
