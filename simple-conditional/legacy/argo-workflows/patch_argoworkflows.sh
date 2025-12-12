#!/bin/bash
kubectl patch clusterrole argo-cluster-role --type='json' -p='[
  {
    "op": "add",
    "path": "/rules/-",
    "value": {
      "apiGroups": ["argoproj.io"],
      "resources": ["workflowtaskresults"],
      "verbs": ["list", "watch", "deletecollection", "create", "patch"]
    }
  }
]'

kubectl patch clusterrole argo-cluster-role --type='json' -p='[
  {
    "op": "add",
    "path": "/rules/-",
    "value": {
      "apiGroups": ["argoproj.io"],
      "resources": ["workflowtasksets/status"],
      "verbs": ["patch"]
    }
  }
]'

kubectl patch deployment workflow-controller -n argo --type='json' -p='[
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/env/-",
    "value": {
      "name": "DEFAULT_REQUEUE_TIME",
      "value": "1s"
    }
  }
]'

