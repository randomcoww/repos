### Helm Charts

Reference: https://github.com/technosophos/tscharts

```bash
helm package <chart_path> -d helm/
helm repo index --url https://randomcoww.github.io/repos/helm helm/
```

New chart should appear in https://randomcoww.github.io/repos/helm/index.yaml

### RPM Packages

Add packages under `fedora/`

```bash
podman run -it --rm -v $(pwd)/fedora:/fedora fedora

dnf install -y createrepo
createrepo /fedora/38/x86_64
```