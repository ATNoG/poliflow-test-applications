#!/bin/bash

# ghcr.io/atnog/poliflow-test-applications/simple-conditional
REGISTRY=10.43.142.183:5000/poliflow-test-applications/simple-conditional
paths=(function-a function-b function-c entry-point)

for p in ${paths[@]}; do
    cd $p
    docker build -t="$REGISTRY/$p" .
    docker push "$REGISTRY/$p"
    cd ../
done
