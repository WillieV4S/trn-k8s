# Kubernetes segédanyag

Kubernetes példa alkalmazás több felhőszolgáltatóhoz.

Összes segédanyag: https://github.com/cloudsteak/mentor-klub-cloud

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

5. Helyi futtatás
```bash
 docker run -d -p 80:8080 cloudsteak/node-webapp:latest 
```

6. Böngészőben nyisd meg: http://localhost:80



## Kubernetes a különböző felhőszolgáltatóknál

### AKS - Azure

[Azure AKS](./aks/readme.md)
