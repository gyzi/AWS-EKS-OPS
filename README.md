# AWS EKS Ops

**eks-terraform**

- [Ref to eks-terraform] (eks-terraform/README.md) To Launch EKS Cluster Initialize providers, validate and apply resources files 

**ServiceMesh - Istio**
***https://istio.io/latest/docs/setup/getting-started/***

1. Installing istio 1.14.3  **you can replace PWD with the prefered path for istio location
``` 
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.14.3 TARGET_ARCH=x86_64 sh - 
export PATH="$PATH:$PWD/istio-1.14.3/bin" 
```
2. Validate and install 
```
istioctl x precheck
istioctl install --set profile=default -y
kubectl label namespace default istio-injection=enabled
kubectl apply -f  istio-mesh/samples/addons
#For additional addons kiali - prometheus - granfana
kubectl apply -f  $PWD/istio-1.14.3/samples/addons
#Access kiali - $ istioctl dashboard kiali 
#Access Prometheus - $ istioctl dashboard prometheus
#Access Grafana - $ istioctl dashboard grafana 
```
***uninstall istio***
```
kubectl delete -f istio-mesh/samples/addons
istioctl x uninstall --purge
kubectl label namespace default istio-injection-
kubectl delete namespace istio-system
```
**GitOps - ArgoCD**
***Getting Started***
[ArgoCD Doc](https://argo-cd.readthedocs.io/en/stable/getting_started/)
1. Install ArgoCD 
``` 
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
```
2. Access UI with port-forwarding 
``` kubectl port-forward svc/argocd-server -n argocd 8080:443 ```
3. Get Password - Admin
``` kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo ```

*** Uninstall ****
```
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete ns argocd
```

*** Note over http **
The API server should then be run with TLS disabled. Edit the argocd-server deployment to add the --insecure flag to the argocd-server command, or simply set server.insecure: "true" in the argocd-cmd-params-cm ConfigMap as described here.

**Installing Tools**
1. Installing terraform 
```
wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
unzip terraform_1.0.11_linux_amd64.zip
mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform 
terraform --version
```
2. Installing kubectl && eksctl 
3. Installing helm ***specfied helm 3.6.0 instead of latest - compatibility issues ***
   <url>https://github.com/helm/helm/releases<url> 
```
curl -o helm-3.tar.gz https://get.helm.sh/helm-v3.6.0-darwin-amd64.tar.gz \
&& tar -xf helm-3.tar.gz \
mv darwin-amd64/helm /usr/local/bin/helm \
```
4. Configuring Cert-Manager ``` ```

*** https://portainer.github.io/k8s/charts/portainer/ ***

1. Installing 
``` kubectl create namespace portainer ```
``` helm repo add portainer https://portainer.github.io/k8s/ \
 && helm repo update
 && helm upgrade -i -n portainer portainer portainer/portainer
```
2. Edit svc to ClusterIP Validate and add gw/vs  
```
kubectl edit svc -n portainer portainer
```
