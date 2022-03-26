# Notes

Namespaces not automatically created for releases: In Helm 2, if you attempted to install a release in a namespace that did not exist, it would create the namespace for you.  Helm 3 now follows kubectl convention by throwing an error message if you attempt to create a release where the namespace does not exist.

```bash
helm search hub nginx

helm registry login -u myuser localhost:5000
helm registry logout localhost:5000

helm package deis-workflow
helm install deis-workflow ./deis-workflow-0.1.0.tgz

helm repo list
helm repo update
helm repo remove
helm repo add brigade https://brigadecore.github.io/charts
helm search repo brigade

helm install foo foo-0.1.1.tgz
helm install foo path/to/foo
helm upgrade --atomic --create-namespace -f override.yaml redis ./redis

helm status happy-panda
helm show values bitnami/wordpress

helm template --debug --dry-run db-apis .
```
