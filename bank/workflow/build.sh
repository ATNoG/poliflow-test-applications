#!/bin/bash

# REGISTRY=10.43.142.183:5000/poliflow-test-applications/bank-app
REGISTRY=ghcr.io/<organization>/poliflow-test-applications/bank-app

kubectl delete ksvc workflow -n bank-app
kn workflow quarkus build --image=workflow --jib
docker image tag workflow $REGISTRY/workflow
docker push $REGISTRY/workflow
kn workflow quarkus deploy  --path ./src/main/kubernetes
