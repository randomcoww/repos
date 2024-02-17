# Host OCIS chart

```bash
git clone https://github.com/owncloud/ocis-charts

helm package ocis-charts/charts/ocis -d ../../../helm/
helm repo index --url https://randomcoww.github.io/repos/helm ../../../helm/
```