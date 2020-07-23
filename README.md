# Cronjobs

Examples for creating cronjobs on Openshift.

## kiali maistra namespace label matcher

This cronjob will check if the `maistra.io/member-of` and `kiali.io/member-of` labels match across all projects in Openshift.

```sh
export deploy_namespace=default
helm upgrade -i kiali-maistra-labels -n ${deploy_namespace} kiali-maistra-labels
```
