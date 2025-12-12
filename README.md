# PoliFlow Test Applications

This repository holds multiple applications to validate the correct enforcement of PoliFlow allowed paths.
These applications deploy multiple types of workflow states (`loop`, `parallel`, `operation`, `conditional`), allowing for the validation of all the PoliFlow capabilities in respect to extracting and enforcing paths corresponding to their inner logic.
Each application has multiple functions, deployed as Knative Services, with the corresponding allowed paths (extracted using the PoliFlow Extractor for the CNCF Serverless Workflow).
Each application has a workflow built on top of the SonataFlow orchestrator. The workflow descriptors are saved in the `workflow/src/main/resources/` directories of each application.

The applications' workflows and the allowed paths in each Knative Service can be easilly tinkered with to verify if the PoliFlow Enforcer successefully catches any deviation from the intended execution flow.
For example, the user can simply change the allowed paths in a Knative Service to paths that are not achieved by executing the workflow and verify that the Enforcer blocks the execution of the Service.
Or, on the other hand, the user can also "attack" a function, trying to send requests from a specific function's code to another function in the application (simulating an attack for example by changing the source code) and verify that requests are blocked.

## Deployment

To launch each application, the user needs to open a Bash terminal in the corresponding application directory and run:

```bash
kubectl apply -f kubernetes.yaml
kubectl apply -f workflow/src/main/kubernetes/knative.yml
kubectl apply -f workflow/src/main/kubernetes/kogito.yml
```
