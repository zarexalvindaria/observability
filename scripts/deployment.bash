# Connect to the localhost of the virtual machine
gcloud compute  ssh --ssh-flag="-L 3000:localhost:3000"  --zone "asia-east1-b" "instance-1"

gcloud compute  ssh --ssh-flag="-L 8080:localhost:8080"  --zone "asia-east1-b" "instance-1"



#Install apparmor
sudo zypper --non-interactive install apparmor-parser

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.22.2+k3s2 sh -

#Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.22.2+k3s2 sh -

# Install Prometheus and Grafana
kubectl create ns monitoring
#kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml
#kubectl apply -f https://raw.githubusercontent.com/

prometheus-operator/prometheus-operator/release-0.42/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml



helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo add stable https://kubernetes-charts.storage.googleapis.com # this is deprecated
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --kubeconfig /etc/rancher/k3s/k3s.yaml


kubectl port-forward service/prometheus-grafana --address 0.0.0.0 3000:80 -n monitoring


Access the Grafana using the credentials:
username: admin 
password: prom-operator