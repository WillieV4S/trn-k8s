# AKS 


## Docker image build

```
docker build --tag cloudsteak/node-webapp . --platform linux/amd64
```

## Erőforráscsoportok

#### ACR Resource Group

```bash
az group create --name mentor-acr --location northeurope
```

#### AKS Resource Group

```bash
az group create --name mentor-aks --location northeurope
```

### ACR kezelés

#### ACR létrehozás

```bash
az acr create --resource-group mentor-acr --name mentoracr --sku Basic
  ```


#### Bejelentkezés ACR-be

Már be kell jelentkezve lenned a megfelelő Azure előfizetésbe!

```
az acr login --name mentoracr
```


#### TAG docker images: ACR

```
docker tag cloudsteak/node-webapp:latest mentoracr.azurecr.io/node-webapp:latest
docker tag cloudsteak/node-webapp:latest mentoracr.azurecr.io/node-webapp:1.0
```

#### Kép feltöltése ACR-be

```
docker push mentoracr.azurecr.io/node-webapp:latest
docker push mentoracr.azurecr.io/node-webapp:1.0
```

## AKS Cluster létrehozás

```
az aks create --resource-group mentor-aks --name mentoraks --node-count 1 --generate-ssh-keys --attach-acr mentoracr --node-vm-size Standard_B2ms
```

## AKS cluster credential letöltése

```
az aks get-credentials --resource-group mentor-aks --name mentoraks
```

## AKS cluster kezelés

### Kapcsolódás

```
kubectl get nodes --kubeconfig ~/.kube/config
```

### Létező kapcsolatok lekérdezése

```
kubectl config get-contexts
```

#### Aktuális kapcsolat

```
kubectl config current-context
```

#### Másik kapcsolat aktualizálása

```
kubectl config use-context mentoraks
```

## Alkalmazás létrehozás

### Névtér létrehozás

```
kubectl create namespace live
```

## Alapértelmezett névtér

```
kubectl config set-context --current --namespace=live
```

## Node-WebApp alkalmazás létrehozása

```
kubectl apply -f https://raw.githubusercontent.com/cloudsteak/trn-k8s/main/aks/node-webapp.yaml --namespace live
```

### Monitoring engedélyezése

Ha a következő hibaüzenetet kapjuk: `error: Metrics API not available`

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

### Teljesítmény lekérdezések

```bash
# Node szerverek CPU és Memória használata
kubectl top nodes

# POD-ok CPU és Memória használata
kubectl top pods --all-namespaces
```

### POD-ok lekérdezése egy névtérből

```bash
kubectl -n live get pods
```

### Skálázás

```bash
# Több POD manuálisan
kubectl -n live scale --replicas=5 deployment node-webapp-deployment

# Kevesebb POD manuálisan
kubectl -n live scale --replicas=1 deployment node-webapp-deployment
```

### Minden erőforrás egy névtéren belül

```bash
kubectl -n live get all
```

### Névtér törlése (minden erőforrással együtt!)

```bash
kubectl delete ns live
```