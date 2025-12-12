#!/bin/bash

REGISTRY=ghcr.io/atnog/poliflow-test-applications/loop
paths=(entry-point sample-function result)

for p in ${paths[@]}; do
    cd $p
    docker build -t="$REGISTRY/$p" .
    docker push "$REGISTRY/$p"
    cd ../
done
