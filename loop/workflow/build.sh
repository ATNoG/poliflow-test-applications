#!/bin/bash

REGISTRY=ghcr.io/atnog/poliflow-test-applications/loop

kubectl delete ksvc workflow -n loop
kn workflow quarkus build --image=workflow --jib
docker image tag workflow $REGISTRY/workflow
docker push $REGISTRY/workflow
kn workflow quarkus deploy  --path ./src/main/kubernetes
