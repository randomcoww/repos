### Helm Charts

```bash
helm package <chart_path> -d helm/
helm repo index --url https://randomcoww.github.io/repos/helm helm/
```

New chart should appear in https://randomcoww.github.io/repos/helm/index.yaml

### RPM Packages

Add packages under `rpm/repo/fedora/`

```bash
podman run -it --rm -v $(pwd)/rpm/repo/fedora:/repo fedora

dnf install -y createrepo
createrepo /repo
```