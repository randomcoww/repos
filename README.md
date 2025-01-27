### Deprecated - moved to image build workflows

### Helm Charts

> https://randomcoww.github.io/repos/helm/

```bash
helm package <chart_path> -d helm/
helm repo index --url https://randomcoww.github.io/repos/helm helm/
```
New chart should appear in https://randomcoww.github.io/repos/helm/index.yaml

Reference: https://github.com/technosophos/tscharts

### RPM Packages

> https://randomcoww.github.io/repos/fedora/$releasever/$basearch/

Add packages under `fedora/`

```bash
podman run --rm -v $(pwd)/fedora:/fedora fedora:latest bash -c "dnf install -y createrepo && find /fedora -type d -mindepth 2 -maxdepth 2 -exec createrepo '{}' \;"
```
