# Kubernetes segédanyag

Kubernetes példa alkalmazás több felhőszolgáltatóhoz.

Segédanyagok:

- https://github.com/cloudsteak/trn-node-docker-demo/blob/main/docs/docker-alapok.md
- https://github.com/cloudsteak/trn-node-docker-demo/blob/main/aks/readme.md
- https://github.com/cloudsteak/trn-node-docker-demo


## Docker image (kép készítése)

1. Klónozd le ezt a repository-t. `https://github.com/cloudsteak/trn-k8s.git`
2. Docker Desktop telepítési link (Mac, Linux, Windows): https://www.docker.com/products/docker-desktop
3. Futtasd az alábbi parancsokat, a megfelelő kiegészítő adatokkal

```bash
docker build --tag cloudsteak/node-webapp --platform linux/amd64 .
```
4. Ellenőrizd a végeredmélnyt

## Kubernetes a különböző felhőszolgáltatóknál

### AKS - Azure

