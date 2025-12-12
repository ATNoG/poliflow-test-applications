#!/bin/bash

# REGISTRY=10.43.142.183:5000/poliflow-test-applications/simple-parallel
REGISTRY=ghcr.io/<organization>/poliflow-test-applications/simple-parallel
paths=(function-a function-b function-c entry-point result)

for p in ${paths[@]}; do
    cd $p
    docker build -t="$REGISTRY/$p" .
    docker push "$REGISTRY/$p"
    cd ../
done
