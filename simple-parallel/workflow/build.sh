#!/bin/bash

# REGISTRY=10.43.142.183:5000/poliflow-test-applications/simple-parallel
REGISTRY=ghcr.io/atnog/poliflow-test-applications/simple-parallel

kubectl delete ksvc workflow -n simple-parallel
kn workflow quarkus build --image=workflow --jib
docker image tag workflow $REGISTRY/workflow
docker push $REGISTRY/workflow
kn workflow quarkus deploy  --path ./src/main/kubernetes
